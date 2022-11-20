//
//  TestBladderFormView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-16.
//
import SwiftUI

struct NewBladderFormView: View {
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
                        ToggleQuestionProposal2(
                            text: Text("Do you require an indwelling catheter?"),
                            selectedOption: $appViewModel.formViewModel.formModel.requireIndwellingCatheter)

                        ToggleQuestionProposal2(
                            text: Text("Do you require an condom catheter?"),
                            selectedOption: $appViewModel.formViewModel.formModel.requireCondomCatheter)

                        ToggleQuestionProposal2(
                            text: Text("Do you require a suprapubic catheter?"),
                            selectedOption: $appViewModel.formViewModel.formModel.requireSuprapublicCatheter)

                        ToggleQuestionProposal2(
                            text: Text("Do you require an intermittent catheter?"),
                            selectedOption: $appViewModel.formViewModel.formModel.requireIntermittentCatheter)
                        
                        CascadingMultipleChoice2(
                            originalOption: $appViewModel.formViewModel.formModel.requireIntermittentCatheter,
                            conditionalAnswer: "Yes",
                            CascadingQuestion:
                                ToggleQuestionProposal2(
                                    text: Text("Is this through your urethra? (yes, no)"),
                                    selectedOption: $appViewModel.formViewModel.formModel.throughYourUrethra
                                )
                        )

                        CascadingMultipleChoice2(
                            originalOption: $appViewModel.formViewModel.formModel.requireIntermittentCatheter,
                            conditionalAnswer: "Yes",
                            CascadingQuestion:
                                ToggleQuestionProposal2(
                                    text: Text("Is this through an abdominal stoma (mitrofanoff)? "),
                                    selectedOption: $appViewModel.formViewModel.formModel.throughAbdominalStoma
                                )
                        )

                        ToggleQuestionProposal2(
                            text: Text("Do you require an ileal conduit/urostomy and collection bag?"),
                            selectedOption: $appViewModel.formViewModel.formModel.requireIlealConduit)
                        
                        
                    }
                }
            }
        }
    }
}

struct TestBladderFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewBladderFormView()
    }
}
