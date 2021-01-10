//
//  CanvasView.swift
//  DrawSomething
//
//  Created by Cagri Tugberk MASAT on 10.01.2021.
//

import Foundation
import UIKit

class CanvasView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else { return }

        for (i,p) in line.enumerated() {
            if i == 0 {
                context.move(to: p)
            } else {
                context.addLine(to: p)
            }
        }

        context.strokePath()
    }

    var line = [CGPoint]()

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        
        line.append(point)
        setNeedsDisplay()
    }
}
