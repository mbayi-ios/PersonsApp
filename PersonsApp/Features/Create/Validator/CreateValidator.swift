//
//  CreateValidator.swift
//  PersonsApp
//
//  Created by Amby on 20/12/2022.
//

import SwiftUI

struct CreateValidator{
    func validate(_ person: NewPerson) throws {
        if person.firstName.isEmpty {
            throw CreateValidatorError.invalidFirstName
        }

        if person.lastName.isEmpty {
            throw CreateValidatorError.invalidLastName
        }

        if person.job.isEmpty {
            throw CreateValidatorError.invalidJob
        }
    }
}


extension CreateValidator {
    enum CreateValidatorError: LocalizedError {
        case invalidFirstName
        case invalidLastName
        case invalidJob
    }
}


extension CreateValidator.CreateValidatorError {
    var errorDescription: String? {
        switch self {
        case .invalidFirstName:
            return "first Name cant be empty"

        case .invalidLastName:
            return "last name cant be empty"

        case .invalidJob:
            return "Job cant be empty"
        }
    }
}
