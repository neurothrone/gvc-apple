//
//  PreviousCalculationsScreen.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import GVCCore
import SwiftUI

struct PreviousCalculationsScreen: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    fetchRequest: Calculation.all,
    animation: .easeInOut
  )
  private var calculations
  
  var body: some View {
    if calculations.isEmpty {
      Color(UIColor.systemGroupedBackground)
        .ignoresSafeArea()
    } else {
      List {
        ForEach(calculations) { calculation in
          CalculationRowView(calculation: calculation)
        }
        .onDelete(perform: delete)
      }
    }
  }
}

extension PreviousCalculationsScreen {
  private func delete(atOffsets: IndexSet) {
    guard let index = atOffsets.first else { return }
    calculations[index].delete(using: viewContext)
  }
}

struct PreviousCalculationsScreen_Previews: PreviewProvider {
  static var previews: some View {
    PreviousCalculationsScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
