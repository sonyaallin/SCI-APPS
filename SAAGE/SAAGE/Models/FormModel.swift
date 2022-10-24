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
    
    // Spinal Cord Injury
    var knowDateOfSpinalCordInjury: String?
    var causeOfSpinalCordInjury: String?
    var levelOfSpinalCordInjury: String?
    
    // Autonomic Dysreflexia (AD)
    var experienceAD: String?
    var symptomsAD = [String]()
    
    // Bladder Management
    var injuryAffectUrinaryFunction: String?
    var bladderManagementRoutine = [String]()
    
    // Bowel Management
    var injuryAffectBowelFunction: String?
    var bowelRoutineSchedule: String?
    var bowelRoutineTime: String?
    
    
    // New Bowel Management
    var bowelManagementFrequency: String?
    var bowelManagementTime: String?
    var requireSupository: String?
    var requireMicroEnema: String?
    var hadColostomy: String?
    var requireDigitalSimulation: String?
    var requireManualDisimpaction: String?
    var otherAssitanceRequest: String = ""
    var bowelRoutineAssistanceRequest: String = ""

    // New Bladder Management
    var requireIndwellingCatheter: String?
    var requireCondomCatheter: String?
    var requireSuprapublicCatheter: String?
    var requireIntermittentCatheter: String?
    var requireIlealConduit: String?

    // Cascading Questions for requireIntermittentCatheter
    var throughYourUrethra: String = ""
    var throughAbdominalStoma: String?
    
    // Skin Care/Pressure Relief
    var hasPressureSores: String?
    var requireTurningAssistance: String?
    var hasAreasAvoidPressure: String?
    
    // Transfers
    var transferAssistanceInfo: String?
    var otherTransferInfo: String = ""
    
    // Respiration
    var respirationNeeds: String?
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
