//
//  Calculation+Extensions.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import CoreData
import GVCCore
import Foundation

extension Calculation {
  static func createWith(
    nps: NPSSelection,
    length: Double,
    pressure: Double,
    result: Double,
    using context: NSManagedObjectContext
  ) -> Calculation {
    let calculation = Calculation(context: context)
    calculation.nps = nps
    calculation.length = length
    calculation.pressure = pressure
    calculation.result = result
    
    calculation.save(using: context)
    return calculation
  }
  
  func save(using context: NSManagedObjectContext) {
    CoreDataProvider.save(using: context)
  }
  
  func delete(using context: NSManagedObjectContext) {
    CoreDataProvider.delete(object: self, using: context)
  }
  
  static var all: NSFetchRequest<Calculation> {
    let request = Calculation.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: \Calculation.calculatedAt, ascending: false)]
    return request
  }
  
  static func deleteAll(using context: NSManagedObjectContext) {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Calculation.self))
    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    batchDeleteRequest.resultType = .resultTypeObjectIDs
    
    guard let result = try? context.execute(batchDeleteRequest) as? NSBatchDeleteResult else { return }
    
    let changes: [AnyHashable: Any] = [NSDeletedObjectsKey: result.result as! [NSManagedObjectID]]
    NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes, into: [context])
  }
}
