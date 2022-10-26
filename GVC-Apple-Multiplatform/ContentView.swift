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
      CalculateScreen()
    case .previousCalculations:
      PreviousCalculationsScreen()
    }
  }
}

struct ContentView: View {
  @AppStorage("selectedTab")
  private var selectedTab: Tab = .calculate
  
  var body: some View {
    NavigationStack {
      content
        .navigationTitle(LocalizedStrings.App.title)
        .navigationBarTitleDisplayMode(.inline)


        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              
            } label: {
              Image(systemName: "info.circle")
            }
          }
        }
    }
  }
  
  private var content: some View {
    TabView(selection: $selectedTab) {
      Group {
        ForEach(Tab.allCases) { tab in
          tab.view
            .tabItem {
              Label(tab.rawValue, systemImage: tab.systemImageName)
            }
        }
      }
      .toolbar(.visible, for: .tabBar)
      .toolbarBackground(.thinMaterial, for: .tabBar)
      .toolbarBackground(Color.accentColor.opacity(0.15), for: .tabBar)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
