//
//  Man.swift
//  YogaMan
//
//  Created by Павел on 26.07.2022.
//

import SwiftUI

struct Man: View {
    
    @ObservedObject var manModel: ModelMan
    @State private var path = Path()
    
    var body: some View {
        Group {
            Circle()
                .frame(width: manModel.headRadius, height: manModel.headRadius)
                .position(
                    x: manModel.width * 0.5,
                    y: manModel.heightBody - manModel.headRadius * 0.5 - manModel.neck)
            
            Path { p in
                p.move(to: CGPoint(
                    x: manModel.width * 0.5,
                    y: manModel.heightBody))
                let r = 6
            }
            
            Arc(
                center: centerArcLeftArm(manModel: manModel),
                radius: manModel.armRadiusFinish,
                startAngle: 270,
                endAngle: 90
            )
            

//                path.addArc(
//                    center: centerArcLeftArm(manModel: manModel),
//                    radius: manModel.armRadiusFinish,
//                    startAngle: .degrees(270),
//                    endAngle: .degrees(90),
//                    clockwise: true)

            LineTo(path: path, end: CGPoint(
                x: manModel.width * 0.5 - manModel.widthBody * 0.5,
                y: manModel.heightBody + manModel.armWidthStart)
            )
//                path.addLine(to: CGPoint(
//                    x: manModel.width * 0.5 - manModel.widthBody * 0.5,
//                    y: manModel.heightBody + manModel.armWidthStart))

            LineTo(path: path, end: CGPoint(
                x: manModel.width * 0.5 - manModel.waist * 0.5,
                y: manModel.heightBody + manModel.armWidthStart + manModel.heightTorso)
            )
//                path.addLine(to: CGPoint(
//                    x: manModel.width * 0.5 - manModel.waist * 0.5,
//                    y: manModel.heightBody + manModel.armWidthStart + manModel.heightTorso))
            
            lowBody(manModel: manModel)

//                path.addLine(to: CGPoint(x: manModel.width * 0.5 + manModel.waist * 0.5, y: manModel.heightBody + manModel.armWidthStart + manModel.heightTorso))

            LineTo(path: path, end: CGPoint(
                x: manModel.width * 0.5 + manModel.widthBody * 0.5,
                y: manModel.heightBody + manModel.armWidthStart)
            )
//                path.addLine(to: CGPoint(
//                    x: manModel.width * 0.5 + manModel.widthBody * 0.5,
//                    y: manModel.heightBody + manModel.armWidthStart))

            Arc(
                center: centerArcRightArm(manModel: manModel),
                radius: manModel.armRadiusFinish,
                startAngle: 90,
                endAngle: 270
            )
            
//                path.addArc(
//                    center: centerArcRightArm(manModel: manModel),
//                    radius: manModel.armRadiusFinish,
//                    startAngle: .degrees(90),
//                    endAngle: .degrees(270),
//                    clockwise: true)
            }
        
        .padding()
    }
    
}

extension Man {
    
    private func centerArcLeftArm(manModel: ModelMan) -> CGPoint {
        CGPoint(
            x: manModel.width * 0.5 - manModel.lengthArm,
            y: manModel.heightBody + manModel.armRadiusFinish)
    }
    
    private func centerArcRightArm(manModel: ModelMan) -> CGPoint {
        CGPoint(
            x: manModel.width * 0.5 + manModel.lengthArm,
            y: manModel.heightBody + manModel.armRadiusFinish)
    }
}

// Trogonometric function
extension Man {
//
//    private func getGypotenuse(lengthX: Double, lengthRadius: Double) -> Double {
//
//        sqrt(pow(lengthX, 2) + pow(lengthRadius, 2))
//
//    }
//
//    private func getLengts(firstPoint: CGPoint, secondPoint: CGPoint) -> Double {
//
//        let lengthX = abs(firstPoint.x - secondPoint.x)
//        let lengthY = abs(firstPoint.y - secondPoint.y)
//        let length = sqrt(pow(lengthX, 2) + pow(lengthY, 2))
//        return length
//    }
//
//    private func getAngel(sideA: Double, sideC: Double) -> Double {
//
//        let sinA = sideA / sideC
//        return asin(sinA) * 180 / Double.pi
//    }
}

struct Man_Previews: PreviewProvider {
    static var previews: some View {
        Man(manModel: ModelMan())
    }
}

struct lowBody: View {
    
    @ObservedObject var manModel: ModelMan
    var body: some View {
        //Left Knee
        Arc(
            center: centerArcLeftKnee(manModel: manModel),
            radius: manModel.legRadius * 0.5,
            startAngle: 180 + manModel.legLeftAngle,
            endAngle: 180 - manModel.kneeLeftAngle
        )
        //                path.addArc(
        //                    center: centerArcLeftKnee(manModel: manModel),
        //                    radius: manModel.legRadius * 0.5,
        //                    startAngle: .degrees(180 + manModel.legLeftAngle),
        //                    endAngle: .degrees(180 - manModel.kneeLeftAngle),
        //                    clockwise: true)
        
        //Left Leg
        Arc(
            center: centerArcLeftLeg(manModel: manModel),
            radius: manModel.legRadius * 0.5,
            startAngle: 180 - manModel.kneeLeftAngle,
            endAngle: -manModel.kneeLeftAngle
        )
        //                path.addArc(
        //                    center: centerArcLeftLeg(manModel: manModel),
        //                    radius: manModel.legRadius * 0.5,
        //                    startAngle: .degrees(180 - manModel.kneeLeftAngle),
        //                    endAngle: .degrees(-manModel.kneeLeftAngle),
        //                    clockwise: true)
        
        //Left Knee
        Arc(
            center: centerArcLeftKnee(manModel: manModel),
            radius: manModel.legRadius * 0.5,
            startAngle: -manModel.kneeLeftAngle,
            endAngle: manModel.legLeftAngle
        )
        //                path.addArc(
        //                    center: centerArcLeftKnee(manModel: manModel),
        //                    radius: manModel.legRadius * 0.5,
        //                    startAngle: .degrees(-manModel.kneeLeftAngle),
        //                    endAngle: .degrees(manModel.legLeftAngle),
        //                    clockwise: true)
        
//        LineTo(path: path, end: centerGroin(manModel: manModel))
//        //                path.addLine(to: centerGroin(manModel: manModel))
        
        //Right Knee
        Arc(
            center: centerArcRightKnee(manModel: manModel),
            radius: manModel.legRadius * 0.5,
            startAngle: 180 - manModel.legRightAngle,
            endAngle: 180 + manModel.kneeRightAngle
        )
        //                path.addArc(
        //                    center: centerArcRightKnee(manModel: manModel),
        //                    radius: manModel.legRadius * 0.5,
        //                    startAngle: .degrees(180 - manModel.legRightAngle),
        //                    endAngle: .degrees(180 + manModel.kneeRightAngle),
        //                    clockwise: true)
        
        //Right Leg
        Arc(
            center: centerArcRightLeg(manModel: manModel),
            radius: manModel.legRadius * 0.5,
            startAngle: 180 + manModel.kneeRightAngle,
            endAngle: manModel.kneeRightAngle
        )
        //                path.addArc(
        //                    center: centerArcRightLeg(manModel: manModel),
        //                    radius: manModel.legRadius * 0.5,
        //                    startAngle: .degrees(180 + manModel.kneeRightAngle),
        //                    endAngle: .degrees(manModel.kneeRightAngle),
        //                    clockwise: true)
        
        //Right Knee
        Arc(
            center: centerArcRightKnee(manModel: manModel),
            radius: manModel.legRadius * 0.5,
            startAngle: manModel.kneeRightAngle,
            endAngle: -manModel.legRightAngle
        )
        //                path.addArc(
        //                    center: centerArcRightKnee(manModel: manModel),
        //                    radius: manModel.legRadius * 0.5,
        //                    startAngle: .degrees(manModel.kneeRightAngle),
        //                    endAngle: .degrees(-manModel.legRightAngle),
        //                    clockwise: true)
        
//        LineTo(end: CGPoint(
//            x: manModel.width * 0.5 + manModel.waist * 0.5,
//            y: manModel.heightBody + manModel.armWidthStart + manModel.heightTorso)
//        )
        
    }
}

extension lowBody {
    
    private func centerArcLeftKnee(manModel: ModelMan) -> CGPoint {
        
        CGPoint(
            x: manModel.width * 0.5  - lengthFromKneeToCenter(manModel: manModel).left - manModel.legRadius * 0.5,
            y: centerGroin(manModel: manModel).y + cos(manModel.legLeftAngle * Double.pi / 180) * manModel.lengthKnee)
    }
    
    private func centerArcLeftLeg(manModel: ModelMan) -> CGPoint {
        
        let xKnee = centerArcLeftKnee(manModel: manModel).x
        let yKnee = centerArcLeftKnee(manModel: manModel).y
        let length = manModel.lengthLeg - manModel.lengthKnee
        let deltaX = sin(manModel.kneeLeftAngle * Double.pi / 180) * length
        let deltaY = cos(manModel.kneeLeftAngle * Double.pi / 180) * length
        
        return CGPoint(x: xKnee + deltaX, y: yKnee + deltaY)
    }
    
    private func centerArcRightKnee(manModel: ModelMan) -> CGPoint {
        CGPoint(
            x: manModel.width * 0.5  + lengthFromKneeToCenter(manModel: manModel).right + manModel.legRadius * 0.5,
            y: centerGroin(manModel: manModel).y + cos(manModel.legRightAngle * Double.pi / 180) * manModel.lengthKnee)
    }
    
    private func centerArcRightLeg(manModel: ModelMan) -> CGPoint {
        
        let xKnee = centerArcRightKnee(manModel: manModel).x
        let yKnee = centerArcRightKnee(manModel: manModel).y
        let length = manModel.lengthLeg - manModel.lengthKnee
        let deltaX = sin(manModel.kneeRightAngle * Double.pi / 180) * length
        let deltaY = cos(manModel.kneeRightAngle * Double.pi / 180) * length
        
        return CGPoint(x: xKnee - deltaX, y: yKnee + deltaY)
    }
    
    private func lengthFromLegToCenter(manModel: ModelMan) -> (left: Double, right: Double) {
        
        let left = sin(manModel.legLeftAngle * Double.pi / 180) * manModel.lengthLeg
        let right = sin(manModel.legRightAngle * Double.pi / 180) * manModel.lengthLeg
        
        return (left, right)
        
    }
    
    private func lengthFromKneeToCenter(manModel: ModelMan) -> (left: Double, right: Double) {
        
        let left = sin(manModel.legLeftAngle * Double.pi / 180) * manModel.lengthKnee
        let right = sin(manModel.legRightAngle * Double.pi / 180) * manModel.lengthKnee
        
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
