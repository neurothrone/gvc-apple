//
//  PreviousCalculationsView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import GVCCore
import SwiftUI

struct PreviousCalculationsView: View {
  let calculations: [CalculationModel]
  
  init(calculations: [CalculationModel] = CalculationModel.Preview.samples) {
    self.calculations = calculations
  }
  
  var body: some View {
    List {
      ForEach(calculations) { calculation in
          VStack(alignment: .leading) {
            HStack {
              Text("NPS")
                .foregroundColor(.accentColor)
              
              Spacer()
              
              Text(calculation.nps.toString)
            }
            HStack {
              Text("Length")
                .foregroundColor(.accentColor)
              
              Spacer()
              
              Text(calculation.length, format: .localCurrency)
            }
            HStack {
              Text("Pressure")
                .foregroundColor(.accentColor)
              
              Spacer()
              
              Text(calculation.pressure, format: .localCurrency)
            }
            
            HStack {
              Text("Gas Volume")
                .foregroundColor(.accentColor)
              
              Spacer()
              
              Text(calculation.result.toCurrentLocale)
                .font(.headline)
            }
            
            HStack {
              Text("Calculated at")
              Spacer()
              Text(calculation.calculatedAt.formatted(date: .abbreviated, time: .omitted))
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
    PreviousCalculationsView(calculations: CalculationModel.Preview.samples)
//      .preferredColorScheme(.dark)
  }
}
