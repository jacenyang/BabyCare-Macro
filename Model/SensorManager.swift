//
//  SensorManager.swift
//  APITest
//
//  Created by Jason Yang on 12/11/20.
//

import Foundation

protocol SensorManagerDelegate {
    func didUpdateSensor(_ sensorManager: SensorManager, sensor: SensorModel)
    func didFailWithError(error: Error)
}

struct SensorManager {
    
    let sensorURL = "https://api.thingspeak.com/channels/592779/feeds.json"
    
    var delegate: SensorManagerDelegate?
    
    func fetchSensor() {
        let urlString = "\(sensorURL)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the URLSession a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let sensor = self.parseJSON(safeData) {
                        self.delegate?.didUpdateSensor(self, sensor: sensor)
                    }
                }
            }
            //4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ sensorData: Data) -> SensorModel? {
        
        let decoder = JSONDecoder()
        do {
            
            let decodedData = try decoder.decode(SensorData.self, from: sensorData)
            let isoDate = (decodedData.feeds.last?.created_at) ?? "0.0"
            let cabinTemp = (decodedData.feeds.last?.field1) ?? "0.0"
            let humidity = (decodedData.feeds.last?.field2) ?? "0.0"
            let pulse = (decodedData.feeds.last?.field3) ?? "0.0"
            let babyTemp = (decodedData.feeds.last?.field4 ) ?? "0.0"
            let weight = (decodedData.feeds.last!.field5) ?? "0.0"
            let sensor = SensorModel(isoDate: isoDate, cabinTemp: cabinTemp, humidity: humidity, pulse: pulse, babyTemp: babyTemp, weight: weight)
            return sensor
            
        }
        catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
}
