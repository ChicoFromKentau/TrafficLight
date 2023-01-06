//
//  ViewController.swift
//  TrafficLight
//
//  Created by Chingiz Alimov on 05.01.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!

    @IBOutlet var button: UIButton!
    
    private var currentLight = CurrentLight.red // задали первоначальную позицию
    
// для читаемости кода можно создать две приватные переменные
//    private var lightIsOn: CGFloat = 1
//    private var lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // скругляем углы кнопки
        button.layer.cornerRadius = 11
        
        // выключаем все три лампы
        redLightView.alpha = 0.3 // или же = lightIsOff
        yellowLightView.alpha = 0.3 // или же = lightIsOff
        greenLightView.alpha = 0.3 // или же = lightIsOff
        
    }
    
    override func viewWillLayoutSubviews() {
        // скругляем углы динамических вьюшек
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.bounds.width / 2
    }

    @IBAction func buttonDidTap() {
        // заменяем текст кнопки при нажатии
        if button.currentTitle == "НАЧАТЬ" {
            button.setTitle("ПЕРЕКЛЮЧИТЬ", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redLightView.alpha = 1 // или же = lightIsOn
            greenLightView.alpha = 0.3 // или же = lightIsOff
            currentLight = .yellow
        case .yellow:
            yellowLightView.alpha = 1
            redLightView.alpha = 0.3
            currentLight = .green
        case .green:
            greenLightView.alpha = 1
            yellowLightView.alpha = 0.3
            currentLight = .red
        }
        
        // способ через оператор if
        //  if redLight.alpha == 1 {
        //      redLight.alpha = lightIsOff
        //      yellowLight.alpha = lightIsOn
        //  } else if yellowLight.alpha == 1 {
        //      yellowLight.alpha = lightIsOff
        //      greenLight.alpha = lightIsOn
        //  } else if greenLight.alpha == 1 {
        //      greenLight.alpha = lightIsOff
        //      redLight.alpha = lightIsOn
        //  } else {
        //      redLight.alpha = lightIsOn
        //  }
    }
}

// MARK: CurrentLight
extension ViewController {
    enum CurrentLight {
        case red, yellow, green
    }
}
