//
//  DetailView.swift
//  PersonsApp
//
//  Created by Amby on 20/12/2022.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            background

            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Group {
                        general

                        link
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 18)
                    .background(Theme.detailBackground, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
                .padding()
            }

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

private extension DetailView {
    var background: some View {
        Theme.background
            .ignoresSafeArea( edges: .top)
    }
    var link: some View {
        Link(destination: .init(string: "https://www.google.com")!) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Support Reqres")
                    .foregroundColor(Theme.text)
                    .font(.system(.body, design: .rounded).weight(.semibold))
                Text("https://www.google.com")
            }
            Spacer()
            Symbols.link
                .font(.system(.title3, design: .rounded))
        }
    }
}

private extension DetailView {
    var general: some View {
        VStack(alignment: .leading, spacing: 8) {
            PillView(id: 0)

            Group {
                firstName
                lastName
                email
            }
            .foregroundColor(Theme.text)
        }
    }

    @ViewBuilder
    var firstName: some View {
        Text("First Name")
            .font(
                .system(.body, design: .rounded)
                    .weight(.semibold)
            )
        Text("First Name here")
            .font(.system(.subheadline, design: .rounded))
        Divider()
    }

    @ViewBuilder
    var lastName: some View {
        Text("First Name")
            .font(
                .system(.body, design: .rounded)
                    .weight(.semibold)
            )
        Text("First Name here")
            .font(.system(.subheadline, design: .rounded))
        Divider()
    }

    @ViewBuilder
    var email: some View {
        Text("First Name")
            .font(
                .system(.body, design: .rounded)
                    .weight(.semibold)
            )
        Text("First Name here")
            .font(.system(.subheadline, design: .rounded))
        Divider()
    }
}
