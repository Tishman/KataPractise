//
//  FrameModel.swift
//  Bowling Kata
//
//  Created by Роман Тищенко on 09.12.2021.
//

import Foundation

struct GameModel {
    private var _notPlayedFrames: [FrameModel]
    private var _playedFrames: [FrameModel]
    var lastFrameBonus = 0
    
    var notPlayedFrames: [FrameModel] { _notPlayedFrames }
    var playedFrames: [FrameModel] { _playedFrames }
    
    var isFirstFrame: Bool {
        _notPlayedFrames.count == 10
    }
    
    var isLastFrame: Bool {
        _notPlayedFrames.count == 1
    }
    
    init() {
        self._notPlayedFrames = Array(repeating: FrameModel(), count: 10)
        self._playedFrames = []
    }
    
    mutating func playFrame() {
        _playedFrames.append(_notPlayedFrames.removeLast())
    }
    
    func score() -> Int {
      
        
    }
}

final class FrameModel {
    var firstRoll: Int? {
        didSet {
            if firstRoll == 10 {
                isStrike = true
            }
        }
    }
    
    var secondRoll: Int? {
        didSet {
            if firstRoll != 10 && total == 10 { isSpare = true }
        }
    }
    
    private var isStrike: Bool
    private var isSpare: Bool
    
    var total: Int {
        return (firstRoll ?? 0) + (secondRoll ?? 0)
    }
    
    init(firstRoll: Int? = nil, secondRoll: Int? = nil, isStrike: Bool = false, isSpare: Bool = false) {
        self.firstRoll = firstRoll
        self.secondRoll = secondRoll
        self.isStrike = isStrike
        self.isSpare = isSpare
    }
}
