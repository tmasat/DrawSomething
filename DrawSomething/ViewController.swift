//
//  ViewController.swift
//  DrawSomething
//
//  Created by Cagri Tugberk MASAT on 10.01.2021.
//

import UIKit

class Canvas: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else { return }

        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 100, y: 100)
        context.move(to: startPoint)
        context.addLine(to: endPoint)
        context.strokePath()
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let canvas = Canvas()

        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
    }
}

