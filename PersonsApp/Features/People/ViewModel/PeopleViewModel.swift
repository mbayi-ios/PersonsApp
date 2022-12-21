//
//  PeopleViewModel.swift
//  PersonsApp
//
//  Created by Amby on 20/12/2022.
//

import Foundation

final class PeopleViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published private(set) var error: NetworkingManager.NetworkingError?
    @Published var hasError = false
    @Published private(set) var isLoading = false

    @MainActor
    func fetchUsers() async {
       isLoading = true
        defer { isLoading = false }
        do {
            let response = try await NetworkingManager.shared.request(.people, type: UsersResponse.self)
            self.users = response.data
        } catch {
            self.hasError = true
            if let networkingError = error as? NetworkingManager.NetworkingError {
                self.error = networkingError
            } else {
                self.error = .custom(error: error)
            }
        }
    }
}
