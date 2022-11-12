//
//  AboutSheet.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-26.
//

import SwiftUI

struct AboutSheet: View {
  private let currentYear: String
  
  init() {
    let today = Date.now
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year], from: today)
    currentYear = String(components.year ?? 2022)
  }
  
  var body: some View {
    VStack(spacing: 4) {
      HStack(spacing: 0) {
        Text("\(LocalizedStrings.App.madeWith) ")
        Image(systemName: "heart.fill")
          .foregroundColor(.purple)
        Text(" \(LocalizedStrings.App.by) Zaid Neurothrone")
        
      }
      
      HStack(spacing: 0) {
        Text("Copyright ")
        Image(systemName: "c.circle")
        Text(" \(currentYear)")
      }
      
      CustomLinkView(
        urlString: Constants.Link.svgRepo,
        text: "\(LocalizedStrings.App.appIconBy) svgrepo.com")
      .padding(.top)
    }
  }
}

struct AboutSheet_Previews: PreviewProvider {
  static var previews: some View {
    AboutSheet()
  }
}
