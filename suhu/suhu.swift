//
//  suhu.swift
//  BabyCare-MC3
//
//  Created by Ivan Winata on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit
import Charts
class suhu: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataAPI = [feeds2]()
    let animal = ["cat","dog"]
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var listchartview: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        
        fetchAPIthinkSpeak{
            DispatchQueue.main.async {
                self.tblView.reloadData()
                //print(self.dataAPI)
                self.setChartValues()
            }
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    func setChartValues(_ count : Int = 20) {
        let values = (0..<count).map { (i) -> ChartDataEntry in
            let val = Double(arc4random_uniform(UInt32(count)) + 3)
            return ChartDataEntry(x: Double(i), y: val)
        }
        var arr : [ChartDataEntry] = []
        var i = 0
        for da in dataAPI{
            let d = Double("\(da.field1 ?? "0.0")")
            arr.append(ChartDataEntry(x: Double(i), y: d ?? 0.0))
            i+=1
        }
        print(arr)
        let set1 = LineChartDataSet(entries: arr, label: "Suhu")
        
        set1.axisDependency = .left
        set1.setColor(UIColor(red: 56/255, green: 87/255, blue: 81/255, alpha: 1))
        set1.setCircleColor(UIColor(red: 56/255, green: 87/255, blue: 81/255, alpha: 1))
        set1.lineWidth = 2
        set1.circleRadius = 3
        set1.fillAlpha = 65/255
        set1.fillColor = UIColor(red: 56/255, green: 87/255, blue: 81/255, alpha: 1)
        set1.highlightColor = UIColor(red: 56/255, green: 87/255, blue: 81/255, alpha: 1)
        set1.drawCircleHoleEnabled = false
        
        let data = LineChartData(dataSet: set1)
        
        self.listchartview.data = data
    }
    func fetchAPIthinkSpeak( onSuccess : @escaping () -> Void){
        guard let apiURL = URL(string: "https://api.thingspeak.com/channels/1116535/feeds.json?api_key=3W5C5093JVUEH036") else{return}
        URLSession.shared.dataTask(with: apiURL) {(data, response, error) in
            
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let thinkSpeakData = try decoder.decode(ThinkSpeakAPI2.self, from: data)
                //print(thinkSpeakData.feeds)
                self.dataAPI = thinkSpeakData.feeds ?? []
                //print(self.dataAPI)
                
                // print(thinkSpeakData.channel?.name)
                
                //    print("ini data yang pertama", thinkSpeakData.feeds?.first)
                //  print("ini data yang terakhir", thinkSpeakData.feeds?.last)
                DispatchQueue.main.async {
                    //self.lbltampil.text = (thinkSpeakData.feeds.last?.field1)
                    // self.lblPulse.text = (thinkSpeakData.feeds.last?.field2)
                    onSuccess()
                }
                
                
                
                
                
                
                
                
                
            } catch let err {
                print("error", err)
            }
        }.resume()
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAPI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! SuhuTableViewCell
        
        let suhuDouble = Double(dataAPI.reversed()[indexPath.row].field1!)
        let suhuString = String(format: "%.1f", suhuDouble!)
        cell.angkaLabel.text = suhuString
        
        let tanggal = dataAPI.reversed()[indexPath.row].created_at
        let splits = tanggal?.components(separatedBy: "T")
        //cell.tanggalLabel.text = dataAPI[indexPath.row].created_at
        cell.tanggalLabel.text = splits![0]
        
        return cell
    }
    
    
    
}
