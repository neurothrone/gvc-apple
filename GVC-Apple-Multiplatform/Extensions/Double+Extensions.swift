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
}
