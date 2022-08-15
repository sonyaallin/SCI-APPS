//
//  SharingView.swift
//  SAAGE
//
//  Created by X on 2/23/22.
//

import SwiftUI

enum SharingViews: CaseIterable {
    case sharingPlan, previewPDF, createdPDF, pdfShared, loadingView
}

enum SharingOptions: CaseIterable {
    case emailSelf, emailTo, url
}

struct SharingView: View {
    @Binding var view: CarePlanViews
    @State private var sharingView: SharingViews = .sharingPlan
    @State var shareMethod: SharingOptions = .emailSelf
    @State var emailSentTo: String = ""
    
    var body: some View {
        containedView()
    }
}

extension SharingView {
    func containedView() -> AnyView {
        switch sharingView {
            case .sharingPlan: return AnyView(SharingPlanView(view: $sharingView))
            case .previewPDF: return AnyView(PDFPreviewView(view: $sharingView))
            case .createdPDF: return AnyView(PDFCreatedView(view: $sharingView, shareMethod: $shareMethod, emailSentTo: $emailSentTo))
            case .pdfShared: return AnyView(PDFSharedView(view: $sharingView, shareMethod: shareMethod, emailSentTo: emailSentTo))
            case .loadingView: return AnyView(ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .black)))
        }
    }
}

struct SharingView_Previews: PreviewProvider {
    @State static var view: CarePlanViews = .carePlanOptions
    
    static var previews: some View {
        SharingView(view: $view)
    }
}
