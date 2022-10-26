//
//  CalculationRowView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

struct CalculationRowView: View {
  let calculation: Calculation
  
  var body: some View {
    VStack(alignment: .leading) {
      HorizontalRowView(label: "NPS", text: calculation.nps.toString)
      HorizontalRowView(label: "Length", text: calculation.length.formatted(.localCurrency))
      HorizontalRowView(label: "Pressure", text: calculation.pressure.formatted(.localCurrency))
      HorizontalRowView(label: "Gas Volume", text: calculation.result.toCurrentLocale, isProminent: true)
      HorizontalRowView(label: "Calculated at", text: calculation.calculatedAt.formatted(date: .abbreviated, time: .omitted), labelColor: .secondary, textColor: .secondary)
        .padding(.top, 10)
    }
  }
}

struct CalculationRowView_Previews: PreviewProvider {
  static var previews: some View {
    let context = CoreDataProvider.preview.viewContext
    let calculation = Calculation.Preview.generateSample(using: context)
    
    return CalculationRowView(calculation: calculation)
      .environment(\.managedObjectContext, context)
  }
}
