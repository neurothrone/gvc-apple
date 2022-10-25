//
//  MainScreen.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import GVCCore
import SwiftUI

struct MainScreen: View {
  private enum Field {
    case length
    case pressure
  }
  
  @FocusState private var focusedField: Field?
  
  @AppStorage("selectedNPS")
  private var selectedNPS: NPSSelection = .twenty
  
  @AppStorage("selectedPressure")
  private var selectedPressure: PressureSelection = .thirty
  
  @State private var isCustomPressure = false
  
  @State private var length: Double = .zero
  @State private var pressure: Double = .zero
  @State private var result: Double = .zero
  
  private var isInputValid: Bool {
    if length == .zero { return false }
    
    if selectedPressure == .custom && pressure == .zero {
      return false
    }
    
    return true
  }
  
  var body: some View {
    NavigationStack {
      content
        .navigationTitle(LocalizedStrings.App.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
          isCustomPressure = selectedPressure == .custom
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
  }
  
  private var content: some View {
    Form {
      npsSection
      lengthSection
      pressureSection
      calculateButton
      CalculateResultView(value: $result)
    }
  }
  
  private var npsSection: some View {
    Section {
      NavigationLink {
        NPSSelectionView(selection: $selectedNPS)
      } label: {
        Text(selectedNPS.toString)
      }
    } header: {
      SectionHeaderView(text: LocalizedStrings.Form.npsPickerLabel)
    } footer: {
      NPSLinkView()
    }
  }
  
  private var lengthSection: some View {
    Section {
      DecimalTextFieldView(
        value: $length,
        placeholder: LocalizedStrings.Form.lengthFieldPlaceholder
      )
      .focused($focusedField, equals: .length)
    } header: {
      SectionHeaderView(text: LocalizedStrings.Form.lengthFieldLabel)
    }
  }
  
  private var pressureSection: some View {
    Section {
      Picker(
        LocalizedStrings.Form.pressurePickerHint,
        selection: $selectedPressure
      ) {
        ForEach(PressureSelection.allCases) {
          Text($0.toString)
        }
      }
      .pickerStyle(.segmented)
      .onChange(of: selectedPressure) { _ in
        isCustomPressure = selectedPressure == .custom
      }
      
      if isCustomPressure {
        DecimalTextFieldView(
          value: $pressure,
          placeholder: LocalizedStrings.Form.pressureFieldPlaceholder
        )
        .focused($focusedField, equals: .pressure)
      }
    } header: {
      SectionHeaderView(text: LocalizedStrings.Form.pressureLabel)
    }
  }
  
  private var calculateButton: some View {
    Button(action: calculate) {
      Text(LocalizedStrings.Form.calculateButtonText)
    }
    .disabled(!isInputValid)
  }
}

extension MainScreen {
  private func calculate() {
    let pressureValue: Double
    
    if isCustomPressure {
      pressureValue = pressure
    } else {
      pressureValue = Double(selectedPressure.rawValue) ?? .zero
    }
    
    result = GVCCore.calculateGasVolume(
      nps: selectedNPS,
      length: length,
      pressure: pressureValue
    )
    
    focusedField = nil
  }
}

struct MainScreen_Previews: PreviewProvider {
  static var previews: some View {
    MainScreen()
  }
}
