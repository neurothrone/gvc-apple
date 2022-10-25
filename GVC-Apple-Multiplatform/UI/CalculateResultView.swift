//
//  CalculateResultView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

struct CalculateResultView: View {
  @Binding var value: Double
  
  var body: some View {
    Section {
      Text(value.formatted())
        .bold()
    } header: {
      HStack {
        Text(LocalizedStrings.Form.resultLabel)
        Text("(m") +
        Text("3")
          .font(.system(size: 12.0))
          .baselineOffset(6.0) +
        Text(")")
      }
      .font(.headline)
    }
    .textCase(.none)
  }
}

struct CalculateResultView_Previews: PreviewProvider {
  static var previews: some View {
    CalculateResultView(value: .constant(.zero))
  }
}
