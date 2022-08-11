//
//  ModelMan.swift
//  YogaMan
//
//  Created by Павел on 03.08.2022.
//


import Combine

class ModelMan: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ModelMan, Never>()
    
    var sizeWidth = 200.0
    var sizeHeight = 200.0
    
    var legLeftAngle: Double = 5
    var legRightAngle: Double = 5
    
    var kneeLeftAngle: Double = 0
    var kneeRightAngle: Double = 0
    
    var height: Double {
        min(minimalDimension / 0.6, sizeHeight * 1.3)
    }
    var width: Double {
        height * 0.4
    }    
    var offset: Double  {
        print(sizeWidth)
        print(width)
        return (sizeWidth - width) * 0.5
    }
    var headRadius: Double {
        width * 0.3
    }
     var heightBody: Double {
        height * 0.2
    }
     var neck: Double {
        heightBody * 0.1
    }
     var lengthArm: Double {
        width * 0.4
    }
     var armRadiusFinish: Double {
        height * 0.02
    }
     var armWidthStart: Double {
        armRadiusFinish * 2.5
    }
     var widthBody: Double {
        width * 0.3
    }
     var waist: Double {
        widthBody * 0.8
    }
     var heightTorso: Double {
        width * 0.3
    }
     var lengthLeg: Double {
        height * 0.2
    }
 
     var legRadius: Double {
        height * 0.06
    }
     var legWidthStart: Double {
        armRadiusFinish * 2.5
    }
    
     var lengthKnee: Double {
        lengthLeg * 0.5
    }
    
    private var minimalDimension: Double {
        min(sizeWidth, sizeHeight)
    }
    
    func setSize(width: Double, height: Double) -> ModelMan {
        
        sizeWidth = width
        sizeHeight = height
        return self
        
    }
    
    func stay(in position: Position) {
        let positionSettings = position.getPositionSettings()
        
        legLeftAngle = positionSettings.legLeftAngle
        legRightAngle = positionSettings.legRightAngle
        kneeLeftAngle = positionSettings.kneeLeftAngle
        kneeRightAngle = positionSettings.kneeRightAngle
        
        objectWillChange.send(self)
    }
    
}
