//
//  LengthSectionView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-26.
//

import SwiftUI

struct LengthSectionView: View {
  @Binding var value: Double
  
  var body: some View {
    Section {
      DecimalTextFieldView(
        value: $value,
        placeholder: LocalizedStrings.Form.lengthFieldPlaceholder
      )
    } header: {
      SectionHeaderView(text: LocalizedStrings.Form.lengthFieldLabel)
    }
  }
}

struct LengthSectionView_Previews: PreviewProvider {
  static var previews: some View {
    LengthSectionView(value: .constant(.zero))
  }
}
