//
//  SensorModel.swift
//  APITest
//
//  Created by Jason Yang on 12/11/20.
//

import UIKit

struct SensorModel {
    
    var isoDate: String
    let cabinTemp: String
    let humidity: String
    let pulse: String
    let babyTemp: String
    let weight: String
    
    var cabinTempString: String {
        let cabinTempDouble = Double(cabinTemp)
        return String(format: "%.1f", cabinTempDouble!) + " ℃"
    }
    
    var cabinTempDesc: String {
        let cabinTempRoundedDouble = Double(cabinTemp)
        let cabinTempRoundedString = String(format: "%0.1f", cabinTempRoundedDouble!)
        let cabinTempNumber = Double(cabinTempRoundedString)!
        switch cabinTempNumber {
        case 0.1..<33.0:
            return "Terlalu rendah"
        case 33.0:
            return "Menuju rendah"
        case 33.1..<35.0:
            return "Normal"
        case 35.0:
            return "Menuju tinggi"
        case 35.0...40.0:
            return "Terlalu tinggi"
        default:
            return "Error"
        }
    }
    
    var cabinTempColor: UIColor {
        let cabinTempRoundedDouble = Double(cabinTemp)
        let cabinTempRoundedString = String(format: "%0.1f", cabinTempRoundedDouble!)
        let cabinTempNumber = Double(cabinTempRoundedString)!
        switch cabinTempNumber {
        case 0.1..<33.0:
            return UIColor.red
        case 33.0:
            return UIColor.yellow
        case 33.1..<35.0:
            return UIColor.green
        case 35.0:
            return UIColor.yellow
        case 35.0...40.0:
            return UIColor.red
        default:
            return UIColor.red
        }
    }
    
    var humidityString: String {
        let humidityDouble = Double(humidity)
        return String(format: "%.0f", humidityDouble!) + " %"
    }
    
    var humidityDesc: String {
        let humidityRoundedDouble = Double(humidity)
        let humidityRoundedString = String(format: "%0.0f", humidityRoundedDouble!)
        let humidityNumber = Double(humidityRoundedString)!
        switch humidityNumber {
        case 1..<40:
            return "Kering"
        case 40:
            return "Menuju Kering"
        case 41..<60:
            return "Normal"
        case 60:
            return "Menuju Lembab"
        case 61..<100:
            return "Terlalu Lembab"
        default:
            return "Error"
        }
    }
    
    var humidityColor: UIColor {
        let humidityRoundedDouble = Double(humidity)
        let humidityRoundedString = String(format: "%0.0f", humidityRoundedDouble!)
        let humidityNumber = Double(humidityRoundedString)!
        switch humidityNumber {
        case 1..<40:
            return UIColor.red
        case 40:
            return UIColor.yellow
        case 41..<60:
            return UIColor.green
        case 60:
            return UIColor.yellow
        case 61..<100:
            return UIColor.red
        default:
            return UIColor.red
        }
    }
    
    var pulseString: String {
        let pulseDouble = Double(pulse)
        return String(format: "%.0f", pulseDouble!) + " BPM"
    }
    
    var pulseDesc: String {
        let pulseRoundedDouble = Double(pulse)
        let pulseRoundedString = String(format: "%0.0f", pulseRoundedDouble!)
        let pulseNumber = Double(pulseRoundedString)!
        switch pulseNumber {
        case 1..<170:
            return "Terlalu Lambat"
        case 170:
            return "Menuju Lambat"
        case 171..<190:
            return "Normal"
        case 190:
            return "Menuju Cepat"
        case 191..<300:
            return "Terlalu Cepat"
        default:
            return "Error"
        }
    }
    
    var pulseColor: UIColor {
        let pulseRoundedDouble = Double(pulse)
        let pulseRoundedString = String(format: "%0.0f", pulseRoundedDouble!)
        let pulseNumber = Double(pulseRoundedString)!
        switch pulseNumber {
        case 1..<170:
            return UIColor.red
        case 170:
            return UIColor.yellow
        case 171..<190:
            return UIColor.green
        case 190:
            return UIColor.yellow
        case 191..<300:
            return UIColor.red
        default:
            return UIColor.red
        }
    }
    
    var babyTempString: String {
        let babyTempDouble = Double(babyTemp)
        return String(format: "%.1f", babyTempDouble!) + " ℃"
    }
    
    var babyTempDesc: String {
        let babyTempRoundedDouble = Double(babyTemp)
        let babyTempRoundedString = String(format: "%0.1f", babyTempRoundedDouble!)
        let babyTempNumber = Double(babyTempRoundedString)!
        switch babyTempNumber {
        case 0.1..<36.5:
            return "Hipotermia"
        case 36.5:
            return "Menuju Hipotermia"
        case 36.6..<37.5:
            return "Normal"
        case 37.5:
            return "Menuju Demam"
        case 37.6..<40:
            return "Demam"
        default:
            return "Error"
        }
    }
    
    var babyTempColor: UIColor {
        let babyTempRoundedDouble = Double(babyTemp)
        let babyTempRoundedString = String(format: "%0.1f", babyTempRoundedDouble!)
        let babyTempNumber = Double(babyTempRoundedString)!
        switch babyTempNumber {
        case 0.1..<36.5:
            return UIColor.red
        case 36.5:
            return UIColor.yellow
        case 36.6..<37.5:
            return UIColor.green
        case 37.5:
            return UIColor.yellow
        case 37.6..<40:
            return UIColor.red
        default:
            return UIColor.red
        }
    }
    
    var weightToKgString: String {
        let weightToKgDouble = Double(weight)! / 1000
        return String(format: "%.1f", weightToKgDouble) + " kg"
    }
    
    var weightDesc: String {
        let weightRoundedDouble = Double(weight)! / 1000
        let weightRoundedString = String(format: "%0.1f", weightRoundedDouble)
        let weightNumber = Double(weightRoundedString)!
        switch weightNumber {
        case 0.1..<1.5:
            return "Survival Rate 25%-50%"
        case 1.5..<2.5:
            return "Survival Rate 25%"
        case 2.5..<5:
            return "Lulus"
        default:
            return "Error"
        }
    }
    
    var weightColor: UIColor {
        let weightRoundedDouble = Double(weight)! / 1000
        let weightRoundedString = String(format: "%0.1f", weightRoundedDouble)
        let weightNumber = Double(weightRoundedString)!
        switch weightNumber {
        case 0.1..<1.5:
            return UIColor.red
        case 1.5..<2.5:
            return UIColor.yellow
        case 2.5..<5:
            return UIColor.green
        default:
            return UIColor.red
        }
    }
    
    var date: String {
        let splitDate = isoDate.split(separator: "T")
        return String(splitDate[0])
    }
    
    var time: String {
        let splitTime = isoDate.split(separator: "T")
        return String(splitTime[1].dropLast())
    }
    
    var dateFormat: Date {
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from: isoDate)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
        let finalDate = calendar.date(from: components)!
        return finalDate
    }
    
}
