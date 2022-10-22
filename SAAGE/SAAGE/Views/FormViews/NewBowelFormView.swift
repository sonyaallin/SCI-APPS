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
                            text: Text("My question number 1"),
                            options: ["Yes", "No", "I'm not sure"],
                            selectedOption: $appViewModel.formViewModel.formModel.newField1)
                    
                        MultipleChoiceQuestion(
                            text: Text("My question number 2"),
                            options: ["Every day", "Every other day", "Several times a day", "Other"],
                            selectedOption: $appViewModel.formViewModel.formModel.newField2)
                        
                        MultipleChoiceQuestion(
                            text: Text("My question number 3"),
                            options: ["Morning", "Evening", "Other"],
                            selectedOption: $appViewModel.formViewModel.formModel.newField3)
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
