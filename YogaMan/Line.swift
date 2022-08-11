//
//  Line.swift
//  YogaMan
//
//  Created by Павел on 11.08.2022.
//

import SwiftUI

struct Arc: Shape {
    var center: CGPoint
    var radius: Double
    var startAngle: Double
    var endAngle: Double

    var animatableData: AnimatablePair<CGPoint.AnimatableData, AnimatablePair<Double, AnimatablePair<Double, Double>>> {
        get { AnimatablePair(center.animatableData, AnimatablePair(radius, AnimatablePair(startAngle,endAngle)))}
        set {
            center.animatableData = newValue.first
            radius = newValue.second.first
            startAngle = newValue.second.first
            endAngle = newValue.second.second.first
        }
    }
    
    func path(in rect: CGRect) -> Path {

        Path { path in
            path.move(to: center)
            path.addArc(
                center: center,
                radius: radius,
                startAngle: .degrees(startAngle),
                endAngle: .degrees(endAngle),
                clockwise: true)
        }
    }
}

struct LineTo: Shape {
    var path: Path
    var end: CGPoint

    var animatableData: CGPoint.AnimatableData {
        get { end.animatableData}
        set {
            end.animatableData = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addLine(to: end)
        }
    }
}

struct Line: Shape {
    var start: CGPoint
    var end: CGPoint

    var animatableData: AnimatablePair<CGPoint.AnimatableData, CGPoint.AnimatableData> {
        get { AnimatablePair(start.animatableData, end.animatableData) }
        set {
            start.animatableData = newValue.first
            end.animatableData = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: start)
            p.addLine(to: end)
        } 
    }
}
