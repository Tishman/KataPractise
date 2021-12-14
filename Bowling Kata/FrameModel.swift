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
    
    init() {
        self.head = FrameModel(previous: nil, next: nil)
        self.tail = nil
    }
    
    func score() -> Int {
        guard head != nil else { return 0 }
        var temp = head
        var score = 0
        while temp != nil {
            score += temp!.total
            temp = temp?.next
        }
        return score
    }
}

final class FrameModel {
    var firstRoll: Int?
    var secondRoll: Int?
    var isStrike: Bool
    var isSpare: Bool
    let previous: FrameModel?
    let next: FrameModel?
    
    var total: Int {
        return (firstRoll ?? 0) + (secondRoll ?? 0)
    }
    
    init(firstRoll: Int? = nil, secondRoll: Int? = nil, isStrike: Bool, isSpare: Bool, previous: FrameModel?, next: FrameModel?) {
        self.firstRoll = firstRoll
        self.secondRoll = secondRoll
        self.isStrike = isStrike
        self.isSpare = isSpare
        self.previous = previous
        self.next = next
    }
    
    convenience init(previous: FrameModel?, next: FrameModel?) {
        self.init(firstRoll: nil, secondRoll: nil, isStrike: false, isSpare: false, previous: previous, next: next)
    }
}
