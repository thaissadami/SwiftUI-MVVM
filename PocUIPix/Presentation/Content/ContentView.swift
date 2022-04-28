//
//  ContentView.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 21/04/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userSessionService: UserSessionService
    
    var body: some View {
        VStack(spacing: 4) {
            Text("Hello \(userSessionService.session?.user.name ?? "")")
            Button(action: userSessionService.logout) {
                Text("Tap to logout")
            }
            Button(action: { self.userSessionService.update("Sadami") }) {
                Text("Update do Sadami")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
