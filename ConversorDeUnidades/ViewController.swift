//
//  ViewController.swift
//  ConversorDeUnidades
//
//  Created by Pedro Pigatti on 16/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Quilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dólar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("Quilômetros", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheit", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
    
        switch lbUnit.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
        view.endEditing(true)
        let result = Double(lbResult.text!)!
        lbResult.text = String(format: "%.2f", result)
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else {return}
            if btUnit1.alpha == 1 {
                lbResultUnit.text = "Farenheit"
                lbResult.text = String(temperature * 1.8 + 32.0)
            }else{
                lbResultUnit.text = "Celsius"
                lbResult.text = String((temperature - 32.0) / 1.8)
            }
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else {return}
            if btUnit1.alpha == 1 {
                lbResultUnit.text = "Libras"
                lbResult.text = String(weight * 2.205)
            }else{
                lbResultUnit.text = "Quilogramas"
                lbResult.text = String(weight / 2.205)
            }
        
    }
    
    func calcCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
            if btUnit1.alpha == 1 {
                lbResultUnit.text = "Dólares"
                lbResult.text = String(currency / 5.4)
            }else{
                lbResultUnit.text = "Reais"
                lbResult.text = String(currency * 5.4)
            }
        
    }
    
    func calcDistance(){
        guard let distance = Double(tfValue.text!) else {return}
            if btUnit1.alpha == 1 {
                lbResultUnit.text = "Quilômetros"
                lbResult.text = String(distance / 1000)
            }else{
                lbResultUnit.text = "Metros"
                lbResult.text = String(distance * 1000)
            }
        
    }
}

