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
  
  @AppStorage(Constants.AppStorage.selectedNPS)
  private var selectedNPS: NPSSelection = .twenty
  @AppStorage(Constants.AppStorage.selectedPressure)
  private var selectedPressure: PressureSelection = .thirty
  
  @AppStorage(Constants.AppStorage.length)
  private var length: String = ""
  @AppStorage(Constants.AppStorage.pressure)
  private var pressure: String = ""
  
  @State private var result: Double = .zero
  
  private var isInputValid: Bool {
    guard Double(length) != nil,
          Double(pressure) != nil
    else { return false }
    
    if selectedPressure == .custom && pressure == "" {
      return false
    }
    
    return true
  }
  
  var body: some View {
    content
      .onAppear {
        if selectedPressure != .custom {
          pressure = selectedPressure.rawValue
        }
      }
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
      
      LengthSectionView(text: $length)
        .focused($focusedField, equals: .length)
      
      PressureSectionView(text: $pressure, selection: $selectedPressure)
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
    let pressureString: String
    
    if selectedPressure == .custom {
      pressureString = pressure
    } else {
      pressureString = selectedPressure.rawValue
    }
    
    guard let lengthValue = Double(length),
          let pressureValue = Double(pressureString)
    else { return }
    
    
    result = GVCCore.calculateGasVolume(
      nps: selectedNPS,
      length: lengthValue,
      pressure: pressureValue
    )
    
    let _ = Calculation.createWith(
      nps: selectedNPS,
      length: lengthValue,
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
