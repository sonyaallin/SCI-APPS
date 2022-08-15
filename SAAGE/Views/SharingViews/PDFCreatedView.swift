//
//  PDFCreatedView.swift
//  SAAGE
//
//  Created by X on 2/23/22.
//

import SwiftUI
import FirebaseStorage
import FirebaseStorageSwift
import Alamofire
import PDFKit
import Foundation

struct PDFCreatedView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Binding var view: SharingViews
    @Binding var shareMethod: SharingOptions
    @Binding var emailSentTo: String

    @State private var emailToSendTo: String = ""
    
    let mailgun = Mailgun(apiKey: MAILGUN_API_KEY)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("PDF created!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("AppColor"))
            
            VStack(alignment: .leading, spacing: 20) {
                Text("How would you like to share you care plan?")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Label("Email to me (to the email address I use to login)", systemImage: shareMethod == .emailSelf ? "circle.inset.filled" : "circle.circle")
                    .onTapGesture {
                        shareMethod = .emailSelf
                    }
                
                VStack(alignment: .leading, spacing: 5) {
                    Label("Email to a health care provider/member of my care team (note PDF will be encrypted)", systemImage:
                            shareMethod == .emailTo ? "circle.inset.filled" : "circle.circle")
                        .fixedSize(horizontal: false, vertical: true)
                        .onTapGesture {
                            shareMethod = .emailTo
                        }
                    TextField("doctor@clinic.ca", text: $emailToSendTo)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .padding(5)
                        .border(.primary)
                        .padding(.horizontal)
                }
                
                Label("Create a short URL (this will allow anyone with the URL to download an encrypted PDF)", systemImage:
                        shareMethod == .url ? "circle.inset.filled" : "circle.circle")
                    .onTapGesture {
                        shareMethod = .url
                    }
                
                HStack {
                    Spacer()
                    Button("Share PDF", action: sharePDF)
                        .buttonStyle(CustomButton(color: Color("AppColor")))
                    Spacer()
                }
            }
        }
    }
}

extension PDFCreatedView {
    func sharePDF() {
        print("Clicked share PDF")
        switch (shareMethod) {
            case .emailSelf:
                emailTo(email: appViewModel.user!.email!)
            case .emailTo:
                emailTo(email: emailToSendTo)
            case .url:
                shareUrl()
        }
    }
    
    func emailTo(email: String) {
        print("Emailing to", email)
        mailgun.sendEmail(
            from: "uoft.sage@gmail.com",
            to: email,
            subject: "SAAGE - Shared PDF",
            text: "SAAGE PDF has been shared with you by " +  appViewModel.formViewModel.formModel.firstName,
            pdfData: appViewModel.formViewModel.pdfData,
            completionHandler: {
                print("Done sending email")
            }
        )
        emailSentTo = email
        view = .pdfShared
    }
    
    func shareUrl() {
        view = .loadingView
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let randId = "--" + UUID().uuidString
        let downloadURLString = "pdfs/" + (appViewModel.user?.uid)! + "/" + randId + ".pdf"
        let pdfRef = storageRef.child(downloadURLString)
        let pdfURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("saage-1.pdf")
        let password = "\(generateRandomNumber())"
        let pdfDocument = PDFDocument(data: (appViewModel.formViewModel.pdfData)!)
        pdfDocument?.write(to: pdfURL, withOptions: [PDFDocumentWriteOption.userPasswordOption : password,
                                                                     PDFDocumentWriteOption.ownerPasswordOption : password])
        
        _ = pdfRef.putFile(from:pdfURL, metadata: nil) { (metadata, error) in
            pdfRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    print("Error")
                    return
                }
                let encodedURL = downloadURL.absoluteString.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
                let reqURL = "https://cutt.ly/api/api.php?key=f4b546ed0a96ff5a55883e926ec8ef684c1d6&short=" + "\(encodedURL)"
                let req = AF.request(reqURL, method: .get)
                req.responseDecodable(of: UrlShortResponseModel.self) { response in
                    guard let urlVal = response.value else {
                        print("ERROR")
                        return
                    }
                    UIPasteboard.general.string = urlVal.url.shortLink + "\n(Password: " + password + ")"
                    view = .pdfShared
                }
            }
        }
    }
    
    func generateRandomNumber() -> Int {
        var password : Decimal = 0
        for _ in 0...5 {
            password = password * 10 + Decimal(Int.random(in: 0...9))
        }
        return NSDecimalNumber(decimal: password).intValue
    }

}

struct PDFCreatedView_Previews: PreviewProvider {
    @State static var view: SharingViews = .createdPDF
    @State static var shareMethod: SharingOptions = .emailSelf
    @State static var emailSentTo = "test@email.com"
    
    static var previews: some View {
        PDFCreatedView(view: $view, shareMethod: $shareMethod, emailSentTo: $emailSentTo)
    }
}
