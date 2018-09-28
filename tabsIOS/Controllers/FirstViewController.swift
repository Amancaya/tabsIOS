//
//  FirstViewController.swift
//  tabsIOS
//
//  Created by kaya on 27/9/18.
//  Copyright © 2018 kaya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var editName: UITextField!
    
    @IBOutlet weak var txtAge: UILabel!
    
    @IBOutlet weak var slrAge: UISlider!
    
    var userAge = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateAge()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //cerrar el teclado
        textField.resignFirstResponder()
        
        if let text = self.editName.text {
            print(text)
        }
        
        return true
    }
    
    private func updateAge(){
        self.userAge = Int(self.slrAge.value)
        self.txtAge.text = String(self.userAge)
    }
    
    @IBAction func changeAge(_ sender: UISlider) {
        self.updateAge()
    }
    
    @IBAction func validateData(_ sender: UIButton) {
        if (self.editName.text == "Koda Negron") || (userAge >= 18) {
            print("Entras a la fiste")
            self.view.backgroundColor = UIColor(red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        }else {
            print("No entras a la fiste")
            self.view.backgroundColor = UIColor(red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 0.8)
        }
        
    }
    
}

