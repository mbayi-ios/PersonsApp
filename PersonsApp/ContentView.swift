//
//  ContentView.swift
//  PersonsApp
//
//  Created by Amby on 19/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear {
            print("User Response")
            dump(
                try? StaticJSONMapper.decode(file: "UserStaticData", type: UsersResponse.self)
            )
            print("single user response")
            dump(
                try? StaticJSONMapper.decode(file: "SingleUserData", type: UserDetailResponse.self)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
