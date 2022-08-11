//
//  ContentView.swift
//  YogaMan
//
//  Created by Павел on 26.07.2022.
//

import SwiftUI

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
        withAnimation(.easeOut(duration: 1), {
            manModel.stay(in: currentPosition)
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
