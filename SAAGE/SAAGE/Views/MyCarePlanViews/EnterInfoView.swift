//
//  EnterInfoView.swift
//  SAAGE
//
//  Created by X on 2/6/22.
//

import SwiftUI

struct EnterInfoView: View {
    @Binding var view: CarePlanViews
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Entering Information")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("AppColor"))
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Your care plan has 8 sections:")
                Text("•\tBasic Information")
                Text("•\tEmergency Contact")
                Text("•\tAdditional Personal Information")
                Text("•\tAutomatic Dysreflexia")
                Text("•\tMobility/Assistive Devices")
                Text("•\tRespiration")
                Text("•\tBowel Management")
                Text("•\tBladder Management")
            }
            
            Text("Use the sections that are relevant to you. You can return to your care plan any time to add or edit information.")
            
            HStack {
                Spacer()
                Button("Care Plan Form", action: carePlanForm)
                    .buttonStyle(CustomButton(color: Color("AppColor")))
                Spacer()
            }
        }
    }
}

extension EnterInfoView {
    func carePlanForm() {
        print("Care plan form")
        view = .carePlanForm
    }
}

struct EnterInfoView_Previews: PreviewProvider {
    @State static var view: CarePlanViews = .carePlanOptions
    
    static var previews: some View {
        EnterInfoView(view: $view)
    }
}
