//
//  CalculationRowView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

struct CalculationRowView: View {
  let model: CalculationModel
  
  var body: some View {
    VStack(alignment: .leading) {
      HorizontalRowView(label: "NPS", text: model.nps.toString)
      HorizontalRowView(label: "Length", text: model.length.formatted(.localCurrency))
      HorizontalRowView(label: "Pressure", text: model.pressure.formatted(.localCurrency))
      HorizontalRowView(label: "Gas Volume", text: model.result.toCurrentLocale, isProminent: true)
      HorizontalRowView(label: "Calculated at", text: model.calculatedAt.formatted(date: .abbreviated, time: .omitted), labelColor: .secondary, textColor: .secondary)
        .padding(.top, 10)
    }
  }
}

struct CalculationRowView_Previews: PreviewProvider {
  static var previews: some View {
    let context = CoreDataProvider.preview.viewContext
    let model = CalculationModel.Preview.generateSample(using: context)
    
    return CalculationRowView(model: model)
      .environment(\.managedObjectContext, context)
  }
}
