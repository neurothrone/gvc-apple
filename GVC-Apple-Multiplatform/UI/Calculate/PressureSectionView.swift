//
//  PressureSectionView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-26.
//

import GVCCore
import SwiftUI

struct PressureSectionView: View {
  @Binding var value: Double
  @Binding var selection: PressureSelection
  
  var body: some View {
    Section {
      Picker(
        LocalizedStrings.Form.pressurePickerHint,
        selection: $selection
      ) {
        ForEach(PressureSelection.allCases) {
          Text($0.toString)
        }
      }
      .pickerStyle(.segmented)
      if selection == .custom {
        DecimalTextFieldView(
          value: $value,
          placeholder: LocalizedStrings.Form.pressureFieldPlaceholder
        )
      }
    } header: {
      SectionHeaderView(text: LocalizedStrings.Form.pressureLabel)
    }
  }
}

struct PressureSectionView_Previews: PreviewProvider {
  static var previews: some View {
    PressureSectionView(value: .constant(.zero), selection: .constant(.fourThousand))
  }
}
