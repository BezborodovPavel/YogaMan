//
//  Position.swift
//  YogaMan
//
//  Created by Павел on 11.08.2022.
//

import Foundation

struct PositionSettings {
    let legLeftAngle: Double
    let legRightAngle: Double
    let kneeLeftAngle: Double
    let kneeRightAngle: Double
}

enum Position: Int {
    case first
    case second
    case third
    case four
    case five
    case six
    case seven
    case eigth
    
    func getPositionSettings() -> PositionSettings {
        switch self {
        case .first:
            return PositionSettings(
                legLeftAngle: 5,
                legRightAngle: 5,
                kneeLeftAngle: 0,
                kneeRightAngle: 0)
        case .second:
            return PositionSettings(
                legLeftAngle: 30,
                legRightAngle: 0,
                kneeLeftAngle: -30,
                kneeRightAngle: 5)
        case .third:
            return PositionSettings(
                legLeftAngle: 60,
                legRightAngle: -5,
                kneeLeftAngle: -50,
                kneeRightAngle: 10)
        case .four:
            return PositionSettings(
                legLeftAngle: 90,
                legRightAngle: -10,
                kneeLeftAngle: -85,
                kneeRightAngle: 10)
        case .five:
            return PositionSettings(
                legLeftAngle: 90,
                legRightAngle: -10,
                kneeLeftAngle: -135,
                kneeRightAngle: 10)
        case .six:
            return PositionSettings(
                legLeftAngle: 5,
                legRightAngle: 5,
                kneeLeftAngle: 0,
                kneeRightAngle: 0)
        case .seven:
            return PositionSettings(
                legLeftAngle: 90,
                legRightAngle: 90,
                kneeLeftAngle: -75,
                kneeRightAngle: -75)
        case .eigth:
            return PositionSettings(
                legLeftAngle: 5,
                legRightAngle: 5,
                kneeLeftAngle: 0,
                kneeRightAngle: 0)
        }
    }
}
