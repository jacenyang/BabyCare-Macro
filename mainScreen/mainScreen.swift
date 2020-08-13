//
//  mainScreen.swift
//  BabyCare-MC3
//
//  Created by Ivan Winata on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class mainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tipsTable: UITableView!
    @IBOutlet weak var tblHeight: NSLayoutConstraint!
    
    @IBOutlet weak var lblKondisi: UILabel!
    
    
    @IBOutlet weak var lblkondisidenyut: UILabel!
    @IBOutlet weak var lbldenyut: UILabel!
    @IBOutlet weak var lblDetak: UILabel!
    @IBOutlet weak var lblParameter: UILabel!
    @IBOutlet weak var lblSikon: UILabel!
    @IBOutlet weak var lblSuhu: UILabel!
    let judul = ["tips hadapi demam", "tips hadapi hipotermia"]
    var picts:[String] = []
     var dataAPI = [feeds2]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblSikon.text = "Suhu Tubuh"
        self.lblDetak.text = "Denyut Jantung"
        self.lbldenyut.text = "86"
        fetchAPIthinkSpeak{
                         DispatchQueue.main.async {
                       
        
                                        
                                        let myint = Double(self.lblSuhu.text!)
                                      
                                        

                                                                       if (myint! > 37)
                                                                          {
                                                                              self.lblKondisi.text = "Sedang Demam Tinggi"
                                                                          }
                                                                          else
                                                                          {
                                                                            self.lblKondisi.text = "Suhu Anda Normal"
                                                                          }
                            
                            
                            let mydenyut = Double(self.lbldenyut.text!)
                            
                              

                                                             if (mydenyut! > 110)
                                                                {
                                                                    self.lblkondisidenyut.text = "Tidak Normal"
                                                                }
                                                                else
                                                                {
                                                                  self.lblkondisidenyut.text = "Sedang Normal"
                                                                }
                         }
                         
                     }
        tipsTable.delegate = self
        tipsTable.dataSource = self
        
        self.tipsTable.backgroundColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        self.tipsTable.separatorStyle = .none
        
        
       
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
                    self.lblSuhu.text = (thinkSpeakData.feeds.last?.field1)
                    //self.lbldenyut.text = (thinkSpeakData.feeds.first?.field2)
                    
                   onSuccess()
                   
                   
                    
                    
                                  
                }
               
                
                
                
                
                
                
                
                
            } catch let err {
                print("error", err)
            }
        }.resume()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tipsTable.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
                cell.selectionStyle = .none
                cell.judul.text = judul[indexPath.section]
    //            cell.img.image = picts[indexPath.row]
                return cell
            }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            judul.count
        }
    //
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 170
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 10
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 10
        }
        
        func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            view.tintColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        }
        
        func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
            view.tintColor = UIColor(red: 0.93, green: 0.95, blue: 0.95, alpha: 1.00)
        }
        func tableView(_ tableView: UITableView, willDisplaycell: UITableViewCell, forRowAt indexPath: IndexPath) {
            tblHeight.constant = tipsTable.contentSize.height
        }
}



    


