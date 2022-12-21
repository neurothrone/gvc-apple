//
//  Tab.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

enum Tab: String {
  case calculate = "Calculate"
  case previousCalculations = "Previous Calculations"
}

extension Tab: CaseIterable, Identifiable {
  var id: Self { self }
  
  var systemImageName: String {
    switch self {
    case .calculate:
      return "cylinder.split.1x2.fill"
    case .previousCalculations:
      return "list.bullet.circle"
    }
  }
  
  @ViewBuilder
  var view: some View {
    switch self {
    case .calculate:
      CalculateScreen()
    case .previousCalculations:
      PreviousCalculationsScreen()
    }
  }
}
