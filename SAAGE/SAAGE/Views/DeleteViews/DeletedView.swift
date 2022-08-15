//
//  DeletedView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-02-05.
//

import SwiftUI

struct DeletedView: View {
    @Binding var view: CarePlanViews
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Care plan deleted")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("AppColor"))
            
            Text("Your information has been erased.")
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Start again")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("If you want to re-enter information in your care plan, you can start over:")
            }
            
            HStack {
                Spacer()
                Button("Enter/Edit My Plan", action: editMyPlan)
                    .buttonStyle(CustomButton(color: Color("AppColor")))
                Spacer()
            }
        }
    }
}

extension DeletedView {
    func editMyPlan() {
        print("Clicked edit my plan")
    }
}

struct DeletedView_Previews: PreviewProvider {
    @State static var view: CarePlanViews = .delete
    
    static var previews: some View {
        DeletedView(view: $view)
    }
}
