//
//  BowlingServiceTests.swift
//  Bowling KataTests
//
//  Created by Роман Тищенко on 09.12.2021.
//

import XCTest
import Quick
import Nimble
@testable import Bowling_Kata

final class BowlingServiceTests: QuickSpec {
    override func spec() {
        describe("\(BowlingService.self)") {
            var bowlingService: BowlingService!
            var firstRoll = 0
            var secondRoll = 0
            var bonus = 0
            var total: Int { firstRoll + secondRoll + bonus }
            let initalState = Array(repeating: FrameModel(), count: 10)
            
            beforeEach {
                bowlingService = BowlingServiceImpl()
            }
            
            context("for closed frame") {
                context("in strike case") {
                    
                    context("when frame is 1st") {
                        beforeEach {
                            bowlingService.game.playedFrames.removeAll()
                            bowlingService.game.notPlayedFrames = initalState
                            bowlingService.rollBall(pins: 10)
                        }
                        it("it should have score 10") {
                            expect(bowlingService.score()).to(equal(10))
                        }
                    }
                    
                    context("when frame is 10th") {
                        context("and three in row") {
                            beforeEach {
                                bowlingService.rollBall(pins: 10)
                            }
                            
                            context("for a first roll") {
                                it("it should have score 10") {
                                    expect(bowlingService.score()).to(be(10))
                                }
                            }
                            
                            context("for a second roll") {
                                it("it should have score 20") {
                                    expect(bowlingService.score()).to(be(20))
                                }
                            }
                            
                            context("for a third roll") {
                                it("it should have score 30") {
                                    expect(bowlingService.score()).to(be(30))
                                }
                            }
                        }
                        
                        context("and two in row") {
                            beforeEach {
                                bowlingService.rollBall(pins: 10)
                            }
                            
                            context("for a first roll") {
                                it("it should have score 10") {
                                    expect(bowlingService.score()).to(be(10))
                                }
                            }
                            
                            context("for a second roll") {
                                it("it should have score 20") {
                                    expect(bowlingService.score()).to(be(20))
                                }
                            }
                            
                            context("for a third roll") {
                                beforeEach {
                                    bowlingService.rollBall(pins: 5)
                                }
                                
                                it("it should have score 25") {
                                    expect(bowlingService.score()).to(be(25))
                                }
                            }
                        }
                    }
                    
                    context("when several strikes") {
                        context("and ten in row") {
                            beforeEach {
                                for _ in 1...10 {
                                    bowlingService.rollBall(pins: 10)
                                }
                            }
                            
                            it("it should have score 300") {
                                expect(bowlingService.score()).to(be(300))
                            }
                        }
                        
                        context("and three in row") {
                            beforeEach {
                                for _ in 1...3 {
                                    bowlingService.rollBall(pins: 10)
                                }
                            }
                            
                            it("it should have score 60") {
                                expect(bowlingService.score()).to(be(60))
                            }
                        }
                    }
                    
                    context("when strike is single in middle game") {
                        beforeEach {
                            bowlingService.rollBall(pins: 10)
                            bowlingService.rollBall(pins: 5)
                            bowlingService.rollBall(pins: 7)
                        }
                        it("it should have score 34") {
                            expect(bowlingService.score()).to(be(34))
                        }
                    }
                }
                
                context("in spare case") {
                    beforeEach {
                        firstRoll = 5
                        secondRoll = 5
                        bowlingService.rollBall(pins: firstRoll)
                        bowlingService.rollBall(pins: secondRoll)
                    }
                    
                    context("when frame is 1st") {
                        it("it should have score \(firstRoll + secondRoll)") {
                            expect(bowlingService.score()).to(be(firstRoll + secondRoll))
                        }
                    }
                    
                    context("when frame is 10th") {
                        beforeEach {
                            bonus = 5
                            bowlingService.rollBall(pins: bonus)
                        }
                        it("it should have score \(total)") {
                            expect(bowlingService.score()).to(be(total))
                        }
                    }
                    
                    context("when spare is single in middle game") {
                        beforeEach {
                            bonus = 5
                            bowlingService.rollBall(pins: bonus)
                        }
                        
                        it("it should have score \(total)") {
                            expect(bowlingService.score()).to(be(total))
                        }
                        it("next frame first roll score should be equal bonus") {
                            
                        }
                    }
                }
            }
            
            context("for opened frame") {
                context("in simple case") {
                    beforeEach {
                        firstRoll = 4
                        secondRoll = 4
                        bowlingService.rollBall(pins: firstRoll)
                        bowlingService.rollBall(pins: secondRoll)
                    }
                    it("it should have score \(firstRoll + secondRoll)") {
                        expect(bowlingService.score()).to(be(firstRoll + secondRoll))
                    }
                }
            }
        }
    }
}
