//
//  PersonsAppApp.swift
//  PersonsApp
//
//  Created by Amby on 19/12/2022.
//

import SwiftUI

@main
struct PersonsAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView()
                    .tabItem {
                        Symbols.person
                        Text("Home")
                    }
                SettingsView()
                    .tabItem {
                        Symbols.gear
                        Text("Settings")
                    }
            }
        }
    }
}
