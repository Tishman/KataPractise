//
//  Bowling_KataTests.swift
//  Bowling KataTests
//
//  Created by Роман Тищенко on 09.12.2021.
//

import XCTest
@testable import Bowling_Kata

class Bowling_KataTests: XCTestCase {
    var bowlingService: BowlingService!
    var initialState: [FrameModel] {
        var temp = [FrameModel]()
        for _ in 0...9 {
            temp.append(FrameModel())
        }
        return temp
    }

    override func setUp() {
        bowlingService = BowlingServiceImpl()
    }

    override func tearDown() {
        bowlingService = nil
    }

    func test_strike_case_last_frame_three_in_row() {
        for _ in 0...8 {
            bowlingService.game.playFrame()
        }
        
        bowlingService.rollBall(pins: 10)
        bowlingService.rollBall(pins: 10)
        bowlingService.rollBall(pins: 10)
        XCTAssertEqual(bowlingService.score(), 30)
    }

    func test_strike_case_last_frame_two_in_row() {
        for _ in 0...8 {
            bowlingService.game.playFrame()
        }
        
        bowlingService.rollBall(pins: 10)
        bowlingService.rollBall(pins: 10)
        bowlingService.rollBall(pins: 5)
        XCTAssertEqual(bowlingService.score(), 25)
    }
    
    func test_strike_case_last_frame_onest() {
        for _ in 0...8 {
            bowlingService.game.playFrame()
        }
        
        bowlingService.rollBall(pins: 10)
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 5)
        XCTAssertEqual(bowlingService.score(), 20)
    }
    
    func test_strike_case_all() {
        for _ in 0...11 {
            bowlingService.rollBall(pins: 10)
        }
        
        XCTAssertEqual(bowlingService.score(), 300)
    }
    
    func test_strike_in_middle_three_in_row() {
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 3)
        for _ in 0...2 {
            bowlingService.rollBall(pins: 10)
        }
        
        XCTAssertEqual(bowlingService.score(), 68)
    }
    
    func test_strike_in_middle_two_in_row() {
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 3)
        for _ in 0...1 {
            bowlingService.rollBall(pins: 10)
        }
        
        XCTAssertEqual(bowlingService.score(), 38)
    }
    
    func test_strike_in_middle_onest() {
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 3)
        bowlingService.rollBall(pins: 10)
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 3)
        
        XCTAssertEqual(bowlingService.score(), 34)
    }
    
    func test_spare_last_frame() {
        for _ in 0...8 {
            bowlingService.game.playFrame()
        }
        
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 5)
        
        XCTAssertEqual(bowlingService.score(), 15)
    }
    
    func test_spare_in_middle() {
        // 1st frame - 8
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 3)
        
        // 2nd frame - spare - 13
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 5)
        
        // 3rd frame - 6
        bowlingService.rollBall(pins: 3)
        bowlingService.rollBall(pins: 3)
        
        XCTAssertEqual(bowlingService.score(), 27)
    }
    
    func test_simple_rolls() {
        // 1st frame - 8
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 3)
        
        // 2nd frame - 7
        bowlingService.rollBall(pins: 4)
        bowlingService.rollBall(pins: 3)
        
        // 3rd frame - 8
        bowlingService.rollBall(pins: 1)
        bowlingService.rollBall(pins: 7)
        
        // 4th frame - 8
        bowlingService.rollBall(pins: 2)
        bowlingService.rollBall(pins: 6)
        
        // 5th fram - 9
        bowlingService.rollBall(pins: 7)
        bowlingService.rollBall(pins: 2)
        
        XCTAssertEqual(bowlingService.score(), 40)
    }
    
    func test_simple_rolls_with_strikes_and_spares() {
        // 1st frame - 8
        bowlingService.rollBall(pins: 5)
        bowlingService.rollBall(pins: 3)
        
        // 2nd frame - 7
        bowlingService.rollBall(pins: 4)
        bowlingService.rollBall(pins: 3)
        
        // 3rd frame - strike
        bowlingService.rollBall(pins: 10)
        
        // 4th frame - 8
        bowlingService.rollBall(pins: 2)
        bowlingService.rollBall(pins: 6)
        
        // 5th fram - spare
        bowlingService.rollBall(pins: 7)
        bowlingService.rollBall(pins: 3)
        
        // 6th fram - 6
        bowlingService.rollBall(pins: 3)
        bowlingService.rollBall(pins: 3)
        
        // 7th fram - 9
        bowlingService.rollBall(pins: 7)
        bowlingService.rollBall(pins: 2)
        
        // 8th fram - strike
        bowlingService.rollBall(pins: 10)
        
        // 9th fram - spare
        bowlingService.rollBall(pins: 7)
        bowlingService.rollBall(pins: 3)
        
        // 10th fram - 9
        bowlingService.rollBall(pins: 7)
        bowlingService.rollBall(pins: 2)
        bowlingService.rollBall(pins: 2)
        
        XCTAssertEqual(bowlingService.score(), 115)
    }
}
