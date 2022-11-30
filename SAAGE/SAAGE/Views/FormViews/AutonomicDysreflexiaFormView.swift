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
            
            Text("INTRODUCTION\nAutonomic Dysreflexia (AD) is a potentially life threatening rise in blood pressure above your normal (baseline) level. It is often caused by pain or a harmful stimulus below the level of injury (full bladder, impacted bowel, pressure sore, bone fracture, etc.).\nTypically, people with spinal cord injury at or above the T6 level are affected.")
            
            Form {
                Section(header: Text("Symptoms")) {
                    VStack(alignment: .leading, spacing: 20) {
                        MultipleChoiceQuestion(
                            text: Text("Do you experience autonomic dysreflexia?"),
                            options: ["Yes", "No", "Not sure"],
                            selectedOption: $appViewModel.formViewModel.formModel.experienceAD)
                        
                        CheckboxQuestion(
                            text: Text("What symptoms of autonomic dysreflexia do you experience? (check all that apply)"),
                            options: [
                                "Blushing/flushed skin",
                                "Pounding headached",
                                "Sweating",
                                "Goosebumps",
                                "Shivering",
                                "Agitation",
                                "Nasal Stiffness",
                                "Other"
                            ],
                            selectedOptions: $appViewModel.formViewModel.formModel.symptomsAD
                        )
                        
                        CascadingTextToCheckbox(
                            originalOption: $appViewModel.formViewModel.formModel.symptomsAD,
                            conditionalAnswer: "Other",
                            CascadingQuestion:
                                TextQuestion(
                                    text: Text("If you answered \"other,\" you can add details here:"),
                                    textField: $appViewModel.formViewModel.formModel.otherAD
                                )
                        )
                        
                        TextQuestion(
                            text: Text("Feel free to provide more information:"),
                            textField: $appViewModel.formViewModel.formModel.freeTextAD,
                            height: 100
                        )
                        
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
