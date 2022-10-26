//
//  NPSSectionView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-26.
//

import GVCCore
import SwiftUI

struct NPSSectionView: View {
  @Binding var selection: NPSSelection
  
  var body: some View {
    Section {
      NavigationLink {
        NPSSelectionScreen(selection: $selection)
      } label: {
        Text(selection.toString)
      }
    } header: {
      SectionHeaderView(text: LocalizedStrings.Form.npsPickerLabel)
    } footer: {
      CustomLinkView(urlString: Constants.Link.nps, text: LocalizedStrings.Form.npsFooterText)
    }
  }
}

struct NPSSectionView_Previews: PreviewProvider {
  static var previews: some View {
    NPSSectionView(selection: .constant(.threeHundred))
  }
}
