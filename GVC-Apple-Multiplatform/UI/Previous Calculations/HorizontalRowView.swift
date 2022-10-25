//
//  HorizontalRowView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

struct HorizontalRowView: View {
  let label: String
  let text: String
  
  var labelColor: Color = .accentColor
  var textColor: Color = .primary
  var isProminent: Bool = false
  
  var body: some View {
    HStack {
      Text(label)
        .foregroundColor(labelColor)
      Spacer()
      Text(text)
        .foregroundColor(textColor)
        .font(isProminent ? .headline : .body)
    }
  }
}

struct HorizontalRowView_Previews: PreviewProvider {
  static var previews: some View {
    HorizontalRowView(label: "Length", text: 2400.formatted(.localCurrency))
  }
}
