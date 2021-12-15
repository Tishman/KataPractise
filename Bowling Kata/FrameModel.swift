//
//  FrameModel.swift
//  Bowling Kata
//
//  Created by Роман Тищенко on 09.12.2021.
//

import Foundation

public struct GameModel {
    var notPlayedFrames: [FrameModel]
    var playedFrames: [FrameModel]
    var lastFrameBonus = 0
    
    var isFirstFrame: Bool {
        notPlayedFrames.count == 10
    }
    
    var isLastFrame: Bool {
        notPlayedFrames.count == 1
    }
    
    public init() {
        self.notPlayedFrames = Array(repeating: FrameModel(), count: 10)
        self.playedFrames = []
    }
    
    mutating func playFrame() {
        playedFrames.append(notPlayedFrames.removeLast())
    }
    
    func score() -> Int {
        var score = 0
        for (index, frame) in playedFrames.enumerated() {
            if index == 9 {
                score += lastFrameBonus
                score += frame.total
                continue
            }
            
            score += frame.total
            
            if frame.isStrike {
                if (playedFrames.element(atIndex: index + 1)?.isStrike ?? false)
                    && (playedFrames.element(atIndex: index + 2)?.isStrike ?? false) {
                    score += 20
                } else if (playedFrames.element(atIndex: index + 1)?.isStrike ?? false) {
                    score += 10
                } else {
                    score += playedFrames.element(atIndex: index + 1)?.total ?? 0
                }
                
                continue
            } else if frame.isSpare {
                score += playedFrames.element(atIndex: index + 1)?.firstRoll ?? 0
            }
        }
        
        return score
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

extension FrameModel: CustomStringConvertible {
    var description: String {
        return "firstRoll: \(firstRoll ?? 0)\nsecondRoll: \(secondRoll ?? 0)\ntotal: \(total)\nisStrike: \(isStrike)\nisSpare: \(isSpare)"
    }
}

