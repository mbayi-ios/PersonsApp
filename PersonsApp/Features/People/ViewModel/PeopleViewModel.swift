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

    func fetchUsers() {
        NetworkingManager.shared.request("https://reqres.in/api/users", type: UsersResponse.self) { [weak self] res in
            DispatchQueue.main.async {
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
