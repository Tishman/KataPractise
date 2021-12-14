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
    private var _lastFrameBonus = 0
    
    var notPlayedFrames: [FrameModel] { _notPlayedFrames }
    var playedFrames: [FrameModel] { _playedFrames }
    
    var score: Int {
        _notPlayedFrames.map(\.total).reduce(0, +)
    }
    
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
    
    mutating func strikeRolled() {
        if isFirstFrame {
            _notPlayedFrames.last?.firstRoll = 10
            _notPlayedFrames.last?.isStrike = true
        } else if isLastFrame {
            configureLastFrame()
        } else {
            _notPlayedFrames.last?.firstRoll = 10
            _notPlayedFrames.last?.isStrike = true
            for step in 0...1 {
                let index = (_playedFrames.count - 1) - step
                guard _playedFrames[index].isStrike else { break }
                _playedFrames[index].firstRoll! += 10
            }
        }
        
        playFrame()
    }
    
    private mutating func configureLastFrame() {
        if _notPlayedFrames.last?.firstRoll == nil {
            _notPlayedFrames.last?.firstRoll = 10
        } else if _notPlayedFrames.last?.secondRoll == nil {
            _notPlayedFrames.last?.secondRoll = 10
        } else {
            _lastFrameBonus = 10
        }
    }
}

final class FrameModel {
    var firstRoll: Int?
    var secondRoll: Int?
    var isStrike: Bool
    var isSpare: Bool
    
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
