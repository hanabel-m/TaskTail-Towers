//
//  Item.swift
//  TaskTailTowers
//
//  Created by Hanabel Mengistu on 12/26/23.
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
