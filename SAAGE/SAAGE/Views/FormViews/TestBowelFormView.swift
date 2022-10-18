//
//  TestBowelFormView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-16.
//

import SwiftUI

struct TestBowelFormView: View {
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
                        MultipleChoiceQuestion(
                            text: Text("How often do you perform your bowel management routine?"),
                            options: ["More thanonce a day", "Every 2 days", "Every 3 days", "More than every 3 days"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.bowelManagementFrequency)
                    
                        MultipleChoiceQuestion(
                            text: Text("At what times of day do you generally perform your bowel management routine?"),
                            options: ["3PM", "6PM"], // TODO: make a time-based question form
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.bowelManagementTime)
                        
                        MultipleChoiceQuestion(
                            text: Text("Do you require a supository during your bowel routine?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.requireSupository)
                        
                        MultipleChoiceQuestion(
                            text: Text("Do you require a micro enema during your bowel routine?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.requireMicroEnema)
                        
                        MultipleChoiceQuestion(
                            text: Text("Have you had a colostomy?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.hadColostomy)
                        
                        MultipleChoiceQuestion(
                            text: Text("Do you require digital stimulation during your bowel routine?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.requireDigitalSimulation)
                        
                        MultipleChoiceQuestion(
                            text: Text("Do you require manual disimpaction during your bowel routine?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.requireManualDisimpaction)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Please detail any other assistance you require:")
                            TextField("", text: $appViewModel.testFormViewModel.testFormModel.otherAssitanceRequest)
                                .padding(5)
                                .border(Color.gray)
                        }.padding(.top, 5)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Detail any assistance required to perform your bowel routine?")
                            TextField("", text: $appViewModel.testFormViewModel.testFormModel.bowelRoutineAssistanceRequest)
                                .padding(5)
                                .border(Color.gray)
                        }.padding(.top, 5)
                    }
                }
            }
        }
    }
}

struct TestBowelFormView_Previews: PreviewProvider {
    static var previews: some View {
        TestBowelFormView()
    }
}
