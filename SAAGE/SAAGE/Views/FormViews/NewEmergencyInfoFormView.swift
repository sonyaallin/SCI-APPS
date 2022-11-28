//
//  BasicInfoFormView.swift
//  SAAGE
//
//  Created by X on 2/6/22.
//

import SwiftUI


struct NewEmergencyInfoFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Emergency Contact")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Form {
                    Section(header: Text("Emergency Contact")) {
                        VStack(alignment: .leading, spacing: 20) {
                            TextQuestion(
                                text: Text("Contact Name"),
                                textField: $appViewModel.formViewModel.formModel.contactName
                            )
                            
                            TextQuestion(
                                text: Text("Relationship to Contact"),
                                textField: $appViewModel.formViewModel.formModel.contactRelationship
                            )
                            
                            TextQuestion(
                                text: Text("Phone"),
                                textField: $appViewModel.formViewModel.formModel.contactPhone
                            )
                            
                            TextQuestion(
                                text: Text("Email"),
                                textField: $appViewModel.formViewModel.formModel.contactEmail
                            )
                            
                            
                        }
                    }
                }
            }
        }
    }
}

struct NewEmergencyInfoFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewEmergencyInfoFormView()
    }
}
