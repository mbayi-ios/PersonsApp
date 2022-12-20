//
//  SettingsView.swift
//  PersonsApp
//
//  Created by Amby on 20/12/2022.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @AppStorage(UserDefaultKeys.hapticEnabled) private var isHapticsEnabled: Bool = true

    var body: some View {
        NavigationView {
            Form {
                haptics
            }
            .navigationBarTitle("Settings")
        }
    }
}

private extension SettingsView {
    var haptics: some View {
        Toggle("Enabled Haptics", isOn: $isHapticsEnabled)
    }
}

struct settingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
