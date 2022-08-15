//
//  CarePlanOptionsView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-01-26.
//

import SwiftUI

struct CarePlanOptionsView: View {
    @Binding var view: CarePlanViews
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading, spacing: 15) {
                Text("My Care Plan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AppColor"))
                Text("Enter information about your self-management routines and other needs").fixedSize(horizontal: false, vertical: true)
                
                HStack {
                    Spacer()
                    Button("Enter/Edit My Plan", action: editMyPlan)
                        .buttonStyle(CustomButton(color: Color("AppColor")))
                    Spacer()
                }
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Share Information")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Share your information with health care providers and members of your care team")
                
                HStack {
                    Spacer()
                    Button("Share My Plan", action: shareMyPlan)
                        .buttonStyle(CustomButton(color: Color("AppColor")))
                    Spacer()
                }
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Delete Information")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Permanently delete your information or account")
                
                HStack {
                    Spacer()
                    Button("Delete", action: deleteMyPlan)
                        .buttonStyle(CustomButton(color: Color.red))
                    Spacer()
                }
            }
        }
    }
}

extension CarePlanOptionsView {
    func editMyPlan() {
        print("Editing plan")
        view = .enterInfo
    }
    
    func shareMyPlan() {
        print("Share my plan")
        view = .sharing
    }
    
    func deleteMyPlan() {
        print("Delete my plan")
        view = .delete
    }
}

struct CarePlanOptionsView_Previews: PreviewProvider {
    @State static var view: CarePlanViews = .carePlanOptions
    
    static var previews: some View {
        CarePlanOptionsView(view: $view)
    }
}
