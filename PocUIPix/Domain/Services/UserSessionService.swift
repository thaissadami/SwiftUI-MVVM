//
//  UserSessionService.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 21/04/22.
//

import Foundation
import Combine

final class UserSessionService: ObservableObject{
    @Published var session: UserSession?
    
    func login() {
        session = .init(user: .init(name: "Thais"), token: UUID().uuidString)
    }
    
    func logout() {
        session = nil
    }
    
    func update(_ name: String) {
        session?.user.name = name
    }
}
