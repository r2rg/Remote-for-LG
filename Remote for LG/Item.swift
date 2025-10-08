//
//  Item.swift
//  Remote for LG
//
//  Created by Артур Галустян on 08.10.2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
