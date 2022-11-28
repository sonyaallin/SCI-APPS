//
//  FormModel.swift
//  SAAGE
//
//  Created by X on 2/6/22.
//

import Foundation

struct FormModel: Codable {
    // Basic Info
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var typicalBloodPressure: String = ""
    var height: String = ""
    var weight: String = ""
    var dateOfBirth: String = ""
    var birthDay: Date = Calendar.current.date(byAdding: DateComponents(year: -40), to: Date()) ?? Date()
    
    // Additional basic info
    var bloodType: String?
    var healthCardNumber: String = ""
    var medicAlertID: String = "" // TODO: make it a text area
    var bloodPressure: String = ""
    var allergies: String = ""
    
    var street: String = ""
    var unit: String = ""
    var city: String = ""
    var province: String?
    var country: String?
    var postalCode: String = ""
    
    // Emergency contact
    var contactName: String = ""
    var contactRelationship: String = ""
    var contactPhone: String = ""
    var contactEmail: String = ""
    
    // Information about injury
    var dateInjury = Date()
    var typeInjury: String?
    var completenessInjury: String?
    var levelInjury: String?
    var causeInjury: String = ""
    
    // Additional information about injury and assistance
    var assistBowel: String?
    var assistBladder: String?
    var assistWheelchair: String?
    var assistTurning: String?
    var assistEating: String?
    
    // Spinal Cord Injury
    var knowDateOfSpinalCordInjury: String?
    var causeOfSpinalCordInjury: String?
    var levelOfSpinalCordInjury: String?
    
    // Autonomic Dysreflexia (AD)
    var experienceAD: String?
    var symptomsAD = [String]()
    var otherAD: String = ""
    var freeTextAD: String = ""
    
    // Mobility/Assistive Devices Form
    var usePoweredWheelchair: String = "No"
    var modelWheelChair: String = ""
    var modelWheelchairCharger: String = ""
    var useManualWheelchair: String = "No"
    var useElectricScooter: String = "No"
    var modelScooter: String = ""
    var modelScooterCharger: String = ""
    var useCustomWheelchairSeat: String = "No"
    var useCaneMobility: String = "No"
    var useCrutches: String = "No"
    var useWalkerMobility: String = "No"
    var useAssistiveCommunication: String = "No"
    var assistiveCommunicationDetails: String = ""
    var useOtherAssistiveEquipment: String = "No"
    var otherAssistiveEquipmentDetails: String = ""
    
    // Bladder Management
    var injuryAffectUrinaryFunction: String?
    var bladderManagementRoutine = [String]()
    
    // Bowel Management
    var injuryAffectBowelFunction: String?
    var bowelRoutineSchedule: String?
    var bowelRoutineTime: String?
    
    // New Bowel Management
    var bowelManagementFrequency: String?
    var bowelManagementTime = Date()
    var requireSupository: String = "No"
    var requireMicroEnema: String = "No"
    var hadColostomy: String = "No"
    var requireDigitalSimulation: String = "No"
    var requireManualDisimpaction: String = "No"
    var otherAssitanceRequest: String = ""
    var bowelRoutineAssistanceRequest: String = ""

    // New Bladder Management
    var requireIndwellingCatheter: String = "No"
    var requireCondomCatheter: String = "No"
    var requireSuprapublicCatheter: String = "No"
    var requireIntermittentCatheter: String = "No"
    var requireIlealConduit: String = "No"
    var throughYourUrethra: String = "No"
    var throughAbdominalStoma: String = "No"
    
    // Skin Care/Pressure Relief
    var hasPressureSores: String?
    var requireTurningAssistance: String?
    var hasAreasAvoidPressure: String?
    
    // Transfers
    var transferAssistanceInfo: String?
    var otherTransferInfo: String = ""
    
    // Respiration
    var respirationNeeds: String?
    
    // New Respiration
    var respirationCompromised: String = "No"
    var dueToInfection: String = "No"
    var requireVentilator: String = "No"
//    Compromised assist cough (what does this mean)?
//    Compromised assist physio (what does this mean)?
    var havePressureSores: String = "No"
    var pressureSoresDetails: String = ""
    var turningRequirementFrequency: String = ""
    var soresOtherDetails: String = ""
    
    var experiencedSkinBreakdwon = "No"
    var breakdownPositions: String = ""
    var dressingRequirements: String = ""
    var turningSchedule: String = ""
    
    var limitRangeNeck: String = "No"
    var limitRangeShoulders: String = "No"
    var limitRangeArms: String = "No"
    var limitRangeBack: String = "No"
    var limitRangeLegs: String = "No"
    var limitRangeOtherParts: String = "No"
    var limitRangeOtherPartsExplain: String = ""
    var otherSkinManagementInfo: String = ""
    
    var assistanceWheelchairBed: String = "No"
    var requireSlidingBoard: String = "No"
    var requireMechanicalLift: String = "No"
//    Assistance independent no assist (what does this mean?)
//    Assistance limited assist (what does this mean?)
    var otherTransferInfoRespiration: String = ""
}

#if DEBUG
let testFormData = FormModel(
    // Basic Info
    firstName: "John",
    lastName: "Doe",
    email: "john.doe@gmail.com",
    typicalBloodPressure: "90",
    height: "6'0",
    weight: "150lbs",
    dateOfBirth: "01/01/1990",
    
    // Spinal Cord Injury
    knowDateOfSpinalCordInjury: "Yes",
    causeOfSpinalCordInjury: "x",
    levelOfSpinalCordInjury: "1",
    
    // Autonomic Dysreflexia (AD)
    experienceAD: "Yes",
    symptomsAD: ["x"],
    
    // Bladder Management
    injuryAffectUrinaryFunction: "x",
    bladderManagementRoutine: ["x"],
    
    // Bowel Management
    injuryAffectBowelFunction: "x",
    bowelRoutineSchedule: "x",
    bowelRoutineTime: "x",
    
    // Skin Care/Pressure Relief
    hasPressureSores: "x",
    requireTurningAssistance: "Yes",
    hasAreasAvoidPressure: "No",
    
    // Transfers
    transferAssistanceInfo: "x",
    otherTransferInfo: "x"
)
#endif
