//
//  TransfersFormView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-16.
//

import SwiftUI

struct TransfersFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Transfers")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Form {
                Section(header: Text("Transfer Assistance")) {
                    VStack(alignment: .leading, spacing: 20) {
                        MultipleChoiceQuestion(
                            text: Text("To transfer between surfaces (e.g. from bed to wheelchair):"),
                            options: [
                                "I can transfer independently without assistance or devices",
                                "I can transfer independently with a sliding board",
                                "I need some assistance to transfer",
                                "I need assistance to transfer",
                                "Other"
                            ],
                            selectedOption: $appViewModel.formViewModel.formModel.transferAssistanceInfo)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("If you answered \"other\", you can add details here:")
                            TextField("", text: $appViewModel.formViewModel.formModel.otherTransferInfo)
                                .padding(5)
                                .border(Color.gray)
                        }.padding(.top, 5)
                    }
                }
            }
        }
    }
}

struct TransfersFormView_Previews: PreviewProvider {
    static var previews: some View {
        TransfersFormView()
    }
}
