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
            Text("Revised Bowel Management Form")
                .font(.subheadline)
                .fontWeight(.bold)

            Form {
                Section(header: Text("Bowel Routine Details")) {
                    VStack(alignment: .leading, spacing: 20) {
                        MultipleChoiceQuestion(
                           text: Text("How often do you perform your bowel management routine?"),
                           options: ["More thanonce a day", "Every 2 days", "Every 3 days", "More than every 3 days"],
                           selectedOption: $appViewModel.formViewModel.formModel.bowelManagementFrequency)

                       MultipleChoiceQuestion(
                           text: Text("At what times of day do you generally perform your bowel management routine?"),
                           options: ["3PM", "6PM"], // TODO: make a time-based question form
                           selectedOption: $appViewModel.formViewModel.formModel.bowelManagementTime)

                       MultipleChoiceQuestion(
                           text: Text("Do you require a supository during your bowel routine?"),
                           options: ["Yes", "No"],
                           selectedOption: $appViewModel.formViewModel.formModel.requireSupository)

                       MultipleChoiceQuestion(
                           text: Text("Do you require a micro enema during your bowel routine?"),
                           options: ["Yes", "No"],
                           selectedOption: $appViewModel.formViewModel.formModel.requireMicroEnema)

                       MultipleChoiceQuestion(
                           text: Text("Have you had a colostomy?"),
                           options: ["Yes", "No"],
                           selectedOption: $appViewModel.formViewModel.formModel.hadColostomy)

                       MultipleChoiceQuestion(
                           text: Text("Do you require digital stimulation during your bowel routine?"),
                           options: ["Yes", "No"],
                           selectedOption: $appViewModel.formViewModel.formModel.requireDigitalSimulation)

                       MultipleChoiceQuestion(
                           text: Text("Do you require manual disimpaction during your bowel routine?"),
                           options: ["Yes", "No"],
                           selectedOption: $appViewModel.formViewModel.formModel.requireManualDisimpaction)

                       VStack(alignment: .leading, spacing: 5) {
                           Text("Please detail any other assistance you require:")
                           TextField("", text: $appViewModel.formViewModel.formModel.otherAssitanceRequest)
                               .padding(5)
                               .border(Color.gray)
                       }.padding(.top, 5)

                       VStack(alignment: .leading, spacing: 5) {
                           Text("Detail any assistance required to perform your bowel routine?")
                           TextField("", text: $appViewModel.formViewModel.formModel.bowelRoutineAssistanceRequest)
                               .padding(5)
                               .border(Color.gray)
                       }.padding(.top, 5)
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
