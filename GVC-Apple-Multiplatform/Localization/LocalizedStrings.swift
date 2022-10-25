//
//  LocalizedStrings.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import SwiftUI

enum LocalizedStrings {
  struct App {
    static let title = NSLocalizedString(
      "Gas Volume Calculator",
      comment: "The title of the app")
  }
  
  struct Form {
    static let npsPickerLabel = NSLocalizedString(
      "Nominal Pipe Size",
      comment: "An established standard used for measuring the radius of a pipe's inner size")
    static let npsPickerHint = NSLocalizedString(
      "Select a dimension",
      comment: "Select a NPS: Nominal Pipe Size from the Picker")
    
    static let lengthFieldLabel = NSLocalizedString(
      "Length",
      comment: "A length value in meters")
    static let lengthFieldPlaceholder = NSLocalizedString(
      "Type in a length",
      comment: "Type into a text field a length in meters for a pipe"
    )
    
    static let pressureLabel = NSLocalizedString(
      "Pressure",
      comment: "A pressure value in millibars")
    static let pressurePickerHint = NSLocalizedString(
      "Select a pressure",
      comment: "Select a pressure in millibars from the Picker"
    )
    static let pressureFieldPlaceholder = NSLocalizedString(
      "Type in a pressure",
      comment: "Type into a text field a pressure in millibars")
    
    static let calculateButtonText = NSLocalizedString(
      "Calculate",
      comment: "Press the button to calculate the gas volume")
    
    static let resultLabel = NSLocalizedString(
      "Gas volume",
      comment: "The resulting gas volume from the calculation of the inputs provided")
    
    static let dismissButtonText = NSLocalizedString(
      "Dismiss",
      comment: "Press the button to dismiss the keyboard")
  }
}
