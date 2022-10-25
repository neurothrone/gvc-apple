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
    fetchRequest: CalculationModel.all,
    animation: .easeInOut
  )
  private var calculationModels
  
  var body: some View {
    NavigationStack {
      content
        .navigationTitle("Previous Calculations")
        .navigationBarTitleDisplayMode(.inline)
    }
  }
  
  private var content: some View {
    List {
      ForEach(calculationModels) { model in
        CalculationRowView(model: model)
      }
      .onDelete(perform: delete)
    }
  }
}

extension PreviousCalculationsScreen {
  private func delete(atOffsets: IndexSet) {
    guard let index = atOffsets.first else { return }
    calculationModels[index].delete(using: viewContext)
  }
}

struct PreviousCalculationsScreen_Previews: PreviewProvider {
  static var previews: some View {
    PreviousCalculationsScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
