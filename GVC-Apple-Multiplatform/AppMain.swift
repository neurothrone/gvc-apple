//
//  AppMain.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

@main
struct AppMain: App {
  
  init() {
    configureSegmentedControl()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
    }
  }
}

extension AppMain {
  private func configureSegmentedControl() {
    UISegmentedControl.appearance()
      .selectedSegmentTintColor = UIColor(Color.accentColor.opacity(0.5))
    UISegmentedControl.appearance()
      .backgroundColor = UIColor(Color.accentColor.opacity(0.3))
    UISegmentedControl.appearance()
      .setTitleTextAttributes(
        [.foregroundColor: UIColor(Color.primary)],
        for: .selected
      )
    UISegmentedControl.appearance()
      .setTitleTextAttributes(
        [.foregroundColor: UIColor(Color.secondary)],
        for: .normal
      )
  }
}
