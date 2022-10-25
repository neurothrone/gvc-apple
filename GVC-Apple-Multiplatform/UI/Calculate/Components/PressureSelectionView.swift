//
//  PressureSelectionView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import GVCCore
import SwiftUI

struct PressureSelectionView: View {
  @Binding var pressure: Double
  @State private var pressureSelection: PressureSelection = .fourThousand
  @State private var isCustomPressure = true
  
  var body: some View {
    VStack {
      Section {
        Picker(
          LocalizedStrings.Form.pressurePickerHint,
          selection: $pressureSelection) {
            ForEach(PressureSelection.allCases) {
              Text($0.toString)
            }
          }
          .pickerStyle(.segmented)
          .onChange(of: pressureSelection) { _ in
            if pressureSelection != .custom {
              pressure = Double(pressureSelection.rawValue) ?? .zero
            }
            
            isCustomPressure = pressureSelection == .custom
          }
        
        if isCustomPressure {
          DecimalTextFieldView(value: $pressure, placeholder: LocalizedStrings.Form.pressureFieldPlaceholder)
            .onChange(of: pressure) { newValue in
              
            }
        }
      } header: {
        Text(LocalizedStrings.Form.pressureLabel + " (mbar)")
          .font(.headline)
      }
      .textCase(.none)
    }

  }
}

struct PressureSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    PressureSelectionView(pressure: .constant(.zero))
  }
}
