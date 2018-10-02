//
//  FontFamillyController.swift
//  tabsIOS
//
//  Created by kaya on 1/10/18.
//  Copyright © 2018 kaya. All rights reserved.
//

import UIKit

class FontFamillyController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var familyName : String = ""
    
    var fonts : [String] = []

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var pickerFonts: UIPickerView!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelTitle.text = familyName;
        self.labelTitle.font = UIFont(name: familyName, size: 22.0)
        
        if self.fonts.count == 0 {
            self.pickerFonts.isHidden = true
        }
        
        self.pickerFonts.dataSource = self
        self.pickerFonts.delegate = self
        
        self.textView.font = UIFont(name: familyName, size: 14.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
 

    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //la cantidad de columnas en el picker
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //cantidad de items
        return self.fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
    // MARK: - Seleccionar item
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textView.font = UIFont(name: fonts[row], size: 14.0)
    }
}
