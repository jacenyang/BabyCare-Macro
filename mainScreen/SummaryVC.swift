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
    
    @IBOutlet weak var summaryScrollView: UIScrollView!

    @IBOutlet weak var babyView: UIView!
    @IBOutlet weak var allDataView: UIView!
    
    @IBOutlet weak var babyTempLabel: UILabel!
    @IBOutlet weak var pulseLabel: UILabel!
    
    @IBOutlet weak var babyTempColorLabel: UILabel!
    @IBOutlet weak var pulseColorLabel: UILabel!
    
    var sensorManager = SensorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summaryScrollView.contentLayoutGuide.topAnchor.constraint(equalTo: babyView.topAnchor).isActive = true
        summaryScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: allDataView.bottomAnchor).isActive = true
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        allDataView.layer.cornerRadius = 15
        
        sensorManager.delegate = self
        sensorManager.fetchSensor()
    }
    
    func didUpdateSensor(_ sensorManager: SensorManager, sensor: SensorModel) {
        DispatchQueue.main.async {
            
            self.pulseLabel.text = sensor.pulseString
            self.babyTempLabel.text = sensor.babyTempString

//            self.pulseColorLabel.text = sensor.pulseDesc
//            self.pulseColorLabel.textColor = sensor.pulseColor
//            self.babyTempColorLabel.text = sensor.babyTempDesc
//            self.babyTempColorLabel.textColor = sensor.babyTempColor
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
