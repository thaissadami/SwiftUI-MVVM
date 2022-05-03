//
//  LoginView.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 21/04/22.
//

import SwiftUI

struct LoginViewState {
    var nationalRegistration = ""
    var phoneNumber = ""
    var password = ""
    var isLoggingIn = false
    var isShowingErrorAlert = false
}

extension LoginViewState {
    var canSubmit: Bool {
        nationalRegistration.isEmpty == false && phoneNumber.isEmpty == false
    }
    var footerMessage: String {
        isLoggingIn ? "Fazendo Login.." : ""
    }
}

struct LoginView: View {
    @EnvironmentObject var userSessionService: UserSessionService
    @ObservedObject private var model: LoginViewModel
    
    init(model: LoginViewModel) {
        self.model = model
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    
                    Text("Para começar, digite suas informações")
                        .padding(.top, 24)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer().frame(height: 32)
                    
                    TextField("CPF", text: model.bindings.nationalRegistration)
                        .keyboardType(.numberPad)
                        .autocapitalization(.none)
                    TextField("Telefone com DDD", text: model.bindings.phoneNumber)
                }.padding(20)
                
                MCIFilledButton(action: model.login) {
                    Text("Continuar")
                }
                .padding()
            
                Spacer()
                
                .navigationBarItems(leading: closeButton)
                .foregroundColor(.black)
                .navigationTitle("Seus dados")
                .disabled(model.state.isLoggingIn)
                .alert(isPresented: model.bindings.errorAlert) {
                    Alert(
                        title: Text("Erro ao fazer login"),
                        message: Text("Verifique seu e-mail e senha e tente novamente mais tarde"))
                }
            }
        }
    }
    
    private var closeButton: some View {
        Button(action: model.close) {
            Text("Fechar")
        }
        .disabled(model.state.canSubmit)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView(model: .init(initialState: .init()))
        }
    }
}

