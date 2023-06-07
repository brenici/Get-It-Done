//
//  HeaderShape.swift
//  GetItDone
//
//  Created by Emilian Brenici on 07/06/2023.
//

import SwiftUI

struct HeaderShape: Shape {
    
    /// Ratio between left and right side of the trapezoid
    ///
    /// - `sidesRatio` value 7 / 10 (or 0.7) draws a right trapezoid with a cut on the bottom left side
    /// - `sidesRatio` value 10 / 7 (or 1.43) draws a right trapezoid with the same cut on the bottom right side
    ///
    var sidesRatio: CGFloat
    
    /// Ratio between shape height and height from the curved bottom side
    var curveRatio: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        
        let leftSide: CGFloat = min(abs(height * sidesRatio), height)
        let rightSide: CGFloat = min(abs(height / sidesRatio), height)
        
        let topLeftPoint = CGPoint.zero
        let topRightPoint = CGPoint(x: width, y: 0)
        let bottomRightPoint = CGPoint(x: width, y: leftSide)
        let bottomLeftPoint = CGPoint(x: 0, y: rightSide)
        let controlPoint = CGPoint(
            x: abs(rect.midX * sidesRatio),
            y: min(height, abs(height * curveRatio)) - (abs(rightSide - leftSide) / 2)
        )
        
        var path = Path()
        path.move(to: bottomLeftPoint)
        path.addLine(to: topLeftPoint)
        path.addLine(to: topRightPoint)
        path.addLine(to: bottomRightPoint)
        path.addQuadCurve(to: bottomLeftPoint, control: controlPoint)
        path.closeSubpath()
        
        print("control point: \(controlPoint)")
        
        return path
        
    }
    
}
