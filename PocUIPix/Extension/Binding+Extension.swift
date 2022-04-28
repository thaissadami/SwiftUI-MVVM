//
//  Binding+Extension.swift
//  PocUIPix
//
//  Created by Thais Morimoto on 26/04/22.
//

import Foundation
import SwiftUI

extension Binding {
    init<ObjectType: AnyObject>(to path: ReferenceWritableKeyPath<ObjectType, Value>,
                                on object: ObjectType
    ) {
        self.init(
            get: { object[keyPath: path] },
            set: { object[keyPath: path] = $0 }
        )
    }
}
