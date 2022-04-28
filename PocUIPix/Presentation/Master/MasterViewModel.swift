//
//  MasterViewModel.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 21/04/22.
//

import Combine
import Foundation

final class MasterViewModel: ObservableObject {
    @Published var hasUserSession: Bool
    private var cancellable: AnyCancellable?
    
    init(userSessionService: UserSessionService) {
        hasUserSession = userSessionService.session != nil
        cancellable = userSessionService.$session
            .map { $0 != nil }
            .removeDuplicates()
            .assign(to: \.hasUserSession, on: self)
    }
}
