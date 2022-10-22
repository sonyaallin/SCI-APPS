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
                            text: Text("Does you spinal cord injury affect your bowel function?"),
                            options: ["Yes", "No", "I'm not sure"],
                            selectedOption: $appViewModel.formViewModel.formModel.injuryAffectBowelFunction)
                    
                        MultipleChoiceQuestion(
                            text: Text("How often do you do your bowel routine (empty your bowel)?"),
                            options: ["Every day", "Every other day", "Several times a day", "Other"],
                            selectedOption: $appViewModel.formViewModel.formModel.bowelRoutineSchedule)
                        
                        MultipleChoiceQuestion(
                            text: Text("What time of day do you typically do your bowel routine (empty your bowel)?"),
                            options: ["Morning", "Evening", "Other"],
                            selectedOption: $appViewModel.formViewModel.formModel.bowelRoutineTime)
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
