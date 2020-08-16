//
//  mainScreen.swift
//  BabyCare-MC3
//
//  Created by Ivan Winata on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit
import CoreData

class mainScreen: UIViewController{

let appDelegate = UIApplication.shared.delegate as! AppDelegate
var DataEstimasis = [DateEstimasi]()
var dateData = [DataModel]()
    
    @IBOutlet weak var lblKondisi: UILabel!
    
    @IBOutlet weak var lblUsiaKoreksi: UILabel!
    
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
        
        self.TampilLabelUmur()
        //read data from core data
        //self.loadData()
        
        //print date
        //print(dateData.estimasiDate)
        
        //create data
        //dateData.estimasiDate = Date()
        
        //Save date
        //self.saveData()
        
        
        
        self.lblSikon.text = "Suhu Tubuh"
        self.lblDetak.text = "Denyut Jantung"
        
        fetchAPIthinkSpeak{
                         DispatchQueue.main.async {
                       
        
                                        
                                        let myint = Double(self.lblSuhu.text!)
                                      
                                        

                                                                       if (myint! >= 37)
                                                                          {
                                                                              self.lblKondisi.text = "Sedang Demam Tinggi"
                                                                          }
                                                                          else
                                                                          {
                                                                            self.lblKondisi.text = "Suhu Anda Normal"
                                                                          }
                            
                            
                            let mydenyut = Double(self.lbldenyut.text!)
                            
                              

                                                             if (mydenyut! > 60-100)
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
                    self.lbldenyut.text = (thinkSpeakData.feeds.last?.field2)
                    
                   onSuccess()
                         
                }
                    
            } catch let err {
                print("error", err)
            }
        }.resume()
        
        
    }
    
    func TampilLabelUmur(){
        retrieve()
        
        
        
    }
    
//    func saveData(){
//        let context = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.insertNewObject(forEntityName: "DateEstimasi", into: context)
//        
//        entity.setValue(dateData.estimasiDate, forKey: "estimasiDate")
//    }
//    
//    func loadData() {
//        let context = appDelegate.persistentContainer.viewContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DateEstimasi")
//        do{
//            do{
//                let result = try context.fetch(request)
//                
//                if result.isEmpty{
//                    print("KOSONG")
//                    saveData()
//                }else{
//                    
//                    let take = result [0] as! NSManagedObject
//                    
//                    guard let date = take.value(forKey: "estimasiDate") else{
//                        return
//                    }
//                  dateData.estimasiDate = date as? Date
//                }
//            }
//            catch{
//                print(error)
//            }
//    }
//}
    func retrieve(){
           
           var tanggalCoDa = [DataModel]()
           
           // referensi ke AppDelegate
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           
           // managed context
           let managedContext = appDelegate.persistentContainer.viewContext
           
           // fetch data
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DateEstimasi")
           
           do{
               let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
               result.forEach{ tanggalCoDain in
                   tanggalCoDa.append(
                       DataModel(estimasiDate: tanggalCoDain.value(forKey: "estimasiDate") as! Date)
                   )
                   
                   print("ini result Retrive \(tanggalCoDain.value(forKey: "estimasiDate") as! Date)")
                   let TanggalEstimasiLahir = tanggalCoDain.value(forKey: "estimasiDate") as! Date
                   print("ini data dari Coredata?")
                   let hariini = Date()
                   let calendar = Calendar.current
                   let components = calendar.dateComponents([.year, .month, .day], from: TanggalEstimasiLahir , to: hariini)
                           //let ageYears = components.year
                   let ageMonths = components.month
                   let ageDays = components.day
                   self.lblUsiaKoreksi.text = " Usia koreksi \(ageMonths!) bulan, \(ageDays!) hari"
                   
               }
           }catch let err{
               print(err)
           }
           
           return
}



    

}
