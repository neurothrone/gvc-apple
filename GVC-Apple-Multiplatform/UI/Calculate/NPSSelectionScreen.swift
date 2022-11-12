//
//  NPSSelectionScreen.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import GVCCore
import SwiftUI

struct NPSSelectionScreen: View {
  @Binding var selection: NPSSelection
  
  var body: some View {
    List {
      Section {
        ForEach(NPSSelection.allCases) { npsSelection in
          Button {
            withAnimation(.linear) {
              selection = npsSelection              
            }
          } label: {
            HStack {
              Text(npsSelection.toString)
                .foregroundColor(.primary)
              
              if selection == npsSelection {
                Spacer()
                Image(systemName: "checkmark.seal.fill")
                  .foregroundColor(.accentColor)
                  .imageScale(.large)
              }
            }
          }
        }
      } header: {
        Text(LocalizedStrings.Form.npsPickerHint)
      }
    }
  }
}

struct NPSSelectionScreen_Previews: PreviewProvider {
  static var previews: some View {
    NPSSelectionScreen(selection: .constant(.threeHundred))
  }
}
