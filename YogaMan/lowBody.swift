//
//  lowBody.swift
//  YogaMan
//
//  Created by Павел on 11.08.2022.
//

import SwiftUI

struct lowBody: Shape {
    
    @ObservedObject var manModel: ModelMan
    
    var legLeftAngle: Double
    var legRightAngle: Double
    var kneeLeftAngle: Double
    var kneeRightAngle: Double
    
    var animatableData: AnimatablePair<Double, AnimatablePair<Double, AnimatablePair<Double, Double>>> {
        get { AnimatablePair(legLeftAngle, AnimatablePair(legRightAngle, AnimatablePair(kneeLeftAngle,kneeRightAngle)))}
        set {
            legLeftAngle = newValue.first
            legRightAngle = newValue.second.first
            kneeRightAngle = newValue.second.second.second
            kneeLeftAngle = newValue.second.second.first
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            
            path.move(to: CGPoint(
                x: manModel.width * 0.5 - manModel.waist * 0.5,
                y: manModel.heightBody + manModel.armWidthStart + manModel.heightTorso))
            
            //Left Knee
            path.addArc(
                center: centerArcLeftKnee(manModel: manModel),
                radius: manModel.legRadius * 0.5,
                startAngle: .degrees(180 + legLeftAngle),
                endAngle: .degrees(180 - kneeLeftAngle),
                clockwise: true)
            
            //Left Leg
            path.addArc(
                center: centerArcLeftLeg(manModel: manModel),
                radius: manModel.legRadius * 0.5,
                startAngle: .degrees(180 - kneeLeftAngle),
                endAngle: .degrees(-kneeLeftAngle),
                clockwise: true)
            
            //Left Knee
            path.addArc(
                center: centerArcLeftKnee(manModel: manModel),
                radius: manModel.legRadius * 0.5,
                startAngle: .degrees(-kneeLeftAngle),
                endAngle: .degrees(legLeftAngle),
                clockwise: true)
            
            path.addLine(to: centerGroin(manModel: manModel))
            
            //Right Knee
            path.addArc(
                center: centerArcRightKnee(manModel: manModel),
                radius: manModel.legRadius * 0.5,
                startAngle: .degrees(180 - legRightAngle),
                endAngle: .degrees(180 + kneeRightAngle),
                clockwise: true)
            
            //Right Leg
            
            path.addArc(
                center: centerArcRightLeg(manModel: manModel),
                radius: manModel.legRadius * 0.5,
                startAngle: .degrees(180 + kneeRightAngle),
                endAngle: .degrees(kneeRightAngle),
                clockwise: true)
            
            //Right Knee
            path.addArc(
                center: centerArcRightKnee(manModel: manModel),
                radius: manModel.legRadius * 0.5,
                startAngle: .degrees(kneeRightAngle),
                endAngle: .degrees(-legRightAngle),
                clockwise: true)
            
            path.addLine(to: CGPoint(x: manModel.width * 0.5 + manModel.waist * 0.5, y: manModel.heightBody + manModel.armWidthStart + manModel.heightTorso))
        }
        
    }
}

extension lowBody {
    
    private func centerArcLeftKnee(manModel: ModelMan) -> CGPoint {
        
        CGPoint(
            x: manModel.width * 0.5  - lengthFromKneeToCenter(manModel: manModel).left - manModel.legRadius * 0.5,
            y: centerGroin(manModel: manModel).y + cos(legLeftAngle * Double.pi / 180) * manModel.lengthKnee)
    }
    
    private func centerArcLeftLeg(manModel: ModelMan) -> CGPoint {
        
        let xKnee = centerArcLeftKnee(manModel: manModel).x
        let yKnee = centerArcLeftKnee(manModel: manModel).y
        let length = manModel.lengthLeg - manModel.lengthKnee
        let deltaX = sin(kneeLeftAngle * Double.pi / 180) * length
        let deltaY = cos(kneeLeftAngle * Double.pi / 180) * length
        
        return CGPoint(x: xKnee + deltaX, y: yKnee + deltaY)
    }
    
    private func centerArcRightKnee(manModel: ModelMan) -> CGPoint {
        CGPoint(
            x: manModel.width * 0.5  + lengthFromKneeToCenter(manModel: manModel).right + manModel.legRadius * 0.5,
            y: centerGroin(manModel: manModel).y + cos(legRightAngle * Double.pi / 180) * manModel.lengthKnee)
    }
    
    private func centerArcRightLeg(manModel: ModelMan) -> CGPoint {
        
        let xKnee = centerArcRightKnee(manModel: manModel).x
        let yKnee = centerArcRightKnee(manModel: manModel).y
        let length = manModel.lengthLeg - manModel.lengthKnee
        let deltaX = sin(kneeRightAngle * Double.pi / 180) * length
        let deltaY = cos(kneeRightAngle * Double.pi / 180) * length
        
        return CGPoint(x: xKnee - deltaX, y: yKnee + deltaY)
    }
    
    private func lengthFromLegToCenter(manModel: ModelMan) -> (left: Double, right: Double) {
        
        let left = sin(legLeftAngle * Double.pi / 180) * manModel.lengthLeg
        let right = sin(legRightAngle * Double.pi / 180) * manModel.lengthLeg
        
        return (left, right)
        
    }
    
    private func lengthFromKneeToCenter(manModel: ModelMan) -> (left: Double, right: Double) {
        
        let left = sin(legLeftAngle * Double.pi / 180) * manModel.lengthKnee
        let right = sin(legRightAngle * Double.pi / 180) * manModel.lengthKnee
        
        return (left, right)
    }
    
    private func centerGroin(manModel: ModelMan) -> CGPoint {
        
        let x = manModel.width * 0.5
        var y = manModel.heightBody + manModel.armWidthStart + manModel.heightTorso
        
        let yDelta = getCatet(gypotenuse: manModel.legRadius, catet: manModel.waist * 0.5)
        
        y += yDelta
        
        return CGPoint(x: x, y: y)
    }
    
    private func getCatet(gypotenuse: Double, catet: Double) -> Double {
        
        sqrt(pow(gypotenuse, 2) - pow(catet, 2))
        
    }
}
