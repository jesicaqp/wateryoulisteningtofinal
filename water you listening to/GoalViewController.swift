//
//  GoalViewController.swift
//  water you listening to
//
//  Created by Jesica Quinones on 12/12/18.
//  Copyright © 2018 Jesica Quinones. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController {
   
    var val = 0
    
    @IBAction func done(_ sender: Any) {
        val = Int((sender as AnyObject).text!)!
        defaults.setValue(val, forKey: "goal")
     
    }
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
