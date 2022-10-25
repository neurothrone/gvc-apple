//
//  CalculationModel+Preview.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import CoreData
import GVCCore

extension CalculationModel {
  enum Preview {
    static func generateSample(using context: NSManagedObjectContext) -> CalculationModel {
      let model = CalculationModel(context: context)
      model.nps = .threeHundred
      model.length = 2400
      model.pressure = 4000
      model.result = GVCCore.calculateGasVolume(nps: model.nps, length: model.length, pressure: model.pressure)
      
      model.save(using: context)
      return model
    }
    
    static func generateSamples(using context: NSManagedObjectContext) {
      for _ in 1...5 {
        let nps = NPSSelection.allCases.randomElement() ?? .threeHundred
        let length = Double.random(in: 100...300, withDecimals: Int.random(in: 0...3))
        let pressure = Double.random(in: 30...4000, withDecimals: Int.random(in: 0...3))
        let result = GVCCore.calculateGasVolume(nps: nps, length: length, pressure: pressure)
        
        let _ = CalculationModel.createWith(
          nps: nps,
          length: length,
          pressure: pressure,
          result: result,
          using: context
        )
      }
    }
  }
}
