//
//  ContentView.swift
//  YogaMan
//
//  Created by Павел on 26.07.2022.
//

import SwiftUI

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
    
    func getPositionSettings() -> PositionSettings {
        switch self {
        case .first:
            return PositionSettings(
                legLeftAngle: 0,
                legRightAngle: 0,
                kneeLeftAngle: 0,
                kneeRightAngle: 0)
        case .second:
            return PositionSettings(
                legLeftAngle: 45,
                legRightAngle: 0,
                kneeLeftAngle: 0,
                kneeRightAngle: 0)
        case .third:
            return PositionSettings(
                legLeftAngle: 0,
                legRightAngle: 45,
                kneeLeftAngle: 0,
                kneeRightAngle: 0)
        }        
    }
}

struct ContentView: View {
    
    @StateObject private var manModel = ModelMan()
    
    @State private var currentPosition = Position.first
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Man(manModel: manModel.setSize(width: geometry.size.width, height: geometry.size.height))
                //Смущает такой способ, но не смог найти другой для того чтобы установить в классе размеры
            }
            Button("Next position", action: buttonPress)
            Spacer()
        }
    }
    
    private func buttonPress() -> Void {
        
        if let newPosition = Position(rawValue: currentPosition.rawValue + 1) {
            currentPosition = newPosition
        } else {
            currentPosition = Position.first
        }
        withAnimation {
            manModel.stay(in: currentPosition)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
