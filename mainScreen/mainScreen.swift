//
//  mainScreen.swift
//  BabyCare-MC3
//
//  Created by Ivan Winata on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class mainScreen: UIViewController{

    @IBOutlet weak var lblKondisi: UILabel!
    
    
    @IBOutlet weak var lblkondisidenyut: UILabel!
    @IBOutlet weak var lbldenyut: UILabel!
    @IBOutlet weak var lblDetak: UILabel!
    @IBOutlet weak var lblParameter: UILabel!
    @IBOutlet weak var lblSikon: UILabel!
    @IBOutlet weak var lblSuhu: UILabel!
    @IBOutlet weak var demam: UIImageView!
    @IBOutlet weak var gambar2: UIImageView!
    
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
}



    


