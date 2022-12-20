//
//  CreateView.swift
//  PersonsApp
//
//  Created by Amby on 20/12/2022.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView {
            Form {
                firstName
                lastName
                job
                Section {
                    submit
                }
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

private extension CreateView {
    var done: some View {
        Button("Done") {
            dismiss()
        }
    }

    var firstName: some View {
        TextField("First Name", text: .constant(""))
    }

    var lastName: some View {
        TextField("Last Name", text: .constant(""))
    }

    var job: some View {
        TextField("Job", text: .constant(""))
    }

    var submit: some View {
        Button("Submit") {

        }
    }
}
