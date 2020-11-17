//
//  KondisiBayiVC.swift
//  BabyCare-MC3
//
//  Created by Muhammad Syabran on 15/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class KondisiBayiVC: ViewController, SensorManagerDelegate {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var dataScrollView: UIScrollView!
    
    @IBOutlet weak var babyTempLabel: UILabel!
    @IBOutlet weak var pulseLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var cabinTempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var suhuBayiView: UIView!
    @IBOutlet weak var detakView: UIView!
    @IBOutlet weak var beratBadanView: UIView!
    @IBOutlet weak var cabinTempView: UIView!
    @IBOutlet weak var humidityView: UIView!
    
    var sensorManager = SensorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataScrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: humidityView.bottomAnchor).isActive = true
        
        navigationItem.largeTitleDisplayMode = .never
        
        sensorManager.delegate = self
        sensorManager.fetchSensor()
        
        suhuBayiView.layer.cornerRadius = 15
        detakView.layer.cornerRadius = 15
        beratBadanView.layer.cornerRadius = 15
        cabinTempView.layer.cornerRadius = 15
        humidityView.layer.cornerRadius = 15
    }
    
    func didUpdateSensor(_ sensorManager: SensorManager, sensor: SensorModel) {
        DispatchQueue.main.async {
            self.pulseLabel.text = sensor.pulseString
            self.babyTempLabel.text = sensor.babyTempString
            self.weightLabel.text = sensor.weightToKgString
            self.cabinTempLabel.text = sensor.cabinTempString
            self.humidityLabel.text = sensor.humidityString
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
