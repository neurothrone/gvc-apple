//
//  FormatStyle+Extensions.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
  static var localCurrency: Self {
    .currency(code: Locale.current.identifier)
  }
}
