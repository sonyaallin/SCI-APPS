//
//  BasicInfoFormView.swift
//  SAAGE
//
//  Created by X on 2/6/22.
//

import SwiftUI

struct FieldSet<Content: View>: View {
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

struct BasicInfoFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Basic Information")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Form {
                Section(header: Text("About Me")) {
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("First Name")
                            TextField("", text: $appViewModel.formViewModel.formModel.firstName)
                                .padding(3)
                                .border(Color.gray)
                        }.padding(.top, 5)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            RequiredText(text: Text("Last Name"))
                            TextField("", text: $appViewModel.formViewModel.formModel.lastName)
                                .padding(3)
                                .border(Color.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            RequiredText(text: Text("Email"))
                            TextField("", text: $appViewModel.formViewModel.formModel.email)
                                .textContentType(.emailAddress)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding(3)
                                .border(Color.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Typical blood pressure")
                            TextField("", text: $appViewModel.formViewModel.formModel.typicalBloodPressure)
                                .padding(3)
                                .border(Color.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Height")
                            TextField("", text: $appViewModel.formViewModel.formModel.height)
                                .padding(3)
                                .border(Color.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Weight")
                            TextField("", text: $appViewModel.formViewModel.formModel.weight)
                                .padding(3)
                                .border(Color.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Date of Birth:")
                            TextField("", text: $appViewModel.formViewModel.formModel.dateOfBirth)
                                .padding(3)
                                .border(Color.gray)
                        }
                    }
                }
            }
        }
    }
}

struct BasicInfoFormView_Previews: PreviewProvider {
    static var previews: some View {
        BasicInfoFormView()
    }
}
