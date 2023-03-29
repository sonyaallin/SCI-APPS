//
//  BasicInfoFormView.swift
//  SAAGE
//
//  Created by X on 2/6/22.
//

import SwiftUI

struct NewFieldSet<Content: View>: View {
    var label: Text
    @ViewBuilder var content: Content
    
    var body: some View {
        // Make the label offset on top of a border and give it label a background color
        ZStack {
            content.padding().border(Color.black)
            label.padding(.horizontal, 2).background(Color.white).offset(x: -12, y: -26)
        }
    }
}

struct NewBasicInfoFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Basic Information")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Form {
                Section(header: Text("About Me")) {
                    VStack(alignment: .leading, spacing: 20) {
                        Group {
                            Group {
                                TextQuestion(
                                    text: Text("First name:"),
                                    textField: $appViewModel.formViewModel.formModel.firstName
                                )

                                TextQuestion(
                                    text: Text("Last name:"),
                                    textField: $appViewModel.formViewModel.formModel.lastName
                                )

                                TextQuestion(
                                    text: Text("Email:"),
                                    textField: $appViewModel.formViewModel.formModel.email
                                )
                            }

                            

                            Group {
                                TextQuestionFloatValidation(
                                    text: Text("Height (in cm)"),
                                    textField: $appViewModel.formViewModel.formModel.height,
                                    lowerLimit: 0,
                                    upperLimit: 300
                                )
                                
                                TextQuestionFloatValidation(
                                    text: Text("Weight (in kg)"),
                                    textField: $appViewModel.formViewModel.formModel.weight,
                                    lowerLimit: 0,
                                    upperLimit: 300
                                )

                                MultipleChoiceQuestion(
                                    text: Text("Blood type:"),
                                    options: ["A", "B", "AB", "O"],
                                    selectedOption: $appViewModel.formViewModel.formModel.bloodType)

                                VStack(alignment: .leading, spacing: 5) {
                                    DatePicker(
                                        "Date of Birth:",
                                        selection: $appViewModel.formViewModel.formModel.birthDay,
                                        displayedComponents: .date
                                    )
                                    .datePickerStyle(.compact)
                                }

                                TextQuestion(
                                    text: Text("Health card number:"),
                                    textField: $appViewModel.formViewModel.formModel.healthCardNumber
                                )

                                TextQuestion(
                                    text: Text("Medic Alert ID and details:"),
                                    textField: $appViewModel.formViewModel.formModel.medicAlertID,
                                    height: 100
                                )
                                
                                TextQuestionFloatValidation(
                                    text: Text("Blood pressure"),
                                    textField: $appViewModel.formViewModel.formModel.bloodPressure,
                                    lowerLimit: 0,
                                    upperLimit: 300
                                )
                            }
                        }

                        TextQuestion(
                            text: Text("Allergies"),
                            textField: $appViewModel.formViewModel.formModel.allergies
                        )
                        Group {
                            TextQuestion(
                                text: Text("Address\n\nStreet"),
                                textField: $appViewModel.formViewModel.formModel.street
                            )

                            TextQuestion(
                                text: Text("Unit"),
                                textField: $appViewModel.formViewModel.formModel.street
                            )

                            TextQuestion(
                                text: Text("City"),
                                textField: $appViewModel.formViewModel.formModel.street
                            )

                            DropdownQuestion(
                                text: Text("Province:"),
                                options: ["ON", "QC", "NS", "NB", "MB", "BC", "PE", "SK", "AB", "NL"],
                                selectedOption: $appViewModel.formViewModel.formModel.province)

                            MultipleChoiceQuestion(
                                text: Text("Country:"),
                                options: ["Canada"],
                                selectedOption: $appViewModel.formViewModel.formModel.country
                            ) // TODO: make it dynamic

                            TextQuestion(
                                text: Text("Postal Code"),
                                textField: $appViewModel.formViewModel.formModel.postalCode
                            )
                        }
                    }
                }
            }
        }
    }
}

struct NewBasicInfoFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewBasicInfoFormView()
    }
}
