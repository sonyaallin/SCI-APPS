//
//  PDFView.swift
//  SAAGE
//
//  https://stackoverflow.com/a/65659435
//

import PDFKit
import SwiftUI

struct PDFKitRepresentedView: UIViewRepresentable {
    typealias UIViewType = PDFView

    let data: Data
    let singlePage: Bool

    init(_ data: Data, singlePage: Bool = false) {
        self.data = data
        self.singlePage = singlePage
    }

    func makeUIView(context _: UIViewRepresentableContext<PDFKitRepresentedView>) -> UIViewType {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(data: data)
        pdfView.autoScales = true
        if singlePage {
            pdfView.displayMode = .singlePage
        }
        return pdfView
    }

    func updateUIView(_ pdfView: UIViewType, context _: UIViewRepresentableContext<PDFKitRepresentedView>) {
        pdfView.document = PDFDocument(data: data)
    }
}

