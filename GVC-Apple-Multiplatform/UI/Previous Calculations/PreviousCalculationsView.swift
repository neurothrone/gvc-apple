//
//  PreviousCalculationsView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import GVCCore
import SwiftUI

struct PreviousCalculationsView: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    fetchRequest: CalculationModel.all,
    animation: .easeInOut
  )
  private var calculationModels
  
  var body: some View {
    List {
      ForEach(calculationModels) { model in
        VStack(alignment: .leading) {
          HStack {
            Text("NPS")
              .foregroundColor(.accentColor)
            Spacer()
            Text(model.nps.toString)
          }
          HStack {
            Text("Length")
              .foregroundColor(.accentColor)
            Spacer()
            Text(model.length, format: .localCurrency)
          }
          HStack {
            Text("Pressure")
              .foregroundColor(.accentColor)
            Spacer()
            Text(model.pressure, format: .localCurrency)
          }
          HStack {
            Text("Gas Volume")
              .foregroundColor(.accentColor)
            Spacer()
            Text(model.result.toCurrentLocale)
              .font(.headline)
          }
          HStack {
            Text("Calculated at")
            Spacer()
            Text(model.calculatedAt.formatted(date: .abbreviated, time: .omitted))
          }
          .foregroundColor(.secondary)
          .padding(.top, 10)
        }
      }
    }
  }
}

struct PreviousCalculationsView_Previews: PreviewProvider {
  static var previews: some View {
    let context = CoreDataProvider.preview.viewContext
    
    PreviousCalculationsView()
      .environment(\.managedObjectContext, context)
    //      .preferredColorScheme(.dark)
  }
}
