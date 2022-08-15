//
//  DeleteView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-05.
//

import SwiftUI

enum DeleteViews: CaseIterable {
    case deleteOptions, deleteConfirmation, planDeleted
}

struct DeleteView: View {
    @Binding var view: CarePlanViews
    @State private var deleteView: DeleteViews = .deleteOptions
    @State private var deleteType: String = ""
    
    var body: some View {
        containedView()
    }
}

extension DeleteView {
    func containedView() -> AnyView {
        switch deleteView {
            case .deleteOptions: return AnyView(
                DeleteOptionsView(view: $deleteView, deleteType: $deleteType)
            )
            case .deleteConfirmation: return AnyView(
                DeleteConfirmationView(view: $deleteView, deleteType: deleteType)
            )
            case .planDeleted: return AnyView(
                DeletedView(view: $view)
            )
        }
    }
}

struct DeleteView_Previes: PreviewProvider {
    @State static var view: CarePlanViews = .delete
    
    static var previews: some View {
        DeleteView(view: $view)
    }
}
