//
//  LengthSectionView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-26.
//

import SwiftUI

struct LengthSectionView: View {
  @Binding var text: String
  
  var body: some View {
    Section {
      CustomTextFieldView(
        placeholder: LocalizedStrings.Form.lengthFieldPlaceholder,
        text: $text
      )
    } header: {
      SectionHeaderView(text: LocalizedStrings.Form.lengthFieldLabel)
    }
  }
}

struct LengthSectionView_Previews: PreviewProvider {
  static var previews: some View {
    LengthSectionView(text: .constant(""))
  }
}
