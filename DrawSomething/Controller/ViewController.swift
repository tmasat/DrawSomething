//
//  ViewController.swift
//  DrawSomething
//
//  Created by Cagri Tugberk MASAT on 10.01.2021.
//

import UIKit

class ViewController: UIViewController {

    let canvas = CanvasView()

    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(undoButtonTapped), for: .touchUpInside)
        return button
    }()

    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()

    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colorChangeButtonTapped), for: .touchUpInside)
        return button
    }()

    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colorChangeButtonTapped), for: .touchUpInside)
        return button
    }()

    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(colorChangeButtonTapped), for: .touchUpInside)
        return button
    }()

    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        return slider
    }()


    override func loadView() {
        self.view = canvas
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        canvas.backgroundColor = .white
        setLayout()
    }

    @objc func undoButtonTapped() {
        canvas.undo()
    }

    @objc func clearButtonTapped() {
        canvas.clear()
    }

    @objc func sliderValueChanged(slider: UISlider) {
        canvas.setStrokeWidth(width: slider.value)
    }

    @objc fileprivate func colorChangeButtonTapped(button: UIButton) {
        canvas.setStrokeColor(color: button.backgroundColor ?? .yellow)

    }

    fileprivate func setLayout() {
        let colorsStackView = UIStackView(arrangedSubviews: [yellowButton, redButton, blueButton])

        colorsStackView.distribution = .fillEqually

        let stackView = UIStackView(arrangedSubviews: [
            undoButton,
            clearButton,
            colorsStackView,
            slider
        ])

        stackView.spacing = 12
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
}

