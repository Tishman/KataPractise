//
//  BowlingService.swift
//  Bowling Kata
//
//  Created by Роман Тищенко on 09.12.2021.
//

import Foundation

protocol BowlingService {
    var game: GameModel { get set }
    func rollBall(pins: Int)
    func score() -> Int
}

final class BowlingServiceImpl: BowlingService {
    
    var game = GameModel()
    
    func rollBall(pins: Int) {
        guard isValid(pins: pins) else { return }
        
        guard !game.isLastFrame else {
            if game.notPlayedFrames.last?.firstRoll == nil {
                game.notPlayedFrames.last?.firstRoll = pins
                return
            } else if game.notPlayedFrames.last?.secondRoll == nil {
                game.notPlayedFrames.last?.secondRoll = pins
                return
            } else {
                game.lastFrameBonus = pins
            }
            game.playFrame()
            return
        }
        
        if game.notPlayedFrames.last?.firstRoll == nil {
            game.notPlayedFrames.last?.firstRoll = pins
            guard pins == 10 else { return }
            game.playFrame()
        } else if game.notPlayedFrames.last?.secondRoll == nil {
            game.notPlayedFrames.last?.secondRoll = pins
            game.playFrame()
        }
    }
    
    func score() -> Int {
        game.score()
    }
    
    private func isValid(pins: Int) -> Bool {
        guard pins <= 10, game.notPlayedFrames.count > 0 else { return false }
        return true
    }
}
