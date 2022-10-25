//
//  Double+Extensions.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import Foundation

extension Double {
  var toCurrentLocale: String {
    NumberFormatter.customFormatter.string(from: self as NSNumber) ?? ""
  }
  
  static func random(in range: ClosedRange<Double>, withDecimals: Int) -> Double {
    let unroundedRandom = Double.random(in: range)
    let roundedString = String(format: "%.\(withDecimals)f", unroundedRandom)
    return Double(roundedString) ?? .zero
  }
}
