//
//  CardModelEntity+CoreDataProperties.swift
//  Shopifly
//
//  Created by Mac on 4/19/25.
//
//

import Foundation
import CoreData


extension CardModelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardModelEntity> {
        return NSFetchRequest<CardModelEntity>(entityName: "CardModelEntity")
    }

    @NSManaged public var product: String?
    @NSManaged public var location: String?
    @NSManaged public var image: Data?
}

extension CardModelEntity : Identifiable {

}
