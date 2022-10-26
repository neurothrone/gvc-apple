//
//  Calculation+CoreDataClass.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//
//

import CoreData
import Foundation
import GVCCore

@objc(Calculation)
public class Calculation: NSManagedObject {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Calculation> {
    return NSFetchRequest<Calculation>(entityName: String(describing: Calculation.self))
  }
  
  @NSManaged public var id: String
  @NSManaged public var calculatedAt: Date
  @NSManaged public var length: Double
  @NSManaged public var pressure: Double
  @NSManaged public var result: Double
  
  @NSManaged fileprivate var npsValue: Int16
  var nps: NPSSelection {
    get { NPSSelection(rawValue: Int(npsValue)) ?? .threeHundred }
    set { npsValue = Int16(newValue.rawValue) }
  }
  
  public override func awakeFromInsert() {
    super.awakeFromInsert()
    
    id = UUID().uuidString
    calculatedAt = .now
  }
}

extension Calculation : Identifiable {}
