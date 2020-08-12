//
//  ViewController.swift
//  apaajalah
//
//  Created by Rian Anjasmara on 10/08/20.
//  Copyright © 2020 Rian Anjasmara. All rights reserved.
//

import UIKit

class tanggalKelahiran: UIViewController {

    
    @IBOutlet var estimasiLahir: UITextField!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bottomline()
       
        createDatePicker()
      //  createDatePicker1()
    }
    
    
    
    
    
    func bottomline (){
        let bottomLine = CALayer()
     // let bottomLine1 = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: estimasiLahir.frame.height - 2 , width: estimasiLahir.frame.width , height: 2)
        
     //   bottomLine1.frame = CGRect(x: 0, y: tanggalLahir.frame.height - 2 , width: tanggalLahir.frame.width , height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 56/255, green: 87/255, blue: 81/255, alpha: 1).cgColor
    //  bottomLine1.backgroundColor = UIColor.init(red: 51/255, green: 75/255, blue: 72/255, alpha: 1).cgColor
        
        estimasiLahir.borderStyle = .none
      //  tanggalLahir.borderStyle = .none
        
        estimasiLahir.layer.addSublayer(bottomLine)
      //  tanggalLahir.layer.addSublayer(bottomLine1)
        
    }
    
    func createDatePicker (){
        //Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar Button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress))
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        estimasiLahir.inputAccessoryView = toolbar
       
        //assign Datepicker
        estimasiLahir.inputView = datePicker
        
        //date picker Mode
        datePicker.datePickerMode = .date
        
    }
    @objc func donePress(){
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        let estimasiLhr = datePicker.date
        estimasiLahir.text = formatter.string(from: estimasiLhr)
                self.view.endEditing(true)
    }

    
//    func createDatePicker1 (){
//        //Toolbar
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//
//        //bar Button
//        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePress1))
//        toolbar.setItems([doneBtn], animated: true)
//
//        //assign toolbar
//        tanggalLahir.inputAccessoryView = toolbar
//
//        //assign Datepicker
//        tanggalLahir.inputView = datePicker
//
//        //date picker Mode
//        datePicker.datePickerMode = .date
//
//    }
//    @objc func donePress1(){
//        let formatter = DateFormatter()
//        formatter.dateFormat = "d MMMM yyyy"
//        let tanggalLhr = datePicker.date
//        tanggalLahir.text = formatter.string(from: tanggalLhr)
//        self.view.endEditing(true)
//    }
    
    
    @IBOutlet var lblAge: UILabel!
    
    @IBAction func btnCalculateHandler(_ sender: UIButton) {
    
        //1 - get selected date from date picker
        let estimasilahir = datePicker.date
        
           //2 - get estimate date
        let hariini = Date()
        

           //3 - create an instance of the user's current calendar
           let calendar = Calendar.current

           //4 - use calendar to get difference between two dates
           let components = calendar.dateComponents([.year, .month, .day], from: estimasilahir, to: hariini)

           let ageYears = components.year
           let ageMonths = components.month
           let ageDays = components.day

           //5 - display age in label
           self.lblAge.text = " \(ageYears!) Year,\(ageMonths!) months, \(ageDays!) days"

    
    
}
}


