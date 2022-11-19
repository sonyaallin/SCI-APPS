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
                                    text: Text("First name:"),
                                    textField: $appViewModel.formViewModel.formModel.lastName
                                )
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    RequiredText(text: Text("Email"))
                                    TextField("", text: $appViewModel.formViewModel.formModel.email)
                                        .textContentType(.emailAddress)
                                        .disableAutocorrection(true)
                                        .autocapitalization(.none)
                                        .padding(3)
                                        .border(Color.gray)
                                }  // TODO: make a component that wraps in TextQuestion
                            }
                            
                            VStack(alignment: .leading, spacing: 5) {
                                DatePicker(
                                    "Date of Birth:",
                                    selection: $appViewModel.formViewModel.formModel.birthDay,
                                    displayedComponents: .date
                                )
                                .datePickerStyle(.compact)
                            }
                            
                            Group {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Height (in cm)")
                                    TextField("", text: $appViewModel.formViewModel.formModel.height)
                                        .padding(3)
                                        .border(Color.gray)
                                }  // validation required

                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Weight (in cm)")
                                    TextField("", text: $appViewModel.formViewModel.formModel.weight)
                                        .padding(3)
                                        .border(Color.gray)
                                }  // validation required

                                MultipleChoiceQuestion(
                                    text: Text("Blood type:"),
                                    options: ["A", "B", "AB", "O"],
                                    selectedOption: $appViewModel.formViewModel.formModel.bloodType)

                                TextQuestion(
                                    text: Text("Date of Birth:"),
                                    textField: $appViewModel.formViewModel.formModel.dateOfBirth
                                )  // TODO: make a date picker component

                                TextQuestion(
                                    text: Text("Health card number:"),
                                    textField: $appViewModel.formViewModel.formModel.healthCardNumber
                                )

                                TextQuestion(
                                    text: Text("Medic Alert ID and details:"),
                                    textField: $appViewModel.formViewModel.formModel.medicAlertID,
                                    height: 100
                                )

                                TextQuestion(
                                    text: Text("Blood pressure:"),
                                    textField: $appViewModel.formViewModel.formModel.bloodPressure
                                )
                                // TODO: validation required
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

                            MultipleChoiceQuestion(
                                text: Text("Province:"),
                                options: ["ON", "QC", "NS", "NB", "MB", "BC", "PE", "SK", "AB", "NL"],
                                selectedOption: $appViewModel.formViewModel.formModel.province)

                            MultipleChoiceQuestion(
                                text: Text("Country:"),
                                options: ["Canada", "United States"],
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
