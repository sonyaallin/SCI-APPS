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
            Text("Respiration Form")
                .font(.subheadline)
                .fontWeight(.bold)
            Form{
                Section(header: Text("Respiration Details")) {
                    VStack(alignment: .leading, spacing: 20) {
                        Group {
                            ToggleQuestionProposal1(
                                text: Text("Is your respiration compromised?"),

                                selectedOption: $appViewModel.formViewModel.formModel.respirationCompromised)

                            CascadingMultipleChoice1(
                                originalOption: $appViewModel.formViewModel.formModel.respirationCompromised,
                                conditionalAnswer: "Yes",
                                CascadingQuestion:
                                    ToggleQuestionProposal1(
                                        text: Text("If yes, is it compromised due to an infection? "),
                                        selectedOption: $appViewModel.formViewModel.formModel.dueToInfection
                                    )
                            )

                            ToggleQuestionProposal1(
                                text: Text("Do you require a ventilator?"),
                                selectedOption: $appViewModel.formViewModel.formModel.requireVentilator)
                        }

                        Group {
                            ToggleQuestionProposal1(
                                text: Text("Do you currently have any pressure sores?"),
                                selectedOption: $appViewModel.formViewModel.formModel.havePressureSores)

                            CascadingText1(
                                originalOption: $appViewModel.formViewModel.formModel.havePressureSores,
                                conditionalAnswer: "Yes",
                                CascadingQuestion:
                                    TextQuestion(
                                        text: Text("If yes, where?"),
                                        textField: $appViewModel.formViewModel.formModel.pressureSoresDetails
                                    )
                            )

                            TextQuestion(
                                text: Text("How often do you require turning?"),
                                textField: $appViewModel.formViewModel.formModel.turningRequirementFrequency
                            )

                            TextQuestion(
                                text: Text("Other details of current sore(s):"),
                                textField: $appViewModel.formViewModel.formModel.soresOtherDetails
                            )
                        }

                        Group {
                            ToggleQuestionProposal1(
                                text: Text("Have you experienced skin breakdown?"),
                                selectedOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon)

                            // Assume this was a cascading question. Following questions follow based on the answer above.
                            Group {
                                CascadingText1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        TextQuestion(
                                            text: Text("Postions that lead to breakdown:"),
                                            textField: $appViewModel.formViewModel.formModel.breakdownPositions
                                        )
                                )

                                CascadingText1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        TextQuestion(
                                            text: Text("Dressing required to prevent breakdown:"),
                                            textField: $appViewModel.formViewModel.formModel.dressingRequirements
                                        )
                                )

                                CascadingText1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        TextQuestion(
                                            text: Text("Turning schedule required to prevent breakdown:"),
                                            textField: $appViewModel.formViewModel.formModel.turningSchedule
                                        )
                                )
                            }
                            Group {
                                CascadingMultipleChoice1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        ToggleQuestionProposal1(
                                            text: Text("Does skin breakdown limit range of motion of your neck, specifically? "),
                                            selectedOption: $appViewModel.formViewModel.formModel.limitRangeNeck
                                        )
                                )

                                CascadingMultipleChoice1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        ToggleQuestionProposal1(
                                            text: Text("Does skin breakdown limit range of motion of your shoulders, specifically?"),
                                            selectedOption: $appViewModel.formViewModel.formModel.limitRangeShoulders
                                        )
                                )

                                CascadingMultipleChoice1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        ToggleQuestionProposal1(
                                            text: Text("Does skin breakdown limit range of motion of your arms, specifically? "),
                                            selectedOption: $appViewModel.formViewModel.formModel.limitRangeArms
                                        )
                                )

                                CascadingMultipleChoice1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        ToggleQuestionProposal1(
                                            text: Text("Does skin breakdown limit range of motion of your back, specifically?"),
                                            selectedOption: $appViewModel.formViewModel.formModel.limitRangeBack
                                        )
                                )

                                CascadingMultipleChoice1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        ToggleQuestionProposal1(
                                            text: Text("Does skin breakdown limit range of motion of your legs, specifically? "),
                                            selectedOption: $appViewModel.formViewModel.formModel.limitRangeLegs
                                        )
                                )

                                CascadingMultipleChoice1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        ToggleQuestionProposal1(
                                            text: Text("Does skin breakdown limit your range of motion of other parts of your body?   "),
                                            selectedOption: $appViewModel.formViewModel.formModel.limitRangeOtherParts
                                        )
                                )

                                CascadingText1(
                                    originalOption: $appViewModel.formViewModel.formModel.limitRangeOtherParts,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        TextQuestion(
                                            text: Text("If yes, where:"),
                                            textField: $appViewModel.formViewModel.formModel.limitRangeOtherPartsExplain
                                        )
                                )

                                CascadingText1(
                                    originalOption: $appViewModel.formViewModel.formModel.experiencedSkinBreakdwon,
                                    conditionalAnswer: "Yes",
                                    CascadingQuestion:
                                        TextQuestion(
                                            text: Text("Other skin management information, if any:"),
                                            textField: $appViewModel.formViewModel.formModel.otherSkinManagementInfo
                                        )
                                )
                            }

                            Group {
                                ToggleQuestionProposal1(
                                    text: Text("Do you require assistance when transferring to and from a wheelchair or bed? "),
                                    selectedOption: $appViewModel.formViewModel.formModel.assistanceWheelchairBed
                                )

                                ToggleQuestionProposal1(
                                    text: Text("Do you require a sliding board? "),
                                    selectedOption: $appViewModel.formViewModel.formModel.requireSlidingBoard
                                )

                                ToggleQuestionProposal1(
                                    text: Text("Do you require a mechanical lift? "),
                                    selectedOption: $appViewModel.formViewModel.formModel.requireMechanicalLift
                                )

                                TextQuestion(
                                    text: Text("Other transfer information, if any:"),
                                    textField: $appViewModel.formViewModel.formModel.otherTransferInfoRespiration,
                                    height: 100
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}
