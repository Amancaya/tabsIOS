//
//  ThirdViewController.swift
//  tabsIOS
//
//  Created by kaya on 27/9/18.
//  Copyright © 2018 kaya. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var families : [String] = []
    
    var fonts : [String: [String]] = [:]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ordenando alfabeticamente
        families = UIFont.familyNames.sorted(by: {$0 < $1})
        for fam in families {
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFontsForFamily" {
            let navController = segue.destination as! UINavigationController
            let destinationVC = navController.topViewController as! FontFamillyController
            let idx = self.tableView.indexPathForSelectedRow!.row
            destinationVC.familyName = self.families[idx]
            destinationVC.fonts = self.fonts[self.families[idx]]!
        }
    }
 
    
    //MARK: - Metodos del protocolo UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.families.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for: indexPath)
        cell.textLabel?.text = families[indexPath.row]
        cell.textLabel?.font = UIFont(name: families[indexPath.row], size: 20.0)
        
        return cell
    }

}
