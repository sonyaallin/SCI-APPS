//
//  AutonomicDysreflexiaFormView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-16.
//

import SwiftUI

struct AutonomicDysreflexiaFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Autonomic Dysreflexia")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text("Autonomic Dysreflexia (AD) is a potentially life threatening rise in blood pressure. It is often caused by pain or a harmful stimulus below the level of injury (full bladder, impacted bowel, pressure sore, bone fracture, etc.). Typically, people with spinal cord injury above the T6 level are affected.")
            
            Form {
                Section(header: Text("Symptoms")) {
                    VStack(alignment: .leading, spacing: 20) {
                        MultipleChoiceQuestion(
                            text: Text("Do you experience autonomic dysreflexia?"),
                            options: ["Yes", "No", "I'm not sure"],
                            selectedOption: $appViewModel.formViewModel.formModel.experienceAD)
                        
                        CheckboxQuestion(
                            text: Text("What symptoms of autonomic dysreflexia do you experience? (check all that apply)"),
                            options: [
                                "Pounding headached",
                                "Blushing/flushed skin",
                                "Sweating",
                                "Goosebumps",
                                "Shivering"
                            ],
                            selectedOptions: $appViewModel.formViewModel.formModel.symptomsAD)
                    }
                }
            }
        }
    }
}

struct AutonomicDysreflexiaFormView_Previews: PreviewProvider {
    static var previews: some View {
        AutonomicDysreflexiaFormView()
    }
}
