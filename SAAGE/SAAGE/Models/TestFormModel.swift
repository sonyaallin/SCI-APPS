//
//  TestFormModel.swift
//  SAAGE
//
//  Created by Tairi Goto on 2022/10/14.
//

import Foundation

struct TestFormModel: Codable {
    // Basic Info
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var typicalBloodPressure: String = ""
    var height: String = ""
    var weight: String = ""
    var dateOfBirth: String = ""
    
    // Bowel Management
    var bowelManagementFrequency: String?
    var bowelManagementTime: String?
    var requireSupository: String?
    var requireMicroEnema: String?
    var hadColostomy: String?
    var requireDigitalSimulation: String?
    var requireManualDisimpaction: String?
    var otherAssitanceRequest: String = ""
    var bowelRoutineAssistanceRequest: String = ""
    
    // Bladder Management
    var requireIndwellingCatheter: String?
    var requireCondomCatheter: String?
    var requireSuprapublicCatheter: String?
    var requireIntermittentCatheter: String?
    var requireIlealConduit: String?
    
    // Cascading Questions for requireIntermittentCatheter
    var throughYourUrethra: String = ""
    var throughAbdominalStoma: String?
    
}
