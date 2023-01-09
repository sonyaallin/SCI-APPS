//
//  FormModel.swift
//  SAAGE
//
//  Created by X on 2/6/22.
//

import Foundation

// We're trying to target 1980/1/1 as the default date of birth
let targetYearGap = 1980 - Calendar.current.component(.year, from: Date())
let targetMonthGap = 1 - Calendar.current.component(.month, from: Date())
let targetDayGap = 1 - Calendar.current.component(.day, from: Date())

struct FormModel: Codable {
    // Basic Info
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var typicalBloodPressure: String = ""
    var height: String = ""
    var weight: String = ""
    var dateOfBirth: String = ""
    var birthDay: Date = Calendar.current.date(byAdding: DateComponents(year: targetYearGap, month: targetMonthGap, day: targetDayGap), to: Date()) ?? Date()
    
    // Additional basic info
    var bloodType: String = "A"
    var healthCardNumber: String = ""
    var medicAlertID: String = "" // TODO: make it a text area
    var bloodPressure: String = ""
    var allergies: String = ""
    
    var street: String = ""
    var unit: String = ""
    var city: String = ""
    var province: String = "ON"
    var country: String = "Canada"
    var postalCode: String = ""
    
    // Emergency contact
    var contactName: String = ""
    var contactRelationship: String = ""
    var contactPhone: String = ""
    var contactEmail: String = ""
    
    // Information about injury
    var dateInjury = Date()
    var typeInjury: String = "Traumatic"
    var completenessInjury: String = "Complete"
    var levelInjury: String = "Light"
    var causeInjury: String = ""
    
    // Additional information about injury and assistance
    var assistBowel: String = "Yes"
    var assistBladder: String = "Yes"
    var assistWheelchair: String = "Yes"
    var assistTurning: String = "Yes"
    var assistEating: String = "Yes"
    
    // Autonomic Dysreflexia (AD)
    var experienceAD: String = "Yes"
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
    
    // New Bowel Management
    var bowelManagementFrequency: String = "More than once a day"
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
    
    // Autonomic Dysreflexia (AD)
    experienceAD: "Yes",
    symptomsAD: ["x"]
    
)
#endif
