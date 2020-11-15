//
//  SummaryVC.swift
//  BabyCare-MC3
//
//  Created by Muhammad Syabran on 15/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit
import CoreData

class SummaryVC: ViewController, SensorManagerDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var DataEstimasis = [DateEstimasi]()
    var dateData = [DataModel]()
    
    @IBOutlet weak var babyConditionView: UIView!
    @IBOutlet weak var cabinConditionView: UIView!
    @IBOutlet weak var allDataView: UIView!
    
    @IBOutlet weak var babySummaryLabel: UILabel!
    @IBOutlet weak var cabinSummaryLabel: UILabel!
    
    @IBOutlet weak var correctedAgeLabel: UILabel!
    @IBOutlet weak var babyTempLabel: UILabel!
    @IBOutlet weak var pulseLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var cabinTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var babyTempColorLabel: UILabel!
    @IBOutlet weak var pulseColorLabel: UILabel!
    @IBOutlet weak var weightColorLabel: UILabel!
    @IBOutlet weak var cabinTempColorLabel: UILabel!
    @IBOutlet weak var humidityColorLabel: UILabel!
    
    var sensorManager = SensorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        babyConditionView.layer.cornerRadius = 15
        cabinConditionView.layer.cornerRadius = 15
        allDataView.layer.cornerRadius = 15
        
        sensorManager.delegate = self
        sensorManager.fetchSensor()
        self.retrieve()
    }
    
    func didUpdateSensor(_ sensorManager: SensorManager, sensor: SensorModel) {
        DispatchQueue.main.async {
            
            self.cabinTempLabel.text = sensor.cabinTempString
            self.humidityLabel.text = sensor.humidityString
            self.pulseLabel.text = sensor.pulseString
            self.babyTempLabel.text = sensor.babyTempString
            self.weightLabel.text = sensor.weightToKgString
            //            self.timeLabel.text = sensor.time
            //            self.dateLabel.text = sensor.date
            self.babySummaryLabel.text = "Placeholder"
            self.cabinSummaryLabel.text = "Placeholder"
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
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
                self.correctedAgeLabel.text = "Usia koreksi \(ageMonths!) bulan, \(ageDays!) hari"
                
            }
        }catch let err{
            print(err)
        }
        
        return
    }
    
}
