//
//  Mailgun.swift
//  SAAGE
//
//  Created by X on 2/23/22.
//

import Foundation
import Alamofire

class Mailgun {
    let apiKey: String
    let apiURL: String = "https://api.mailgun.net/v3/sandboxa94ccb4d7b5349599a3540dda4d86d5c.mailgun.org/messages"
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func sendEmail(from: String, to: String, subject: String, text: String, pdfData: Data?, completionHandler: @escaping () -> ()) {
        let parameters = [
            "from": from,
            "to": to,
            "subject": subject,
            "text": text
        ] as [String : String]
        
        let headers = [
            "Content-Type" : "application/x-www-form-urlencoded"
        ]
        
        AF.upload(
            multipartFormData: { multipartFormData in
                for (key, value) in parameters {
                    multipartFormData.append(value.data(using: .utf8)!, withName: key)
                }
                multipartFormData.append(pdfData!, withName: "attachment", fileName: "form.pdf", mimeType: "application/pdf")
            },
            to: apiURL,
            headers: HTTPHeaders(headers)
        )
            .authenticate(username: "api", password: apiKey)
            .responseString { response in
                print("Response String: \(String(describing: response.response))")
                completionHandler()
            }
    }
}
