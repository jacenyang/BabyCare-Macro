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
    
    @IBOutlet weak var catatanLabel: UILabel!
    @IBOutlet weak var lblkondisidenyut: UILabel!
    @IBOutlet weak var lbldenyut: UILabel!
    @IBOutlet weak var lblDetak: UILabel!
    @IBOutlet weak var lblParameter: UILabel!
    @IBOutlet weak var lblSikon: UILabel!
    @IBOutlet weak var lblSuhu: UILabel!
    @IBOutlet weak var demam: UIImageView!
    @IBOutlet weak var gambar2: UIImageView!
    
    @IBOutlet weak var lblcoba2: UILabel!
    @IBOutlet weak var lblcoba1: UILabel!
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
                       
        
                                        
                                        let myint = Double(self.lblcoba1.text!)
                                        let myrouded = ((myint! * 100).rounded() / 100)
                                        self.lblSuhu.text = "\(myrouded)"

                                                                       if (myint! >= 37)
                                                                          {
                                                                              self.lblKondisi.text = "Suhu bayi anda sangat tinggi"
                                                                            self.lblSuhu.textColor = UIColor.red
                                                                            
                                                                          }
                                                                          else if (myint! > 35 && myint! <= 36)
                                                                          {
                                                                            self.lblKondisi.text = "Suhu bayi anda normal"
                                                                       } else {
                                                                        self.lblKondisi.text = "Suhu bayi anda sangat rendah"
                                                                        self.lblSuhu.textColor = UIColor.red
                                                                        
                            }
                            
                            
                            let mydenyut = Double(self.lblcoba2.text!)
                            let myroude = ((mydenyut! * 100).rounded() / 100)
                            self.lbldenyut.text = "\(myroude)"
                              

                                                             if (mydenyut! > 160)
                                                                {
                                                                    self.lblkondisidenyut.text = "Detak jantung bayi anda terlalu cepat"
                                                                    self.lbldenyut.textColor = UIColor.red
                                                                }
                                                                else if (mydenyut! >= 120 && mydenyut! < 160)
                                                                {
                                                                  self.lblkondisidenyut.text = "Detak jantung bayi anda normal"
                                                             } else {
                                                                self.lblkondisidenyut.text = "Detak jantung bayi anda terlalu lemah"
                                                                self.lbldenyut.textColor = UIColor.red
                                                                
                            }
                            
                            if (myint! > 37 && mydenyut! > 160) {
                                   self.catatanLabel.text = "Jantung berdetak cepat dan suhu sangat tinggi, segera periksa ke dokter!"
                                //content.body = self.catatanLabel.text!
                                self.getNotificationTinggi()
                               } else if (myint! > 37 && (mydenyut! >= 120 && mydenyut! <= 160)) {
                                   self.catatanLabel.text = "Suhu bayi sangat tinggi, segera periksa ke dokter!"
                                self.getNotificationSuhu()
                               } else if (myint! > 37 && mydenyut! < 120){
                                   self.catatanLabel.text = "Suhu bayi sangat tinggi dan detak jantung melemah, segera periksa ke dokter!"
                                self.getNotificationSuhu()
                                } else if ((myint! >= 35 && myint! <= 37) && mydenyut! > 160) {
                                   self.catatanLabel.text = "Detak jantung berdetak sangat cepat, segera periksa ke dokter!"
                                //content.body = self.catatanLabel.text!
                                self.getNotificationDetak()
                                } else if ((myint! >= 35 && myint! <= 37) && (mydenyut! >= 120 && mydenyut! <= 160)) {
                                   self.catatanLabel.text = "Suhu dan detak jantung bayi normal. Selalu jaga kesehatan bayi ya!"
                                //content.body = self.catatanLabel.text!
                                } else if ((myint! >= 35 && myint! <= 37) && mydenyut! < 120) {
                                   self.catatanLabel.text = "Detak jantung melemah, Segera periksa ke dokter!"
                                //content.body = self.catatanLabel.text!
                                self.getNotificationDetak()
                                } else if (myint! < 35 && mydenyut! > 160) {
                                   self.catatanLabel.text = "Suhu bayi rendah dan jantung berdetak cepat, segera periksa ke dokter!"
                                //content.body = self.catatanLabel.text!
                                self.getNotificationSuhu()
                               } else if (myint! < 35 && (mydenyut! >= 120 && mydenyut! <= 160)) {
                                   self.catatanLabel.text = "Suhu bayi sangat rendah, segera periksa ke dokter!"
                                //content.body = self.catatanLabel.text!
                                self.getNotificationSuhu()
                                } else if (myint! < 35 && mydenyut! < 160) {
                                   self.catatanLabel.text = "Suhu bayi sangat rendah dan jantung melemah, segera periksa ke dokter!"
                                //content.body = self.catatanLabel.text!
                                self.getNotificationSuhuRendahDetakRendah()
                                }
                         }
                         
                     }
        
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
                    self.lblcoba1.text = thinkSpeakData.feeds.last?.field1
                    self.lblcoba2.text = thinkSpeakData.feeds.last?.field2
                    
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
    
    func catatan(){
        
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

    func getNotificationSuhu(){
            UNUserNotificationCenter.current().delegate = self

            //content
            let content = UNMutableNotificationContent()
            content.title = "Hai, Ibu"
            content.body = "Suhu bayi anda \(self.lblSuhu.text!). Segera periksa bayi anda."
            content.sound = UNNotificationSound.default
            
            
            //triger
            let myDate = Date().addingTimeInterval(1)
            let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
            let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
            
            //req
            let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
            
            //put it to center notif
            UNUserNotificationCenter.current().add(req) { (error) in
                if let error = error{
                    print("error ",error)
                }
            }
        }
    
    func getNotificationDetak(){
        UNUserNotificationCenter.current().delegate = self

        //content
        let content = UNMutableNotificationContent()
        content.title = "Hai, Ibu"
        content.body = "Detak jantung bayi anda \(self.lbldenyut.text!). Segera periksa bayi anda."
        content.sound = UNNotificationSound.default
        
        
        //triger
        let myDate = Date().addingTimeInterval(1)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //req
        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
        
        //put it to center notif
        UNUserNotificationCenter.current().add(req) { (error) in
            if let error = error{
                print("error ",error)
            }
        }
    }
    
    func getNotificationTinggi(){
        UNUserNotificationCenter.current().delegate = self

        //content
        let content = UNMutableNotificationContent()
        content.title = "Hai, Ibu!"
        content.body = "Suhu bayi tinggi dan jantung berdetak cepat. Segera periksa bayi anda."
        content.sound = UNNotificationSound.default
        
        
        //triger
        let myDate = Date().addingTimeInterval(1)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //req
        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
        
        //put it to center notif
        UNUserNotificationCenter.current().add(req) { (error) in
            if let error = error{
                print("error ",error)
            }
        }
    }
    
    func getNotificationRendah(){
        UNUserNotificationCenter.current().delegate = self

        //content
        let content = UNMutableNotificationContent()
        content.title = "Hai, Ibu!"
        content.body = "Suhu bayi rendah dan jantung berdetak lemah. Segera periksa bayi anda."
        content.sound = UNNotificationSound.default
        
        
        //triger
        let myDate = Date().addingTimeInterval(1)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //req
        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
        
        //put it to center notif
        UNUserNotificationCenter.current().add(req) { (error) in
            if let error = error{
                print("error ",error)
            }
        }
    }
    
    func getNotificationSuhuRendahDetakCepat(){
        UNUserNotificationCenter.current().delegate = self

        //content
        let content = UNMutableNotificationContent()
        content.title = "Hai, Ibu!"
        content.body = "Suhu bayi rendah dan jantung berdetak cepat. Segera periksa bayi anda."
        content.sound = UNNotificationSound.default
        
        
        //triger
        let myDate = Date().addingTimeInterval(1)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //req
        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
        
        //put it to center notif
        UNUserNotificationCenter.current().add(req) { (error) in
            if let error = error{
                print("error ",error)
            }
        }
    }
    
    func getNotificationSuhuRendahDetakRendah(){
        UNUserNotificationCenter.current().delegate = self

        //content
        let content = UNMutableNotificationContent()
        content.title = "Hai, Ibu!"
        content.body = "Suhu bayi rendah dan jantung melemah. Segera periksa bayi anda."
        content.sound = UNNotificationSound.default
        
        
        //triger
        let myDate = Date().addingTimeInterval(1)
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //req
        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
        
        //put it to center notif
        UNUserNotificationCenter.current().add(req) { (error) in
            if let error = error{
                print("error ",error)
            }
        }
    }
    
    

}

extension mainScreen : UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound,.alert])
    }
}

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}



