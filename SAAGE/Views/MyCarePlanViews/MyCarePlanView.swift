//
//  MyCarePlanView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-01-26.
//

import SwiftUI

enum CarePlanViews: CaseIterable {
    case carePlanOptions, enterInfo, carePlanForm, sharing, delete
}

struct MyCarePlanView: View {
    @Binding var carePlanView: CarePlanViews
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        containedView()
    }
}

extension MyCarePlanView {
    func containedView() -> AnyView {
        switch carePlanView {
            case .carePlanOptions: return AnyView(CarePlanOptionsView(view: $carePlanView))
            case .enterInfo: return AnyView(EnterInfoView(view: $carePlanView))
            case .carePlanForm: return AnyView(FormView(view: $carePlanView))
            case .sharing: return AnyView(SharingView(view: $carePlanView))
            case .delete: return AnyView(DeleteView(view: $carePlanView))
        }
    }
}

struct MyCarePlanView_Previews: PreviewProvider {
    @State static var carePlanView: CarePlanViews = .carePlanOptions
    
    static var previews: some View {
        MyCarePlanView(carePlanView: $carePlanView)
    }
}
