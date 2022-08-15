//
//  SkinFormView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-16.
//

import SwiftUI

struct SkinFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Skin Care/Pressure Relief")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Form {
                Section(header: Text("Current Sores")) {
                    MultipleChoiceQuestion(
                        text: Text("Do you currently have any pressure sores?"),
                        options: ["Yes", "No", "I'm not sure"],
                        selectedOption: $appViewModel.formViewModel.formModel.hasPressureSores)
                }
                
                Section(header: Text("Turning")) {
                    MultipleChoiceQuestion(
                        text: Text("Do you require assistance with turning?"),
                        options: ["Yes", "No"],
                        selectedOption: $appViewModel.formViewModel.formModel.requireTurningAssistance)
                }
                
                Section(header: Text("Problem Areas")) {
                    MultipleChoiceQuestion(
                        text: Text("Are there particular areas where you are prone to skin breakdown/need to avoid pressure?"),
                        options: ["Yes", "No"],
                        selectedOption: $appViewModel.formViewModel.formModel.hasAreasAvoidPressure)
                }
            }
        }
    }
}

struct SkinFormView_Previews: PreviewProvider {
    static var previews: some View {
        SkinFormView()
    }
}
