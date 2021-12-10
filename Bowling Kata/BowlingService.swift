//
//  BowlingService.swift
//  Bowling Kata
//
//  Created by Роман Тищенко on 09.12.2021.
//

import Foundation

protocol BowlingService {
    func rollBall(pins: Int)
    func score() -> Int
}

final class BowlingServiceImpl: BowlingService {
    
}
