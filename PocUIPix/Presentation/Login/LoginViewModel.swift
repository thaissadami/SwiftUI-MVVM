//
//  LoginViewModel.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 26/04/22.
//

import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published private(set) var state: LoginViewState
    
    var bindings: (
        nationalRegistration: Binding<String>,
        phoneNumber: Binding<String>,
        errorAlert: Binding<Bool>
    ) {
        (
            nationalRegistration: Binding(to: \.state.nationalRegistration, on: self),
            phoneNumber: Binding(to: \.state.phoneNumber, on: self),
            errorAlert: Binding(to: \.state.isShowingErrorAlert, on: self)
        )
    }
    
    var nationalRegistrationBinding: Binding<String> {
        fatalError()
    }
    
    var phoneNumberBinding: Binding<String> {
        fatalError()
    }
    
    var errorAlertBinding: Binding<String> {
        fatalError()
    }
    
    init(initialState: LoginViewState) {
        state = initialState
    }
    
    func login() {
        state.isLoggingIn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.state.isLoggingIn = false
        }
    }
    
    func close() {
        state.isLoggingIn = false
    }
}
