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
    case basicInfo, aboutMySci, bladder, bowel, AD, skin, transfers, respiration
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
                    Label("About my SCI", systemImage: chosenSections.contains(.aboutMySci) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .aboutMySci)
                        }
                    Label("Bladder", systemImage: chosenSections.contains(.bladder) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .bladder)
                        }
                    Label("Bowel", systemImage: chosenSections.contains(.bowel) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .bowel)
                        }
                    Label("Autonomic Dysreflexia", systemImage: chosenSections.contains(.AD) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .AD)
                        }
                    Label("Skin", systemImage: chosenSections.contains(.skin) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .skin)
                        }
                    Label("Transfers", systemImage: chosenSections.contains(.transfers) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .transfers)
                        }
                    Label("Respiration", systemImage: chosenSections.contains(.respiration) ? "checkmark.square" : "square")
                        .onTapGesture {
                            toggleSection(section: .respiration)
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
        
        document.add(.contentLeft, text: "Basic Information")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Name: %@ %@", form.firstName, form.lastName))
        document.add(text: String(format: "Email: %@", form.email))
        document.add(text: String(format: "Typical blood pressure: %@", form.typicalBloodPressure))
        document.add(text: String(format: "Height: %@", form.height))
        document.add(text: String(format: "Weight: %@", form.weight))
        document.add(text: String(format: "Date of birth: %@", form.dateOfBirth))
        document.add(text: "\n")
    }
    
    func addSpinalCordInjury(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding spinal cord injury info")
        
        document.add(.contentLeft, text: "My Spinal Cord Injury")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Knows date of spinal cord injury: %@", form.knowDateOfSpinalCordInjury ?? ""))
        document.add(text: String(format: "Cause of spinal cord injury: %@", form.causeOfSpinalCordInjury ?? ""))
        document.add(text: String(format: "Level of spinal cord injury: %@", form.levelOfSpinalCordInjury ?? ""))
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
        document.add(text: "\n")
    }
    
    func addBladderInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding bladder management info")
        
        document.add(.contentLeft, text: "Bladder Management")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Injury affects urinary function: %@", form.injuryAffectUrinaryFunction ?? ""))
        document.add(text: "Bladder Management Routine:")
        if form.symptomsAD.count == 0 {
            document.add(text: "N/A")
        } else {
            for routine in form.bladderManagementRoutine {
                document.add(text: routine)
            }
        }
        document.add(text: "\n")
    }
    
    func addBowelInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding bowel management info")
        
        document.add(.contentLeft, text: "Bowel Management")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Injury affects bowel function: %@", form.injuryAffectBowelFunction ?? ""))
        document.add(text: String(format: "Bowel routine schedule: %@", form.bowelRoutineSchedule ?? ""))
        document.add(text: String(format: "Bowel routine time of day: %@", form.bowelRoutineTime ?? ""))
        document.add(text: "\n")
    }
    
    func addSkinCareInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding skin care info")
        
        document.add(.contentLeft, text: "Skin Care/Pressure Relief")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Has pressure sores: %@", form.hasPressureSores ?? ""))
        document.add(text: String(format: "Requires turning assistance: %@", form.requireTurningAssistance ?? ""))
        document.add(text: String(format: "Has areas prone to skin breakdown/needs to avoid pressure: %@", form.hasAreasAvoidPressure ?? ""))
        document.add(text: "\n")
    }
    
    func addTransferInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding transfer info")
        
        document.add(.contentLeft, text: "Transfers")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Transfer assistance info: %@", form.transferAssistanceInfo ?? ""))
        document.add(text: String(format: "Other info: %@", form.otherTransferInfo ))
        document.add(text: "\n")
    }
    
    func addRespirationInfo(_ document: TPPDF.PDFDocument, _ form: FormModel) {
        print("Adding respiration info")
        
        document.add(.contentLeft, text: "Respiration")
        document.addLineSeparator(PDFContainer.contentLeft, style: .init(type: .full, color: .darkGray, width: 0.5))
        document.add(text: "\n")
        
        document.add(text: String(format: "Respiration needs: %@", form.respirationNeeds ?? ""))
        document.add(text: "\n")
    }
    
    func makePDF() {
        print("Called makePDF()")
        
        let form = appViewModel.formViewModel.formModel
        
        let document = PDFDocument(format: .a4)
        document.set(font: .boldSystemFont(ofSize: 25))
        document.add(image: PDFImage(image: Image(imageLiteralResourceName: "Logo")))
        document.set(font: .systemFont(ofSize: 16))
        document.add(text: "\n")
        
        addBasicInfo(document, form)
        
        if shareAllSections {
            addSpinalCordInjury(document, form)
            addADInfo(document, form)
            addBladderInfo(document, form)
            addBowelInfo(document, form)
            addSkinCareInfo(document, form)
            addTransferInfo(document, form)
            addRespirationInfo(document, form)
        } else {
            if chosenSections.contains(.aboutMySci) { addSpinalCordInjury(document, form)}
            if chosenSections.contains(.AD) { addADInfo(document, form)}
            if chosenSections.contains(.bladder) { addBladderInfo(document, form)}
            if chosenSections.contains(.bowel) { addBowelInfo(document, form)}
            if chosenSections.contains(.skin) { addSkinCareInfo(document, form)}
            if chosenSections.contains(.transfers) { addTransferInfo(document, form)}
            if chosenSections.contains(.respiration) { addRespirationInfo(document, form)}
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
