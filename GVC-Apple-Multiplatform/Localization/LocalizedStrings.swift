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
    
    static let calculateTab = NSLocalizedString(
      "Calculate",
      comment: "The text on the Calculate Tab")
    
    static let previousCalculationsTab = NSLocalizedString(
      "Previous Calculations",
      comment: "The text on the Previous Calculations Tab")
    
    static let emptyCalculations = NSLocalizedString(
      "No calculations yet.",
      comment: "The text for Previous Calculations Screen when there are no calculations.")
    
    static let aboutLabelText = NSLocalizedString(
      "About",
      comment: "The Menu button label text for the About sheet")
    
    static let deleteDataAlertTitle = NSLocalizedString(
      "Delete all data",
      comment: "The text of the delete data alert title")
    
    static let deleteDataAlertMessage = NSLocalizedString(
      "This will delete all of your data. Are you sure?",
      comment: "The text of the delete data alert message")
    
    static let deleteDataAlertCancelButton = NSLocalizedString(
      "Cancel",
      comment: "The text of the delete data alert cancel button")
    
    static let deleteDataAlertDeleteButton = NSLocalizedString(
      "Delete",
      comment: "The text of the delete data alert delete button")
    
    static let madeWith = NSLocalizedString("Made with", comment: "About sheet author 1")
    static let by = NSLocalizedString("by", comment: "About sheet author 2")
    static let appIconBy = NSLocalizedString("App icon by", comment: "About sheet attribution")
  }
  
  struct Form {
    static let npsPickerLabel = NSLocalizedString(
      "Nominal Pipe Size - DN (mm)",
      comment: "An established standard used for measuring the radius of a pipe's inner size")
    static let npsPickerHint = NSLocalizedString(
      "Select a dimension",
      comment: "Select a NPS: Nominal Pipe Size from the Picker")
    static let npsFooterText = NSLocalizedString(
      "Learn more about NPS standards at this link",
      comment: "Footnote text for NPS")
    
    static let lengthFieldLabel = NSLocalizedString(
      "Length (m)",
      comment: "A length value in meters")
    static let lengthFieldPlaceholder = NSLocalizedString(
      "Type in a length",
      comment: "Type into a text field a length in meters for a pipe"
    )
    
    static let pressureLabel = NSLocalizedString(
      "Pressure (mbar)",
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
    
    static let nps = NSLocalizedString("NPS", comment: "Row NPS label")
    static let length = NSLocalizedString("Length", comment: "Row Length label")
    static let pressure = NSLocalizedString("Pressure", comment: "Row Pressure label")
    static let gasVolume = NSLocalizedString("Gas Volume", comment: "Row Gas Volume label")
    static let calculatedAt = NSLocalizedString("Calculated at", comment: "Row Calculated at label")
  }
}
