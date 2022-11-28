//
//  SharingPlanView.swift
//  SAAGE
//
//  Created by X on 2/23/22.
//

import SwiftUI
import PDFKit
import TPPDF
import Foundation

enum PDFSections: CaseIterable {
    case basicInfo, emergencyContact, aboutMySci, AD, mobility, respiration, bowel, bladder
}

struct SharingPlanView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Binding var view: SharingViews
    @State private var shareAllSections: Bool = true
    @State private var chosenSections: Set = Set<PDFSections>()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Sharing My Plan")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("AppColor"))
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Your information will be used to create a PDF. Which sections do you want to share?")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Label("Share complete PDF (includes all sections)", systemImage: shareAllSections ? "circle.inset.filled" : "circle.circle")
                    .onTapGesture {
                        shareAllSections = true
                    }
                
                HStack {
                    Spacer()
                    
                    Text("OR")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                Label("Choose which section(s) to include:", systemImage: shareAllSections ? "circle.circle" : "circle.inset.filled")
                    .onTapGesture {
                        shareAllSections = false
                    }
                
                VStack(alignment: .leading) {
                    Label("Basic Information", systemImage: chosenSections.contains(.basicInfo) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .basicInfo)
                        }
                    Label("Emergency Contact", systemImage: chosenSections.contains(.emergencyContact) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .emergencyContact)
                        }
                    Label("Additional information", systemImage: chosenSections.contains(.aboutMySci) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .aboutMySci)
                        }
                    Label("Autonomic Dysreflexia", systemImage: chosenSections.contains(.AD) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .AD)
                        }
                    Label("Mobility/Assistive Devices", systemImage: chosenSections.contains(.mobility) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .mobility)
                        }
                    Label("Respiration", systemImage: chosenSections.contains(.respiration) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .respiration)
                        }
                    Label("Bowel", systemImage: chosenSections.contains(.bowel) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .bowel)
                        }
                    Label("Bladder", systemImage: chosenSections.contains(.bladder) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .bladder)
                        }
                    
                }.padding(.leading, 50)
                
                HStack {
                    Spacer()
                    Button("Create PDF", action: createPDF)
                        .buttonStyle(CustomButton(color: Color("AppColor")))
                    Spacer()
                }
            }
        }
    }
}

extension SharingPlanView {
    
    func createPDF() {
        print("Clicked create PDF")
        makePDF()
    }
    
    func toggleSection(section: PDFSections) {
        if chosenSections.contains(section) {
            chosenSections.remove(section)
        } else {
            chosenSections.insert(section)
        }
    }
    
    func addBasicInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding basic info")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let birthDayStr = dateFormatter.string(from: form.birthDay)
        
        document.add(.contentLeft, text: "Basic Information")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Name: %@ %@", form.firstName, form.lastName))
        document.add(text: String(format: "Email: %@", form.email))
        document.add(text: String(format: "Height: %@", form.height))
        document.add(text: String(format: "Weight: %@", form.weight))
        document.add(text: String(format: "Date of birth: %@", birthDayStr))
        document.add(text: String(format: "Blood Type: %@", form.bloodType ?? "A"))
        document.add(text: String(format: "Health Card Number: %@", form.healthCardNumber))
        document.add(text: String(format: "Medical Alert ID: %@", form.medicAlertID))
        document.add(text: String(format: "Blood Pressure: %@", form.bloodPressure))
        document.add(text: String(format: "Allergies: %@", form.allergies))
        document.add(text: String(format: "Street: %@", form.street))
        document.add(text: String(format: "Unit: %@", form.unit))
        document.add(text: String(format: "City: %@", form.city))
        document.add(text: String(format: "Province: %@", form.province ?? "ON"))
        document.add(text: String(format: "Country: %@", form.country ?? "Canada"))
        document.add(text: String(format: "Postal Code: %@", form.postalCode))
        document.add(text: "\n")
    }
    
    func addEmergencyContact(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding emergency contact")
        
        document.add(.contentLeft, text: "Emergency Contact")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Contact Name: %@", form.contactName))
        document.add(text: String(format: "Relationship to Contact: %@", form.contactRelationship))
        document.add(text: String(format: "Phone: %@", form.contactPhone))
        document.add(text: String(format: "Email: %@", form.contactEmail))
        document.add(text: "\n")
    }
    
    func addAdditionalPersonalInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding Information about Spinal Code Injury")
        
        let dateFormatter = DateFormatter()
        let dateInjuryStr = dateFormatter.string(from: form.dateInjury)
        
        document.add(.contentLeft, text: "Information about Spinal Code Injury")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Date of your spinal code injury: %@", dateInjuryStr))
        document.add(text: String(format: "Type of injury: %@", form.typeInjury ?? "Traumatic"))
        document.add(text: String(format: "Completeness of injury: %@", form.completenessInjury ?? "Complete"))
        document.add(text: String(format: "Level of injury: %@", form.levelInjury ?? "Light"))
        document.add(text: String(format: "Cause of injury: %@", form.causeInjury))
        document.add(text: String(format: "Require assitance managing bladder routine: %@", form.assistBowel ?? "Yes"))
        document.add(text: String(format: "Require assistance managing bladder routine: %@", form.assistBladder ?? "Yes"))
        document.add(text: String(format: "Require assistance tranferring to/from wheelchair: %@", form.assistWheelchair ?? "Yes"))
        document.add(text: String(format: "Require assistance turing: %@", form.assistTurning ?? "Yes"))
        document.add(text: String(format: "Require assistance eating: %@", form.assistEating ?? "Yes"))
        document.add(text: "\n")
    }
    
    func addADInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding AD info")
        
        document.add(.contentLeft, text: "Autonomic Dysreflexia (AD)")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Experiences AD: %@", form.experienceAD ?? ""))
        document.add(text: "Symptoms:")
        if form.symptomsAD.count == 0 {
            document.add(text: "N/A")
        } else {
            for symptom in form.symptomsAD {
                document.add(text: symptom)
            }
        }
        if form.otherAD != "" {
            document.add(text: String(format: "Other symptoms: %@", form.otherAD))
        }
        document.add(text: String(format: "More information: %@", form.freeTextAD))
        
        document.add(text: "\n")
    }
    
    func addMobility(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding Mobility info")
        
        document.add(.contentLeft, text: "Mobility and Assistive Devices")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Use powered wheelchair: %@", form.usePoweredWheelchair))
        if form.usePoweredWheelchair == "Yes" {
            document.add(text: String(format: "Model of powered wheelchair: %@", form.modelWheelChair))
            document.add(text: String(format: "Model of powered wheelchair charger: %@", form.modelWheelchairCharger))
        }
        document.add(text: String(format: "Use manual wheelchair: %@", form.useManualWheelchair))
        document.add(text: String(format: "Use electric scooter: %@", form.useElectricScooter))
        if form.useElectricScooter == "Yes" {
            document.add(text: String(format: "Model of electric scooter: %@", form.modelScooter))
            document.add(text: String(format: "Model of electric scooter charger: %@", form.modelScooterCharger))
        }
        document.add(text: String(format: "Use custom wheelchair seat: %@", form.useCustomWheelchairSeat))
        document.add(text: String(format: "Use cane: %@", form.useCaneMobility))
        document.add(text: String(format: "Use crutches: %@", form.useCrutches))
        document.add(text: String(format: "Use walker: %@", form.useWalkerMobility))
        document.add(text: String(format: "Use assistive communication device: %@", form.useAssistiveCommunication))
        if form.useAssistiveCommunication == "Yes" {
            document.add(text: String(format: "Details: %@", form.assistiveCommunicationDetails))
        }
        document.add(text: String(format: "Use other assistive equipment: %@", form.useOtherAssistiveEquipment))
        if form.otherAssistiveEquipmentDetails == "Yes" {
            document.add(text: String(format: "Details: %@", form.otherAssistiveEquipmentDetails))
        }
        
        document.add(text: "\n")
    }
    
    func addRespiration(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding respiration")
        
        document.add(.contentLeft, text: "Respiration")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Respiration compromised: %@", form.respirationCompromised))
        if form.respirationCompromised == "Yes" {
            document.add(text: String(format: "Due to infection: %@", form.dueToInfection))
        }
        document.add(text: String(format: "Require a ventilator: %@", form.requireVentilator))
        document.add(text: String(format: "Have pressure sores: %@", form.havePressureSores))
        if form.havePressureSores == "Yes" {
            document.add(text: String(format: "Where: %@", form.pressureSoresDetails))
            
        }
        document.add(text: String(format: "Frequency requiring turning: %@", form.turningRequirementFrequency))
        document.add(text: String(format: "Other sores: %@", form.soresOtherDetails))
        document.add(text: String(format: "Experienced skin breakdown: %@", form.experiencedSkinBreakdwon))
        if form.experiencedSkinBreakdwon == "Yes" {
            document.add(text: String(format: "Position: %@", form.breakdownPositions))
            document.add(text: String(format: "Dressing requirement: %@", form.dressingRequirements))
            document.add(text: String(format: "Turning schedule: %@", form.turningSchedule))
        }
        document.add(text: String(format: "Limit range of motion of neck: %@", form.limitRangeNeck))
        document.add(text: String(format: "Limit range of motion of shoulder: %@", form.limitRangeShoulders))
        document.add(text: String(format: "Limit range of motion of arms: %@", form.limitRangeArms))
        document.add(text: String(format: "Limit range of motion of back: %@", form.limitRangeBack))
        document.add(text: String(format: "Limit range of motion of legs: %@", form.limitRangeLegs))
        document.add(text: String(format: "Limit range of motion of other parts: %@", form.limitRangeOtherParts))
        if form.experiencedSkinBreakdwon == "Yes" && form.limitRangeOtherParts == "Yes" {
            document.add(text: String(format: "Details: %@", form.limitRangeOtherPartsExplain))
        }
        document.add(text: String(format: "Other skin management info: %@", form.otherSkinManagementInfo))
        
        
        document.add(text: String(format: "Require assistance from wheelchair to bed: %@", form.assistanceWheelchairBed))
        document.add(text: String(format: "Sliding board: %@", form.requireSlidingBoard))
        document.add(text: String(format: "Mechanical lift: %@", form.requireMechanicalLift))
        document.add(text: String(format: "Other transfer info: %@", form.otherTransferInfoRespiration))
        document.add(text: "\n")
    }
    func addBowelInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding bowel management info")

        document.add(.contentLeft, text: "Bowel Management")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        let dateFormatter = DateFormatter()
        let bowelManagementTime = dateFormatter.string(from: form.bowelManagementTime)

        document.add(text: String(format: "Frequency of bowel management: %@", form.bowelManagementFrequency ?? "More than once a day"))
        document.add(text: String(format: "Bowel management time: %@", bowelManagementTime))
        document.add(text: String(format: "Require supository: %@", form.requireSupository))
        document.add(text: String(format: "Require micro enema: %@", form.requireMicroEnema))
        document.add(text: String(format: "Had colostomy: %@", form.hadColostomy))
        document.add(text: String(format: "Require digital stimulation: %@", form.requireDigitalSimulation))
        document.add(text: String(format: "Require manual disimpaction: %@", form.requireManualDisimpaction))
        document.add(text: String(format: "Other assistance: %@", form.otherAssitanceRequest))
        document.add(text: String(format: "Any assistance required: %@", form.bowelRoutineAssistanceRequest))
        document.add(text: "\n")
    }

    func addBladderInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding bladder management info")

        document.add(.contentLeft, text: "Bladder Management")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")

        document.add(text: String(format: "Require an indwelling catheter: %@", form.requireIndwellingCatheter))
        document.add(text: String(format: "Require a condom catheter: %@", form.requireCondomCatheter))
        document.add(text: String(format: "Require a suprapubic catheter: %@", form.requireSuprapublicCatheter))
        document.add(text: String(format: "Require an intermittent catheter: %@", form.requireIntermittentCatheter))
        if form.requireIntermittentCatheter == "Yes" {
            document.add(text: String(format: "Through your urethra: %@", form.throughYourUrethra))
            document.add(text: String(format: "Through an abdominal stoma: %@", form.throughAbdominalStoma))
        }
        document.add(text: String(format: "Require an ileal conduit/urostomy and collection bag: %@", form.requireIlealConduit))
    }
    
    func makePDF() {
        print("Called makePDF()")
        
        let form = appViewModel.formViewModel.formModel
        
        let document = PDFDocument(format: .a4)
        document.set(font: .boldSystemFont(ofSize: 25))
        document.add(image: PDFImage(image: Image(imageLiteralResourceName: "Logo")))
        document.set(font: .systemFont(ofSize: 16))
        document.add(text: "\n")
        
//        addBasicInfo(document, form)
        
        if shareAllSections {
            addBasicInfo(document, form)
            addEmergencyContact(document, form)
            addAdditionalPersonalInfo(document, form)
            addADInfo(document, form)
            addMobility(document, form)
            addRespiration(document, form)
            addBowelInfo(document, form)
            addBladderInfo(document, form)
        } else {
            if chosenSections.contains(.basicInfo) { addBasicInfo(document, form) }
            if chosenSections.contains(.emergencyContact) { addEmergencyContact(document, form) }
            if chosenSections.contains(.aboutMySci) { addAdditionalPersonalInfo(document, form)}
            if chosenSections.contains(.AD) { addADInfo(document, form)}
            if chosenSections.contains(.mobility) { addMobility(document, form)}
            if chosenSections.contains(.respiration) { addRespiration(document, form)}
            if chosenSections.contains(.bowel) { addBowelInfo(document, form)}
            if chosenSections.contains(.bladder) { addBladderInfo(document, form)}
        }
        
        let generator = PDFGenerator(document: document)
        do {
            let data = try generator.generateData()
            appViewModel.formViewModel.pdfData = data
            print("Generated pdf data")
        } catch {
            print("Error generating pdf data")
        }
        
        print("Saved pdfData to formViewModel")
        view = .previewPDF
    }
}

struct SharingPlanView_Previews: PreviewProvider {
    @State static var view: SharingViews = .sharingPlan
    
    static var previews: some View {
        SharingPlanView(view: $view)
    }
}
