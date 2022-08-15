//
//  BladderFormView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-16.
//

import SwiftUI

struct BladderFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Bladder Management")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text("Spinal cord injury typically affects the way your urinary system works, requiring a management routine that may involve a variety of techniques and supplies.")
            
            Form {
                Section(header: Text("Bladder Routine Details")) {
                    VStack(alignment: .leading, spacing: 20) {
                        MultipleChoiceQuestion(
                            text: Text("Does you spinal cord injury affect your urinary function?"),
                            options: ["Yes", "No", "I'm not sure"],
                            selectedOption: $appViewModel.formViewModel.formModel.injuryAffectUrinaryFunction)
                        
                        CheckboxQuestion(
                            text: Text("What does your bladder management routine typically involve?"),
                            options: [
                                "indwelling catheter and collection bag",
                                "condom (external) catheter and collection bag",
                                "suprapubic catheter and collection bag",
                                "intermittent catheterization (in and out) through my urethra",
                                "intermittent catheterization (in and out) through an abdominal stoma (mitrofanoff)"
                            ],
                            selectedOptions: $appViewModel.formViewModel.formModel.bladderManagementRoutine)
                    }
                }
            }
        }
    }
}

struct BladderFormView_Previews: PreviewProvider {
    static var previews: some View {
        BladderFormView()
    }
}
