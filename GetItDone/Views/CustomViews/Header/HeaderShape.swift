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
    var sidesRatio: CGFloat
    
    /// Control point ratio that determines the position of the curve control point. It gets values between 0 and 1 and is positioned in the imaginary bottom rectangle formed by the cut. The values are calculated in ratio to width and height of the bottom rectangle.
    var controlPointRatio: (x: CGFloat, y: CGFloat)
    
    func path(in rect: CGRect) -> Path {
        
        let leftSideHeight = min(abs(rect.height * sidesRatio), rect.height)
        let rightSideHeight = min(abs(rect.height / sidesRatio), rect.height)
        
        let topLeftPoint = CGPoint.zero
        let topRightPoint = CGPoint(x: rect.width, y: 0)
        let bottomRightPoint = CGPoint(x: rect.width, y: leftSideHeight)
        let bottomLeftPoint = CGPoint(x: 0, y: rightSideHeight)
        
        let cutHeight = abs(leftSideHeight - rightSideHeight)
        let topInset = min(leftSideHeight, rightSideHeight)
        
        let controlPoint = CGPoint(
            x: abs(rect.width * controlPointRatio.x),
            y: topInset + abs(cutHeight * controlPointRatio.y)
        )
        
        var path = Path()
        path.move(to: bottomLeftPoint)
        path.addLine(to: topLeftPoint)
        path.addLine(to: topRightPoint)
        path.addLine(to: bottomRightPoint)
        path.addQuadCurve(to: bottomLeftPoint, control: controlPoint)
        path.closeSubpath()

        return path
        
    }
    
}
