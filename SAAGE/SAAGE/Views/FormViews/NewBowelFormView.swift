//
//  NewBowelFormView.swift
//  SAAGE
//
//  Created by Sonya Allin on 2022-10-22.
//
import SwiftUI

struct NewBowelFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel

    init() {
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Bowel Management")
                .font(.subheadline)
                .fontWeight(.bold)

            Form {
                Section(header: Text("Bowel Routine Details")) {
                    VStack(alignment: .leading, spacing: 20) {
                        DropdownQuestion  (
                           text: Text("How often do you perform your bowel management routine?"),
                           options: ["More than once a day", "Every 2 days", "Every 3 days", "More than every 3 days"],
                           selectedOption: $appViewModel.formViewModel.formModel.bowelManagementFrequency)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            DatePicker(
                                "At what times of day do you generally perform your bowel management routine?",
                                selection: $appViewModel.formViewModel.formModel.bowelManagementTime,
                                displayedComponents: [.hourAndMinute]
                            )
                            .datePickerStyle(.compact)
                        }

                       ToggleQuestionProposal2(
                           text: Text("Do you require a supository during your bowel routine?"),
                           
                           selectedOption: $appViewModel.formViewModel.formModel.requireSupository)

                       ToggleQuestionProposal2(
                           text: Text("Do you require a micro enema during your bowel routine?"),
                           
                           selectedOption: $appViewModel.formViewModel.formModel.requireMicroEnema)

                       ToggleQuestionProposal2(
                           text: Text("Have you had a colostomy?"),
                           
                           selectedOption: $appViewModel.formViewModel.formModel.hadColostomy)

                       ToggleQuestionProposal2(
                           text: Text("Do you require digital stimulation during your bowel routine?"),
                           
                           selectedOption: $appViewModel.formViewModel.formModel.requireDigitalSimulation)

                       ToggleQuestionProposal2(
                           text: Text("Do you require manual disimpaction during your bowel routine?"),
                           
                           selectedOption: $appViewModel.formViewModel.formModel.requireManualDisimpaction)
                        
                        TextQuestion(
                            text: Text("Please detail any other assistance you require:"),
                            textField: $appViewModel.formViewModel.formModel.otherAssitanceRequest,
                            height: 100
                        )

                        TextQuestion(
                            text: Text("Detail any assistance required to perform your bowel routine?"),
                            textField: $appViewModel.formViewModel.formModel.bowelRoutineAssistanceRequest,
                            height: 100
                        )
                    }
                }
            }
        }
    }
}

struct NewBowelFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewBowelFormView()
    }
}
