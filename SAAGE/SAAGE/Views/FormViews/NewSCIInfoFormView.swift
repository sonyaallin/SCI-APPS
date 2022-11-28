//
//  BasicInfoFormView.swift
//  SAAGE
//
//  Created by X on 2/6/22.
//

import SwiftUI


struct NewSCIInfoFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Additional Personal Information")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Form {
                Section(header: Text("Additional Information")) {
                    VStack(alignment: .leading, spacing: 20) {
                        Group {
                            VStack(alignment: .leading, spacing: 5) {
                                DatePicker(
                                    "Date of your spinal cord injury:",
                                    selection: $appViewModel.formViewModel.formModel.dateInjury,
                                    displayedComponents: [.date]
                                )
                                .datePickerStyle(.compact)
                            }
                            
                            MultipleChoiceQuestion(
                                text: Text("Type of injury:"),
                                options: ["Traumatic", "Non-traumatic"],
                                selectedOption: $appViewModel.formViewModel.formModel.typeInjury)
                            
                            MultipleChoiceQuestion(
                                text: Text("Completeness of injury:"),
                                options: ["Complete", "Incomplete"],
                                selectedOption: $appViewModel.formViewModel.formModel.completenessInjury
                            )
                            
                            MultipleChoiceQuestion(
                                text: Text("Level of injury:"),
                                options: ["Light", "Medium", "Heavy"], //what is an option?
                                selectedOption: $appViewModel.formViewModel.formModel.levelInjury)
                            
                            TextQuestion(
                                text: Text("Cause of injury"),
                                textField: $appViewModel.formViewModel.formModel.causeInjury,
                                height: 100
                            )
                        }
                        
                        Group {
                            Group {
                                MultipleChoiceQuestion(
                                    text: Text("Do you require assistance managing your bowel routine?"),
                                    options: ["Yes", "No"],
                                    selectedOption: $appViewModel.formViewModel.formModel.assistBowel)
                                
                                MultipleChoiceQuestion(
                                    text: Text("Do you require assistance managing your bladder routine?"),
                                    options: ["Yes", "No"],
                                    selectedOption: $appViewModel.formViewModel.formModel.assistBladder)
                                
                                MultipleChoiceQuestion(
                                    text: Text("Do you require assistance transfering to and from your wheelchair?"),
                                    options: ["Yes", "No"],
                                    selectedOption: $appViewModel.formViewModel.formModel.assistWheelchair)
                                
                                MultipleChoiceQuestion(
                                    text: Text("Do you require assistance turning?"),
                                    options: ["Yes", "No"],
                                    selectedOption: $appViewModel.formViewModel.formModel.assistTurning)
                                
                                MultipleChoiceQuestion(
                                    text: Text("Do you require assistance eating?"),
                                    options: ["Yes", "No"],
                                    selectedOption: $appViewModel.formViewModel.formModel.assistEating)
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

struct NewSCIInfoFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewSCIInfoFormView()
    }
}
