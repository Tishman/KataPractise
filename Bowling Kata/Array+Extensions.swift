//
//  Array+Extensions.swift
//  Bowling Kata
//
//  Created by Роман Тищенко on 15.12.2021.
//

import Foundation

extension Array {
    public func element(atIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }
        return self[index]
    }
}
