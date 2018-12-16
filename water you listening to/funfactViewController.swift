//
//  funfactViewController.swift
//  water you listening to
//
//  Created by Jesica Quinones on 12/12/18.
//  Copyright © 2018 Jesica Quinones. All rights reserved.
//

import UIKit

class funfactViewController: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(defaults.integer(forKey: "goal") == 0){
            let gals = "Set a new goal!"
        }
        let gals = defaults.integer(forKey: "goal") * 2
        label.text = "\(gals) Gallons"
        // Do any additional setup after loading the view.
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
    }
    */

}
