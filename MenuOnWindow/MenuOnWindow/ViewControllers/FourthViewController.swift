//
//  FourthViewController.swift
//  MenuOnWindow
//
//  Created by piyush sinroja on 01/05/17.
//  Copyright © 2017 Piyush. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    let appdel = UIApplication.shared.delegate as! Appdelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Fourth View"
         self.navigationItem.setHidesBackButton(true, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        print("Fourth View",appdel.navController.viewControllers)
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
