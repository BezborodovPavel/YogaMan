//
//  Man.swift
//  YogaMan
//
//  Created by Павел on 26.07.2022.
//

import SwiftUI

struct Man: View {
    var body: some View {
        GeometryReader {geometry in
            let width = min(geometry.size.width, geometry.size.height) * 0.4
            let height = min(geometry.size.width, geometry.size.height)
            let headRadius = 0.2
            let neck = 10.0
            let heightBody = height * 0.2
            let lengthArm = width * 0.4
            let armRadiusFinish = height * 0.02
            let armWidthStart = armRadiusFinish * 2.5
            let widthBody = width * 0.3
            let waist = widthBody * 0.8
            let heightTorso = width * 0.3
            let lengthLeg = height * 0.3
            let lengthFromLegToLeg = width * 0.4
            let legRadiusFinish = height * 0.06
            let legWidthStart = armRadiusFinish * 2.5
            
            Circle().scaleEffect(headRadius)
                .position(x: width * 0.5, y: heightBody - neck - headRadius * min(width, height) * 0.5)
            Path { path in
                path.move(to: CGPoint(
                    x: width * 0.5,
                    y: heightBody))
                path.addArc(center: CGPoint(
                    x: width * 0.5 - lengthArm,
                    y: heightBody + armRadiusFinish), radius: armRadiusFinish, startAngle: .degrees(270), endAngle: .degrees(90), clockwise: true)
                path.addLine(to: CGPoint(
                    x: width * 0.5 - widthBody * 0.5,
                    y: heightBody + armWidthStart))
                path.addLine(to: CGPoint(
                    x: width * 0.5 - waist * 0.5,
                    y: heightBody + armWidthStart + heightTorso))
                
//                path.addLine(to: CGPoint(
//                    x: width * 0.5 - legRadiusFinish * 0.5 - lengthFromLegToLeg * 0.5,
//                    y: heightBody + armWidthStart + heightTorso + lengthLeg))
                
                path.addArc(center: CGPoint(
                    x: width * 0.5  - lengthFromLegToLeg * 0.5,
                    y: heightBody + armWidthStart + heightTorso + lengthLeg ), radius: legRadiusFinish * 0.5, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: true)
                path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.5))
                path.addArc(center: CGPoint(
                    x: width * 0.5  + lengthFromLegToLeg * 0.5,
                    y: heightBody + armWidthStart + heightTorso + lengthLeg ), radius: legRadiusFinish * 0.5, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: true)
                path.addLine(to: CGPoint(x: width * 0.5 + waist * 0.5, y: heightBody + armWidthStart + heightTorso))
                path.addLine(to: CGPoint(
                    x: width * 0.5 + widthBody * 0.5,
                    y: heightBody + armWidthStart))
                path.addArc(center: CGPoint(
                    x: width * 0.5 + lengthArm,
                    y: heightBody + armRadiusFinish), radius: armRadiusFinish, startAngle: .degrees(90), endAngle: .degrees(270), clockwise: true)
                
                
//                path.addLine(to: CGPoint(x: width * 0.5 - lengthFromLegToLeg * 0.5, y: heightBody + armWidthStart + heightTorso + 200))

                
            }
        }
        .padding()
    }
}

struct Man_Previews: PreviewProvider {
    static var previews: some View {
        Man()
            .frame(width: 400, height: 400)
    }
}
