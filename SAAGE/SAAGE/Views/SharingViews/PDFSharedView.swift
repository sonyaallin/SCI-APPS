//
//  PDFSharedView.swift
//  SAAGE
//
//  Created by X on 2/23/22.
//

import SwiftUI

struct PDFSharedView: View {
    @Binding var view: SharingViews
    @State var shareMethod: SharingOptions
    @State var emailSentTo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("PDF shared!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("AppColor"))
            
            if (shareMethod == .url) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Your link and password has been copied to your clipboard")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            else if (shareMethod == .emailTo || shareMethod == .emailSelf) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Your PDF was successfully shared by email with")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Link(destination: URL(string: "mailto:\(emailSentTo)")!, label: {
                        Text(emailSentTo)
                            .underline()
                    })
                        .tint(Color("AppColor"))
                }
            }
            
            HStack {
                Spacer()
                Button("Share Again", action: shareAgain)
                    .buttonStyle(CustomButton(color: Color("AppColor")))
                Spacer()
            }
        }
    }
}

extension PDFSharedView {
    func shareAgain() {
        print("Clicked share again")
        view = .sharingPlan
    }
}

struct PDFSharedView_Previews: PreviewProvider {
    @State static var view: SharingViews = .createdPDF
    @State static var shareMethod: SharingOptions = .emailSelf
    
    static var previews: some View {
        PDFSharedView(view: $view, shareMethod: shareMethod, emailSentTo: "test@email.com")
    }
}
