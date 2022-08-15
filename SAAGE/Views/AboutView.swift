//
//  AboutView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-01-20.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text("About")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AppColor"))
                Text("This project was initiated in response to the COVID-19 pandemic, to support people living with SCI who need to be admitted to hospital.")
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Team")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Developed by the SCI+U team, based in the University of Toronto's Physical Therapy department. Funding provided by the Praxis Spinal Cord Institute.")
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Methods")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Developed during the summer of 2020 using an agile process with user feedback.")
            }
                   
            VStack(alignment: .leading, spacing: 5) {
                Text("Open Source")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("This is an open source project. Source code for this project can be viewed on Github")
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
