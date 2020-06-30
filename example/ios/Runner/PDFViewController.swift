//
//  PDFViewController.swift
//  Runner
//
//  Created by Tran Minh Nhut on 6/30/20.
//

import SwiftUI
import PDFKit

struct PDFKitRepresentedView: UIViewRepresentable {
    let url: URL

    init(_ url: URL) {
        print(url)
        self.url = url
    }

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        // Create a `PDFView` and set its `PDFDocument`.
        let pdfView = PDFView()
        if let pdfDocument = PDFDocument(url: self.url) {
            pdfView.autoresizesSubviews = true
            pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin]
            pdfView.displayDirection = .vertical

            pdfView.autoScales = true
            pdfView.displayMode = .singlePage
            pdfView.displaysPageBreaks = true
            pdfView.document = pdfDocument
        }
        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        // Update the view.
    }
}

struct PDFKitView: View {
    var url: URL

    var body: some View {
        PDFKitRepresentedView(url)
    }
}

struct PDFViewController: View {
    let documentUrl = URL(string: "http://www.africau.edu/images/default/sample.pdf")
    var body: some View {
        PDFKitView(url: documentUrl!)
    }
}

struct PDFViewController_Previews: PreviewProvider {
    static var previews: some View {
        PDFViewController()
    }
}

var PDFChildView = UIHostingController(rootView: PDFViewController())
