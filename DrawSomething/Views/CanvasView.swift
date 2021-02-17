//
//  CanvasView.swift
//  DrawSomething
//
//  Created by Cagri Tugberk MASAT on 10.01.2021.
//

import Foundation
import UIKit

class CanvasView: UIView {

    fileprivate var strokeColor = UIColor.yellow
    fileprivate var strokeWidth: Float = 1

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else { return }

        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)

            for (i,p) in line.points.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }

    }

    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }

    func clear() {
        lines.removeAll()
        setNeedsDisplay()
    }

    func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }

    func setStrokeWidth(width: Float) {
        self.strokeWidth = width
    }

    var line = [CGPoint]()
    var lines = [Line]()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(strokeWidth: strokeWidth, color: strokeColor, points: []))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        guard var lastLine = lines.popLast() else { return }

        lastLine.points.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
}
