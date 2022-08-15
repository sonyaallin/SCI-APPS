//
//  HowToUseView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-01-20.
//

import SwiftUI

struct HowToUseView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text("How To Use")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AppColor"))
                Text("You can create a personal care plan with information about your self-management routines. This may be useful if you are admitted to hospital.")
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Enter your information")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Enter information that is relevant to your situation using the care plan form.")
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Share with your care team")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Share your information with health care providers and members of your care team.")
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Delete your information")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Permanently delete your information.")
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Security and Privacy")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("...")
            }
        }
    }
}

struct HowToUseView_Previews: PreviewProvider {
    static var previews: some View {
        HowToUseView()
    }
}
