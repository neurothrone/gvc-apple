//
//  CalculationModel+Preview.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import Foundation

extension CalculationModel {
  enum Preview {
    static var sample: CalculationModel {
      CalculationModel(nps: .threeHundred, length: 2400, pressure: 4000, result: 839.522)
    }
    
    static var samples: [CalculationModel] {
      [
        Preview.sample,
        Preview.sample,
        Preview.sample,
      ]
    }
  }
}
