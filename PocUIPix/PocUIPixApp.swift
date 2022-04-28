//
//  PocUIPixApp.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 21/04/22.
//

import SwiftUI

@main
struct PocUIPixApp: App {
    var body: some Scene {
        WindowGroup {
            let userSessionService = UserSessionService()
            let masterViewModel = MasterViewModel(userSessionService: userSessionService)
            NavigationView {
                MasterView(model: masterViewModel).environmentObject(userSessionService)
            }
        }
    }
}
