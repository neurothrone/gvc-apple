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
  @Environment(\.managedObjectContext) private var viewContext
  
  @AppStorage("selectedTab")
  private var selectedTab: Tab = .calculate
  
  @State private var isAboutSheetPresented = false
  @State private var isDeleteDataAlertPresented = false
  
  var body: some View {
    NavigationStack {
      content
        .navigationTitle(LocalizedStrings.App.title)
        .navigationBarTitleDisplayMode(.inline)
        .alert(
          "Delete all data",
          isPresented: $isDeleteDataAlertPresented
        ) {
          Button(role: .cancel, action: {}) {
            Text("Cancel")
          }
          Button(role: .destructive, action: deleteAllData) {
            Text("Delete")
          }
        } message: {
          Text("This will delete all of your data. Are you sure?")
        }
        .sheet(isPresented: $isAboutSheetPresented) {
          AboutSheet()
            .presentationDetents([.medium])
        }
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Menu {
              Button(action: presentAboutSheet) {
                Label("About", systemImage: "info.circle")
              }
              
              Button(role: .destructive, action: presentDeleteDataAlert) {
                Label("Delete all data", systemImage: "trash")
              }
            } label: {
              Image(systemName: "line.3.horizontal.circle")
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

extension ContentView {
  private func presentAboutSheet() {
    isAboutSheetPresented.toggle()
  }
  
  private func presentDeleteDataAlert() {
    isDeleteDataAlertPresented.toggle()
  }
  
  private func deleteAllData() {
    Calculation.deleteAll(using: viewContext)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
