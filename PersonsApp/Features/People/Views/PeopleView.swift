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
                            VStack(spacing: .zero) {
                                Rectangle()
                                    .fill(.blue)
                                    .frame(height: 130)

                                VStack(alignment: .leading) {
                                    Text("#\(item)")
                                        .font(
                                            .system(.caption, design: .rounded)
                                                .bold()
                                        )
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 9)
                                        .padding(.vertical, 4)
                                        .background(Theme.pill, in: Capsule())

                                    Text("<Last Name> <First Name>")
                                        .foregroundColor(Theme.text)
                                        .font(
                                            .system(.body, design: .rounded)
                                        )
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 5)
                                .background(Theme.detailBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Theme.text.opacity(0.1), radius: 2, x: 0, y: 1)
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
