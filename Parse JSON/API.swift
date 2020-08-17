//
//  API.swift
//  BabyCare-MC3
//
//  Created by abdulrazak on 13/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import Foundation
struct ThinkSpeakAPI2: Decodable {
   
    let feeds: [feeds2]
    
   
}
struct feeds2: Decodable {
     
      let field1: String?
      let field2: String?
    let created_at: String?
    
  }
