//
//  SAAGEApp.swift
//  SAAGE
//
//  Created by X on 1/20/22.
//

import SwiftUI
import Firebase

struct CustomButton: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 5))
            .buttonStyle(.bordered)
            .background(color)
            .foregroundColor(Color.white)
            .font(.title3.bold())
            .cornerRadius(10)
    }
}

@main
struct SAAGEApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
