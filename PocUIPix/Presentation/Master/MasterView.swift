//
//  MasterView.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 21/04/22.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject private var model: MasterViewModel
    @EnvironmentObject var userSessionService: UserSessionService
    
    init(model: MasterViewModel) {
        self.model = model
    }
    
    var body: some View {
        Group {
            if model.hasUserSession {
                ContentView()
            } else {
                LoginView(model: .init(initialState: .init()))
            }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MasterView(model: .init(userSessionService: .init()))
        }
    }
}
