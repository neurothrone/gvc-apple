//
//  CalculateResultView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

struct CalculateResultSectionView: View {
  @Binding var value: Double
  
  var body: some View {
    Section {
      Text(value.toCurrentLocale)
        .bold()
    } header: {
      HStack(alignment: .bottom, spacing: 4) {
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

struct CalculateResultSectionView_Previews: PreviewProvider {
  static var previews: some View {
    CalculateResultSectionView(value: .constant(.zero))
  }
}
