//
//  SectionHeaderView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

struct SectionHeaderView: View {
  let text: String
  
  var body: some View {
    Text(text)
      .font(.headline)
      .textCase(.none)
  }
}

struct SectionHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    SectionHeaderView(text: "Once")
  }
}
