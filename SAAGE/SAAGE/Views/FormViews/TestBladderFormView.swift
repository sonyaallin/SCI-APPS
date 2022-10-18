//
//  TestBladderFormView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-16.
//

import SwiftUI

struct TestBladderFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Bladder Management")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Form {
                Section(header: Text("Bowel Routine Details")) {
                    VStack(alignment: .leading, spacing: 20) {
                        MultipleChoiceQuestion(
                            text: Text("Do you require an indwelling catheter?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.requireIndwellingCatheter)
                        
                        MultipleChoiceQuestion(
                            text: Text("Do you require an condom catheter?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.requireCondomCatheter)
                        
                        MultipleChoiceQuestion(
                            text: Text("Do you require a suprapubic catheter?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.requireSuprapublicCatheter)
                        
                        MultipleChoiceQuestion(
                            text: Text("Do you require a intermittent catheter?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.requireIntermittentCatheter)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Is this through your urethra? (yes, no)")
                            TextField("", text: $appViewModel.testFormViewModel.testFormModel.throughYourUrethra)
                                .padding(5)
                                .border(Color.gray)
                        }.padding(.top, 5)
                        
                        MultipleChoiceQuestion(
                            text: Text("Is this through an abdominal stoma (mitrofanoff)? "),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.throughAbdominalStoma)
                        
                        MultipleChoiceQuestion(
                            text: Text("Do you require an ileal conduit/urostomy and collection bag?"),
                            options: ["Yes", "No"],
                            selectedOption: $appViewModel.testFormViewModel.testFormModel.requireIlealConduit)
                    }
                }
            }
        }
    }
}

struct TestBladderFormView_Previews: PreviewProvider {
    static var previews: some View {
        TestBowelFormView()
    }
}
