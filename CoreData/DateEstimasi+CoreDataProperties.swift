//
//  DateEstimasi+CoreDataProperties.swift
//  BabyCare-MC3
//
//  Created by Rian Anjasmara on 16/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//
//

import Foundation
import CoreData


extension DateEstimasi {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DateEstimasi> {
        return NSFetchRequest<DateEstimasi>(entityName: "DateEstimasi")
    }

    @NSManaged public var estimasiDate: Date?

}
