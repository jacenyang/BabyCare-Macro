//
//  ViewController.swift
//  apaajalah
//
//  Created by Rian Anjasmara on 10/08/20.
//  Copyright © 2020 Rian Anjasmara. All rights reserved.
//

import UIKit
import CoreData

struct DataModel {
    var estimasiDate: Date
}

class tanggalKelahiran: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var DataEstimasis = [DateEstimasi]()
    var dateData = [DataModel]()
    
    
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
        if let isi = estimasiLahir.text, !isi.isEmpty
            {
            let estimasi = datePicker.date
                let new = DataModel(estimasiDate: estimasi)
                 let newData = DateEstimasi(context: self.context)
                 newData.estimasiDate = estimasi
                 self.DataEstimasis.append(newData)
                 //self.saveData()
                 self.dateData.append(new)
                // self.table.reloadData()
                 self.saveData()
            }
            func textFieldShouldReturn( textField: UITextField) ->Bool{
            textField.resignFirstResponder()
            return true
            }
        }
        
        func saveData(){
               do{
                   try context.save()
               } catch {
                   print("error saving with Error \(error)")
               }
           }
           
           func loadData(){
               let request : NSFetchRequest<DateEstimasi> = DateEstimasi.fetchRequest()
               do{
                   DataEstimasis = try context.fetch(request)
               } catch {
                   print("Error loading data \(error)")
               }
           }
}





