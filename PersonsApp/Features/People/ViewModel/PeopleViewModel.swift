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

    func fetchUsers() {
        NetworkingManager.shared.request("https://reqres.in/api/users?delay=3", type: UsersResponse.self) { [weak self] res in
            DispatchQueue.main.async {
                defer { self?.isLoading = false }
                switch res {
                case .success(let response):
                    self?.users = response.data
                case .failure(let error):
                    self?.hasError = true
                    self?.error = error as? NetworkingManager.NetworkingError
                }
            }
        }
    }
}
