//
//  ViewController.swift
//  apaajalah
//
//  Created by Rian Anjasmara on 10/08/20.
//  Copyright © 2020 Rian Anjasmara. All rights reserved.
//

import UIKit
import CoreData

struct DataModel1 {
    var estimasiDate: Date?
}


class tanggalKelahiran: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var dateData = DataModel1(estimasiDate: nil)
    
    
    @IBOutlet var estimasiLahir: UITextField!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomline()
        createDatePicker()
    }
    
    func bottomline (){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: estimasiLahir.frame.height - 2 , width: estimasiLahir.frame.width , height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 56/255, green: 87/255, blue: 81/255, alpha: 1).cgColor
        estimasiLahir.borderStyle = .none
        estimasiLahir.layer.addSublayer(bottomLine)
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

    
    
    public var completion: ((Date) -> Void)?
    @IBOutlet var lblAge: UILabel!
    @IBAction func btnCalculateHandler(_ sender: UIButton) {
        let estimasi = datePicker.date as Date
        dateData.estimasiDate = estimasi
        saveData()
    }
    
    func saveData(){
          let context = appDelegate.persistentContainer.viewContext
          let entity = NSEntityDescription.insertNewObject(forEntityName: "DateEstimasi", into: context)
          
          entity.setValue(dateData.estimasiDate, forKey: "estimasiDate")
      }
      
      func loadData() {
          let context = appDelegate.persistentContainer.viewContext
          let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DateEstimasi")
          do{
              let result = try context.fetch(request)
              
              if result.isEmpty{
                  print("KOSONG")
                  saveData()
              }else{
                  
                  let take = result [0] as! NSManagedObject
                  
                  guard let date = take.value(forKey: "estimasiDate") else{
                      return
                  }
                dateData.estimasiDate = date as? Date
              }
          }
          catch{
              print(error)
          }
      }
}





