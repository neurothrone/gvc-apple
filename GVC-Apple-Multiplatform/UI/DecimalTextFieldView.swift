//
//  DecimalTextFieldView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

struct DecimalTextFieldView: View {
  @Binding var value: Double
  
  let placeholder: String
  
  var body: some View {
    TextField(placeholder, value: $value, format: .localCurrency)
#if os(iOS)
      .keyboardType(.decimalPad)
#endif
  }
}

struct DecimalTextFieldView_Previews: PreviewProvider {
  static var previews: some View {
    DecimalTextFieldView(
      value: .constant(.zero),
      placeholder: "Type in a length"
    )
    .previewLayout(.sizeThatFits)
  }
}
