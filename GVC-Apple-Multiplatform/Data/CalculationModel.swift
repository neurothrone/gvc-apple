//
//  CalculationModel.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import GVCCore
import Foundation

struct CalculationModel: Identifiable {
  let id = UUID().uuidString
  let calculatedAt: Date = .now
  
  let nps: NPSSelection
  let length: Double
  let pressure: Double
  let result: Double
}
