//
//  NPSLinkView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

struct NPSLinkView: View {
  var body: some View {
    Link(destination: URL(string: "https://en.wikipedia.org/wiki/Nominal_Pipe_Size#NPS_tables_for_selected_sizes")!
    ) {
      HStack(alignment: .center) {
        Text(LocalizedStrings.Form.npsFooterText)
          .font(.footnote)
        Image(systemName: "link.circle.fill")
      }
    }
  }
}

struct NPSLinkView_Previews: PreviewProvider {
  static var previews: some View {
    NPSLinkView()
  }
}
