//
//  CalculationModel+Extensions.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import CoreData
import GVCCore
import Foundation

extension CalculationModel {
  static func createWith(
    nps: NPSSelection,
    length: Double,
    pressure: Double,
    result: Double,
    using context: NSManagedObjectContext
  ) -> CalculationModel {
    let model = CalculationModel(context: context)
    model.nps = nps
    model.length = length
    model.pressure = pressure
    model.result = result
    
    model.save(using: context)
    return model
  }
  
  func save(using context: NSManagedObjectContext) {
    CoreDataProvider.save(using: context)
  }
  
  func delete(using context: NSManagedObjectContext) {
    CoreDataProvider.delete(object: self, using: context)
  }
  
  static var all: NSFetchRequest<CalculationModel> {
    let request = CalculationModel.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: \CalculationModel.calculatedAt, ascending: false)]
    return request
  }
}
