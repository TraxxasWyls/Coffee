//
//  SignInInteractor.swift
//  TheRun
//
//  Created by incetro on 10/03/2020.
//  Copyright © 2020 Incetro Inc. All rights reserved.
//

import Foundation

// MARK: - SignInInteractor

final class SignInInteractor {

    // MARK: - Properties

    /// Presenter instance
    weak var output: SignInInteractorOutput?

    /// AuthService instance
    private let authService: AuthService

    // MARK: - Initializers

    init(authService: AuthService) {
        self.authService = authService
    }
}

// MARK: - SignInInteractorInput

extension SignInInteractor: SignInInteractorInput {

    func checkMail(_ mail: String) {
        authService
            .check(mail: mail)
            .async()
            .success { [weak self] exists in
                if exists {
                    self?.output?.signInAllowed(withMail: mail)
                } else {
                    self?.output?.signUpRequired(withMail: mail)
                }
            }
            .failure(output?.processError)
    }
}
