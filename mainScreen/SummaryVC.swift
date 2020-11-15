//
//  SummaryVC.swift
//  BabyCare-MC3
//
//  Created by Muhammad Syabran on 15/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import CoreData
import UIKit

class SummaryVC: ViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var DataEstimasis = [DateEstimasi]()
    var dateData = [DataModel]()
    var dataAPI = [feeds2]()
    
    
    @IBOutlet weak var lblKeteranganBayi: UILabel!
    @IBOutlet weak var lblUsiaKoreksi: UILabel!
    
    @IBOutlet weak var lblSuhuTubuh: UILabel!
    @IBOutlet weak var lblSuhu: UILabel!
        
    @IBOutlet weak var lblDetak: UILabel!
    @IBOutlet weak var lbldenyut: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
//
//        self.TampilLabelUmur()
//
//        self.lblSuhuTubuh.text = "Suhu Tubuh"
//        self.lblDetak.text = "Denyut Jantung"
//
//        fetchAPIthinkSpeak{
//            DispatchQueue.main.async {
//
//
//
//                let myint = Double(self.lblcoba1.text!)
//                let myrouded = ((myint! * 100).rounded() / 100)
//                self.lblSuhu.text = "\(myrouded)"
//
//
//
//                let mydenyut = Double(self.lblcoba2.text!)
//                let myroude = mydenyut!.rounded()
//                self.lbldenyut.text = "\(myroude)"
//
//
//                if (myint! > 37 && mydenyut! > 160) {
//                    self.lblKeteranganBayi.text = "Jantung berdetak cepat dan suhu sangat tinggi, segera periksa ke dokter!"
//                    //content.body = self.catatanLabel.text!
//                    self.getNotificationTinggi()
//                } else if (myint! > 37 && (mydenyut! >= 120 && mydenyut! <= 160)) {
//                    self.lblKeteranganBayi.text = "Suhu bayi sangat tinggi, segera periksa ke dokter!"
//                    self.getNotificationSuhu()
//                } else if (myint! > 37 && mydenyut! < 120){
//                    self.lblKeteranganBayi.text = "Suhu bayi sangat tinggi dan detak jantung melemah, segera periksa ke dokter!"
//                    self.getNotificationSuhu()
//                } else if ((myint! >= 35 && myint! <= 37) && mydenyut! > 160) {
//                    self.lblKeteranganBayi.text = "Detak jantung berdetak sangat cepat, segera periksa ke dokter!"
//                    //content.body = self.catatanLabel.text!
//                    self.getNotificationDetak()
//                } else if ((myint! >= 35 && myint! <= 37) && (mydenyut! >= 120 && mydenyut! <= 160)) {
//                    self.lblKeteranganBayi.text = "Suhu dan detak jantung bayi normal. Selalu jaga kesehatan bayi ya!"
//                    //content.body = self.catatanLabel.text!
//                } else if ((myint! >= 35 && myint! <= 37) && mydenyut! < 120) {
//                    self.lblKeteranganBayi.text = "Detak jantung melemah, Segera periksa ke dokter!"
//                    //content.body = self.catatanLabel.text!
//                    self.getNotificationDetak()
//                } else if (myint! < 35 && mydenyut! > 160) {
//                    self.lblKeteranganBayi.text = "Suhu bayi rendah dan jantung berdetak cepat, segera periksa ke dokter!"
//                    //content.body = self.catatanLabel.text!
//                    self.getNotificationSuhu()
//                } else if (myint! < 35 && (mydenyut! >= 120 && mydenyut! <= 160)) {
//                    self.lblKeteranganBayi.text = "Suhu bayi sangat rendah, segera periksa ke dokter!"
//                    //content.body = self.catatanLabel.text!
//                    self.getNotificationSuhu()
//                } else if (myint! < 35 && mydenyut! < 160) {
//                    self.lblKeteranganBayi.text = "Suhu bayi sangat rendah dan jantung melemah, segera periksa ke dokter!"
//                    //content.body = self.catatanLabel.text!
//                    self.getNotificationSuhuRendahDetakRendah()
//                }
//            }
//
//        }
//
    }
//
//
//    func fetchAPIthinkSpeak( onSuccess : @escaping () -> Void){
//        guard let apiURL = URL(string: "https://api.thingspeak.com/channels/1116535/feeds.json?api_key=3W5C5093JVUEH036") else{return}
//        URLSession.shared.dataTask(with: apiURL) {(data, response, error) in
//
//
//            guard let data = data else {return}
//
//            do {
//                let decoder = JSONDecoder()
//                let thinkSpeakData = try decoder.decode(ThinkSpeakAPI2.self, from: data)
//                //print(thinkSpeakData.feeds)
//                self.dataAPI = thinkSpeakData.feeds ?? []
//                //print(self.dataAPI)
//
//                // print(thinkSpeakData.channel?.name)
//
//                //    print("ini data yang pertama", thinkSpeakData.feeds?.first)
//                //  print("ini data yang terakhir", thinkSpeakData.feeds?.last)
//                DispatchQueue.main.async {
//
//                    self.lblcoba1.text = (thinkSpeakData.feeds.last?.field1)
//                    self.lblcoba2.text = thinkSpeakData.feeds.last?.field2
//
//                    onSuccess()
//
//                }
//
//            } catch let err {
//                print("error", err)
//            }
//        }.resume()
//
//
//    }
//
    func TampilLabelUmur(){
        retrieve()



    }

    func catatan(){

    }

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
//
//    func getNotificationSuhu(){
//        UNUserNotificationCenter.current().delegate = self
//
//        //content
//        let content = UNMutableNotificationContent()
//        content.title = "Hai, Ibu"
//        content.body = "Suhu bayi anda \(self.lblSuhu.text!). Segera periksa bayi anda."
//        content.sound = UNNotificationSound.default
//
//
//        //triger
//        let myDate = Date().addingTimeInterval(1)
//        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
//        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
//
//        //req
//        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
//
//        //put it to center notif
//        UNUserNotificationCenter.current().add(req) { (error) in
//            if let error = error{
//                print("error ",error)
//            }
//        }
//    }
//
//    func getNotificationDetak(){
//        UNUserNotificationCenter.current().delegate = self
//
//        //content
//        let content = UNMutableNotificationContent()
//        content.title = "Hai, Ibu"
//        content.body = "Detak jantung bayi anda \(self.lbldenyut.text!). Segera periksa bayi anda."
//        content.sound = UNNotificationSound.default
//
//
//        //triger
//        let myDate = Date().addingTimeInterval(1)
//        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
//        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
//
//        //req
//        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
//
//        //put it to center notif
//        UNUserNotificationCenter.current().add(req) { (error) in
//            if let error = error{
//                print("error ",error)
//            }
//        }
//    }
//
//    func getNotificationTinggi(){
//        UNUserNotificationCenter.current().delegate = self
//
//        //content
//        let content = UNMutableNotificationContent()
//        content.title = "Hai, Ibu!"
//        content.body = "Suhu bayi tinggi dan jantung berdetak cepat. Segera periksa bayi anda."
//        content.sound = UNNotificationSound.default
//
//
//        //triger
//        let myDate = Date().addingTimeInterval(1)
//        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
//        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
//
//        //req
//        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
//
//        //put it to center notif
//        UNUserNotificationCenter.current().add(req) { (error) in
//            if let error = error{
//                print("error ",error)
//            }
//        }
//    }
//
//    func getNotificationRendah(){
//        UNUserNotificationCenter.current().delegate = self
//
//        //content
//        let content = UNMutableNotificationContent()
//        content.title = "Hai, Ibu!"
//        content.body = "Suhu bayi rendah dan jantung berdetak lemah. Segera periksa bayi anda."
//        content.sound = UNNotificationSound.default
//
//
//        //triger
//        let myDate = Date().addingTimeInterval(1)
//        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
//        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
//
//        //req
//        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
//
//        //put it to center notif
//        UNUserNotificationCenter.current().add(req) { (error) in
//            if let error = error{
//                print("error ",error)
//            }
//        }
//    }
//
//    func getNotificationSuhuRendahDetakCepat(){
//        UNUserNotificationCenter.current().delegate = self
//
//        //content
//        let content = UNMutableNotificationContent()
//        content.title = "Hai, Ibu!"
//        content.body = "Suhu bayi rendah dan jantung berdetak cepat. Segera periksa bayi anda."
//        content.sound = UNNotificationSound.default
//
//
//        //triger
//        let myDate = Date().addingTimeInterval(1)
//        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
//        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
//
//        //req
//        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
//
//        //put it to center notif
//        UNUserNotificationCenter.current().add(req) { (error) in
//            if let error = error{
//                print("error ",error)
//            }
//        }
//    }
//
//    func getNotificationSuhuRendahDetakRendah(){
//        UNUserNotificationCenter.current().delegate = self
//
//        //content
//        let content = UNMutableNotificationContent()
//        content.title = "Hai, Ibu!"
//        content.body = "Suhu bayi rendah dan jantung melemah. Segera periksa bayi anda."
//        content.sound = UNNotificationSound.default
//
//
//        //triger
//        let myDate = Date().addingTimeInterval(1)
//        let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: myDate)
//        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
//
//        //req
//        let req = UNNotificationRequest(identifier: "cobaNotif", content: content, trigger: triger)
//
//        //put it to center notif
//        UNUserNotificationCenter.current().add(req) { (error) in
//            if let error = error{
//                print("error ",error)
//            }
//        }
//    }
//
//
//
//}
//
//extension mainScreen : UNUserNotificationCenterDelegate{
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        completionHandler([.sound,.alert])
//    }
//}
//
//extension Double {
//    func rounded(digits: Int) -> Double {
//        let multiplier = pow(10.0, Double(digits))
//        return (self * multiplier).rounded() / multiplier
//    }
}
