//
//  Calculation+Preview.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import CoreData
import GVCCore

extension Calculation {
  enum Preview {
    static func generateSample(using context: NSManagedObjectContext) -> Calculation {
      let calculation = Calculation(context: context)
      calculation.nps = .threeHundred
      calculation.length = 2400
      calculation.pressure = 4000
      calculation.result = GVCCore.calculateGasVolume(nps: calculation.nps, length: calculation.length, pressure: calculation.pressure)
      
      calculation.save(using: context)
      return calculation
    }
    
    static func generateSamples(using context: NSManagedObjectContext) {
      for _ in 1...5 {
        let nps = NPSSelection.allCases.randomElement() ?? .threeHundred
        let length = Double.random(in: 100...300, withDecimals: Int.random(in: 0...3))
        let pressure = Double.random(in: 30...4000, withDecimals: Int.random(in: 0...3))
        let result = GVCCore.calculateGasVolume(nps: nps, length: length, pressure: pressure)
        
        let _ = Calculation.createWith(
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
