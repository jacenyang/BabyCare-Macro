//
//  detakJantung.swift
//  BabyCare-MC3
//
//  Created by Ivan Winata on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class detakJantung: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    var dataAPI = [feeds2]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
               tblView.dataSource = self
        
        fetchAPIthinkSpeak{
                   DispatchQueue.main.async {
                       self.tblView.reloadData()
                       //print(self.dataAPI)
                      // self.setChartValues()
                   }
                   
               }
        // Do any additional setup after loading the view.
    }
    
    func fetchAPIthinkSpeak( onSuccess : @escaping () -> Void){
        guard let apiURL = URL(string: "https://api.thingspeak.com/channels/1111876/feeds.json?") else{return}
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
              
              let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
              
           cell.textLabel?.text = dataAPI[indexPath.row].field1
              
              return cell
          }
       
}
