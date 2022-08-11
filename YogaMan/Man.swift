//
//  Man.swift
//  YogaMan
//
//  Created by Павел on 26.07.2022.
//

import SwiftUI

struct Man: View {
    
    @ObservedObject var manModel: ModelMan
    
    var body: some View {
        Group {
            Circle()
                .frame(width: manModel.headRadius, height: manModel.headRadius)
                .position(
                    x: manModel.width * 0.5,
                    y: manModel.heightBody - manModel.headRadius * 0.5 - manModel.neck)
            
            Path { path in
                path.move(to: CGPoint(
                    x: manModel.width * 0.5,
                    y: manModel.heightBody))
                path.addArc(
                    center: centerArcLeftArm(manModel: manModel),
                    radius: manModel.armRadiusFinish,
                    startAngle: .degrees(270),
                    endAngle: .degrees(90),
                    clockwise: true)
                path.addLine(to: CGPoint(
                    x: manModel.width * 0.5 - manModel.widthBody * 0.5,
                    y: manModel.heightBody + manModel.armWidthStart))
                path.addLine(to: CGPoint(
                    x: manModel.width * 0.5 - manModel.waist * 0.5,
                    y: manModel.heightBody + manModel.armWidthStart + manModel.heightTorso))
                path.addLine(to: CGPoint(
                    x: manModel.width * 0.5 + manModel.waist * 0.5,
                    y: manModel.heightBody + manModel.armWidthStart + manModel.heightTorso))
                path.addLine(to: CGPoint(
                    x: manModel.width * 0.5 + manModel.widthBody * 0.5,
                    y: manModel.heightBody + manModel.armWidthStart))
                path.addArc(
                    center: centerArcRightArm(manModel: manModel),
                    radius: manModel.armRadiusFinish,
                    startAngle: .degrees(90),
                    endAngle: .degrees(270),
                    clockwise: true)
                path.addLine(to: CGPoint(
                    x: manModel.width * 0.5,
                    y: manModel.heightBody))
            }
            lowBody(manModel: manModel, legLeftAngle: manModel.legLeftAngle, legRightAngle: manModel.legRightAngle, kneeLeftAngle: manModel.kneeLeftAngle, kneeRightAngle: manModel.kneeRightAngle)
        }
        .offset(x: manModel.offset)
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

struct Man_Previews: PreviewProvider {
    static var previews: some View {
        Man(manModel: ModelMan())
    }
}
