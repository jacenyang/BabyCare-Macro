//
//  SensorModel.swift
//  APITest
//
//  Created by Jason Yang on 12/11/20.
//

import Foundation

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
    
    var humidityString: String {
        let humidityDouble = Double(humidity)
        return String(format: "%.0f", humidityDouble!) + " %"
    }
    
    var pulseString: String {
        let pulseDouble = Double(pulse)
        return String(format: "%.0f", pulseDouble!) + " BPM"
    }
    
    var babyTempString: String {
        let babyTempDouble = Double(babyTemp)
        return String(format: "%.1f", babyTempDouble!) + " ℃"
    }
    
    var weightToKgString: String {
        let weightToKgDouble = Double(weight)! / 1000
        return String(format: "%.1f", weightToKgDouble) + " kg"
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
