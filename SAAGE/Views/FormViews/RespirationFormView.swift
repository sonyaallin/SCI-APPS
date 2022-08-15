//
//  Resperation.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-22.
//

import SwiftUI

struct RespirationFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Breathing")
                .font(.subheadline)
                .fontWeight(.bold)
            Text("Please check only one box depending on weather or not you need a respiratory (tracheal) tube")
                .font(.subheadline)
                .fontWeight(.bold)
            Form{
                Section(header: Text("Respiration Details")) {
                    VStack(alignment: .leading, spacing: 20) {
                        MultipleChoiceQuestion(
                            text: Text("I need a respiratory (tracheal) tube..."),
                            options: ["as well as permanent or from time to time assisted ventiation",
                                      "as well as extra oxygen and a lot of assistance in coughing and respiratory tube management",
                                      "as well as little assistance in coughing or respiratory tube management"
                            ],
                            selectedOption: $appViewModel.formViewModel.formModel.respirationNeeds)
                    
                        MultipleChoiceQuestion(
                            text: Text("How often do you do your bowel routine (empty your bowel)?"),
                            options: ["but i need extra oxygen or a lot of assistance in coughing or a mask (e.g., positive       end-expiratory pressure (PEEP)) or assisted ventilation from time to time (e.g., bilevel positive airway pressure (BIPAP))",
                                      "and only little assistance or stimulation from coughing",
                                      "and can breathe and cough independently without any assistance or adaptive device"
                            ],
                            selectedOption: $appViewModel.formViewModel.formModel.respirationNeeds)
                    }
                }
            }
        }
    }
}
