//
//  NPSSelectionView.swift
//  GVC-Apple-Multiplatform
//
//  Created by Zaid Neurothrone on 2022-10-25.
//

import GVCCore
import SwiftUI

struct NPSSelectionView: View {
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
                  .foregroundColor(.green)
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

struct NPSSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    NPSSelectionView(selection: .constant(.threeHundred))
  }
}
