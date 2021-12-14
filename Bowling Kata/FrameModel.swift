//
//  FrameModel.swift
//  Bowling Kata
//
//  Created by Роман Тищенко on 09.12.2021.
//

import Foundation

struct GameModel {
    var head: FrameModel?
    var tail: FrameModel?
    
    func score() -> Int {
        
    }
}

final class FrameModel {
    var firstRoll: Int?
    var secondRoll: Int?
    var isClosed: Bool
    let previous: FrameModel?
    let next: FrameModel
    
    var total: Int {
        return (firstRoll ?? 0) + (secondRoll ?? 0)
    }
    
    init(firstRoll: Int?, secondRoll: Int?, isClosed: Bool, previous: FrameModel?, next: FrameModel) {
        self.firstRoll = firstRoll
        self.secondRoll = secondRoll
        self.isClosed = isClosed
        self.previous = previous
        self.next = next
    }
    
    convenience init(previous: FrameModel?, next: FrameModel) {
        self.init(firstRoll: nil, secondRoll: nil, isClosed: false, previous: previous, next: next)
    }
}
