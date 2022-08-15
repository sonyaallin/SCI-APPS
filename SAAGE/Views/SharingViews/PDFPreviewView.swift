//
//  PDFPreviewView.swift
//  SAAGE
//
//  Created by X on 3/10/22.
//

import SwiftUI

struct PDFPreviewView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Binding var view: SharingViews
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("PDF Preview")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("AppColor"))
            
            PDFKitRepresentedView(appViewModel.formViewModel.pdfData!, singlePage: false)
            
            HStack {
                Button("Back", action: back)
                    .buttonStyle(CustomButton(color: Color("AppColor")))
                Spacer()
                Button("Continue", action: continueSharing)
                    .buttonStyle(CustomButton(color: Color("AppColor")))
                Spacer()
            }
        }
    }
}

extension PDFPreviewView {
    func continueSharing() {
        print("Clicked continue button")
        view = .createdPDF
    }
    
    func back() {
        print("Clicked back button")
        view = .sharingPlan
    }
}

struct PDFPreviewView_Previews: PreviewProvider {
    @State static var view: SharingViews = .sharingPlan
    
    static var previews: some View {
        PDFPreviewView(view: $view)
    }
}
