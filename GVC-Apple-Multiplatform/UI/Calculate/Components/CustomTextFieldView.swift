//
//  CustomTextFieldView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-11-12.
//

import SwiftUI

struct CustomTextFieldView: View {
  @Binding var text: String
  
  let placeholder: String
  
  init(placeholder: String, text: Binding<String>) {
    _text = text
    self.placeholder = placeholder
  }
  
  var body: some View {
    TextField(placeholder, text: $text)
#if os(iOS)
      .keyboardType(.decimalPad)
#endif
  }
}

struct CustomTextFieldView_Previews: PreviewProvider {
  static var previews: some View {
    CustomTextFieldView(
      placeholder: "Length",
      text: .constant("")
    )
  }
}
