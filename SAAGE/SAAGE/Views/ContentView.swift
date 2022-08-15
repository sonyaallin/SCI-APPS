//
//  ContentView.swift
//  SAAGE
//
//  Created by X on 1/20/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appViewModel = AppViewModel()
    
    var body: some View {
        NavigationMenuView()
            .environmentObject(appViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
