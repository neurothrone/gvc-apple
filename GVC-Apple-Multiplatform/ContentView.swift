//
//  ContentView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

private extension Tab {
  @ViewBuilder
  var view: some View {
    switch self {
    case .calculate:
      MainScreen()
    case .previousCalculations:
      PreviousCalculationsView()
    }
  }
}

struct ContentView: View {
  @AppStorage("selectedTab")
  private var selectedTab: Tab = .calculate
  
  var body: some View {
    TabView(selection: $selectedTab) {
      ForEach(Tab.allCases) { tab in
        tab.view
          .tabItem {
            Label(tab.rawValue, systemImage: tab.systemImageName)
          }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
