//
//  MobilityFormView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-16.
//

import SwiftUI

struct MobilityFormView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Mobility/Assistive Devices")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Form {
                Section(header: Text("Mobility/Assistive Devices")) {
                    VStack(alignment: .leading, spacing: 20) {
                        Group {
                            ToggleQuestionProposal1(
                                text: Text("Do you use a powered wheelchair?"),
                                selectedOption: $appViewModel.formViewModel.formModel.usePoweredWheelchair)
                            
                            CascadingText1(
                                originalOption: $appViewModel.formViewModel.formModel.usePoweredWheelchair,
                                conditionalAnswer: "Yes",
                                CascadingQuestion:
                                    TextQuestion(
                                        text: Text("What is the make/model of your powered wheelchair:"),
                                        textField: $appViewModel.formViewModel.formModel.modelWheelChair
                                    )
                            )
                            
                            CascadingText1(
                                originalOption: $appViewModel.formViewModel.formModel.usePoweredWheelchair,
                                conditionalAnswer: "Yes",
                                CascadingQuestion:
                                    TextQuestion(
                                        text: Text("What is the make/model of your powered wheelchair charger:"),
                                        textField: $appViewModel.formViewModel.formModel.modelWheelchairCharger
                                    )
                            )
                        }
                        
                        Group {
                            ToggleQuestionProposal1(
                                text: Text("Do you use a manual wheelchair? "),
                                selectedOption: $appViewModel.formViewModel.formModel.useManualWheelchair)
                            
                            ToggleQuestionProposal1(
                                text: Text("Do you use an electric scooter?"),
                                
                                selectedOption: $appViewModel.formViewModel.formModel.useElectricScooter)
                            
                            CascadingText1(
                                originalOption: $appViewModel.formViewModel.formModel.useElectricScooter,
                                conditionalAnswer: "Yes",
                                CascadingQuestion:
                                    TextQuestion(
                                        text: Text("What is the make/model of your scooter:"),
                                        textField: $appViewModel.formViewModel.formModel.modelScooter
                                    )
                            )
                            
                            CascadingText1(
                                originalOption: $appViewModel.formViewModel.formModel.useElectricScooter,
                                conditionalAnswer: "Yes",
                                CascadingQuestion:
                                    TextQuestion(
                                        text: Text("What is the make/model of your scooter charger:"),
                                        textField: $appViewModel.formViewModel.formModel.modelScooterCharger
                                    )
                            )
                        }
                        
                        Group {
                            ToggleQuestionProposal1(
                                text: Text("Do you use a custom wheelchair seat? "),
                                selectedOption: $appViewModel.formViewModel.formModel.useCustomWheelchairSeat)
                            
                            ToggleQuestionProposal1(
                                text: Text("Do you use a cane? "),
                                selectedOption: $appViewModel.formViewModel.formModel.useCaneMobility)
                            
                            ToggleQuestionProposal1(
                                text: Text("Do you use crutches? "),
                                selectedOption: $appViewModel.formViewModel.formModel.useCrutches)
                            
                            ToggleQuestionProposal1(
                                text: Text("Do you use a walker? "),
                                selectedOption: $appViewModel.formViewModel.formModel.useWalkerMobility)
                        }
                        
                        Group {
                            ToggleQuestionProposal1(
                                text: Text("Do you use an assistive communication device?"),
                                selectedOption: $appViewModel.formViewModel.formModel.useAssistiveCommunication)
                            
                            CascadingText1(
                                originalOption: $appViewModel.formViewModel.formModel.useAssistiveCommunication,
                                conditionalAnswer: "Yes",
                                CascadingQuestion:
                                    TextQuestion(
                                        text: Text("Provide details here:"),
                                        textField: $appViewModel.formViewModel.formModel.assistiveCommunicationDetails,
                                        height: 100
                                    )
                            )
                        }
                        
                        Group {
                            ToggleQuestionProposal1(
                                text: Text("Do you use any other assistive equipment?"),
                                selectedOption: $appViewModel.formViewModel.formModel.useOtherAssistiveEquipment)
                            
                            CascadingText1(
                                originalOption: $appViewModel.formViewModel.formModel.useOtherAssistiveEquipment,
                                conditionalAnswer: "Yes",
                                CascadingQuestion:
                                    TextQuestion(
                                        text: Text("Provide details here:"),
                                        textField: $appViewModel.formViewModel.formModel.otherAssistiveEquipmentDetails,
                                        height: 100
                                    )
                            )
                        }
                    }
                }
            }
        }
    }
}

struct MobilityFormView_Previews: PreviewProvider {
    static var previews: some View {
        MobilityFormView()
    }
}
