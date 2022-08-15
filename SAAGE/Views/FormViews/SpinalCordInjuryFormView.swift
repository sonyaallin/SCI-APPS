//
//  SpinalCordInjuryFormView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-16.
//

import SwiftUI

struct SpinalCordInjuryFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("My Spinal Cord Injury")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Form {
                Section(header: Text("Date")) {
                    MultipleChoiceQuestion(
                        text: Text("Do you know the date of your spinal cord injury?"),
                        options: ["Yes", "No"],
                        selectedOption: $appViewModel.formViewModel.formModel.knowDateOfSpinalCordInjury)
                }
                
                Section(header: Text("Cause")) {
                    MultipleChoiceQuestion(
                        text: Text("What was the cause of your spinal cord injury?"),
                        options: ["Trauma (example: accident or fall)", "Non-trauma (example: degeneration or disease)", "I'm not sure"],
                        selectedOption: $appViewModel.formViewModel.formModel.causeOfSpinalCordInjury)
                }
                
                Section(header: Text("Level & Completeness")) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("What is the level of your spinal cord injury?")
                        Picker("Please select...", selection: $appViewModel.formViewModel.formModel.levelOfSpinalCordInjury) {
                            EmptyView()
                        }.padding(5).border(Color.gray)
                    }
                }
            }
        }
    }
}

struct SpinalCordInjuryFormView_Previews: PreviewProvider {
    static var previews: some View {
        SpinalCordInjuryFormView()
    }
}
