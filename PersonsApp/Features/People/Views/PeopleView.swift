//
//  PeopleView.swift
//  PersonsApp
//
//  Created by Amby on 19/12/2022.
//

import SwiftUI

struct PeopleView: View {
    private let columns = Array(repeating: GridItem(.flexible()), count: 2)
    var body: some View {
        NavigationView {
            ZStack {
                Theme.background
                    .ignoresSafeArea( edges: .top)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0...5, id: \.self) { item in
                           PersonItemView(user: item)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Persons")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {

                    } label: {
                        Symbols.plus
                            .font(.system(.headline, design: .rounded)
                                    .bold())
                    }
                }
            }
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView()
    }
}
