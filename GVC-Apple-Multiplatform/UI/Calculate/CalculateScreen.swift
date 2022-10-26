//
//  CalculateScreen.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import GVCCore
import SwiftUI

struct CalculateScreen: View {
  private enum Field {
    case length
    case pressure
  }
  
  @Environment(\.managedObjectContext) private var viewContext
  @FocusState private var focusedField: Field?
  
  @AppStorage("selectedNPS")
  private var selectedNPS: NPSSelection = .twenty
  @AppStorage("selectedPressure")
  private var selectedPressure: PressureSelection = .thirty
  
  @AppStorage("length")
  private var length: Double = .zero
  @AppStorage("pressure")
  private var pressure: Double = .zero
  
  @State private var result: Double = .zero
  
  private var isInputValid: Bool {
    if length == .zero { return false }
    
    if selectedPressure == .custom && pressure == .zero {
      return false
    }
    
    return true
  }
  
  var body: some View {
    content
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Spacer()
          Button(LocalizedStrings.Form.dismissButtonText) {
            focusedField = nil
          }
        }
      }
  }
  
  private var content: some View {
    Form {
      NPSSectionView(selection: $selectedNPS)
      LengthSectionView(value: $length)
        .focused($focusedField, equals: .length)
      PressureSectionView(value: $pressure, selection: $selectedPressure)
        .focused($focusedField, equals: .pressure)
      
      Button(action: calculate) {
        Text(LocalizedStrings.Form.calculateButtonText)
      }
      .disabled(!isInputValid)
      
      CalculateResultSectionView(value: $result)
    }
  }
}

extension CalculateScreen {
  private func calculate() {
    let pressureValue: Double
    
    if selectedPressure == .custom {
      pressureValue = pressure
    } else {
      pressureValue = Double(selectedPressure.rawValue) ?? .zero
    }
    
    result = GVCCore.calculateGasVolume(
      nps: selectedNPS,
      length: length,
      pressure: pressureValue
    )
    
    let _ = CalculationModel.createWith(
      nps: selectedNPS,
      length: length,
      pressure: pressureValue,
      result: result,
      using: viewContext
    )
    
    focusedField = nil
  }
}

struct CalculateScreen_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      CalculateScreen()
        .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
    }
  }
}
