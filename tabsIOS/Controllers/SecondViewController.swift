//
//  SecondViewController.swift
//  tabsIOS
//
//  Created by kaya on 27/9/18.
//  Copyright © 2018 kaya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var stepperFibonacci: UIStepper!
    
    @IBOutlet weak var labelFibonacci: UILabel!
    
    @IBOutlet weak var textViewFibonacci: UITextView!
    
    @IBOutlet weak var switchGoldenNumber: UISwitch!
    
    @IBOutlet weak var labelGoldenNumber: UILabel!
    
    var isShowGoldenNumber = false
    
    var fiboId : Int = 2;
    
    var fibonacci : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateLabel(id: Int(self.stepperFibonacci.value))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        self.isShowGoldenNumber = switchGoldenNumber.isOn
        self.showGoldenNumber()
    }
    
    
    @IBAction func changeValue(_ sender: UIStepper) {
        updateLabel(id: Int(sender.value))
    }
    
    private func generateFibonacci(){
        fibonacci = [0, 1]
        
        for i in 2 ... fiboId {
            fibonacci.append(fibonacci[i-1] + fibonacci[i-2])
        }
        
        let fibStrg : [String] = fibonacci.compactMap({String($0)})
        let result: String = fibStrg.joined(separator: "\n")
        self.textViewFibonacci.text = result
    }
    
    private func updateLabel(id : Int){
        self.fiboId = id
        self.labelFibonacci.text = String(id)
        self.generateFibonacci()
        self.showGoldenNumber()
    }
    
    @IBAction func changeValueSwitch(_ sender: UISwitch) {
        self.isShowGoldenNumber = sender.isOn
        showGoldenNumber()
    }
    
    private func showGoldenNumber(){
        if(isShowGoldenNumber){
            let goldenNumber = Double(fibonacci[fibonacci.count - 1]) / Double(fibonacci[fibonacci.count - 2])
            self.labelGoldenNumber.text = "\(goldenNumber)"
        }else{
            self.labelGoldenNumber.text = "Ver numero de oro"
        }
    }
    
    
}

