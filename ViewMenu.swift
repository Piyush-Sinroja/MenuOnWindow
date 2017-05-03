//
//  ViewMenu.swift
//  MenuOnWindow
//
//  Created by piyush sinroja on 28/04/17.
//  Copyright © 2017 Piyush. All rights reserved.
//
import UIKit

class ViewMenu: UIView {
    @IBOutlet weak var tblMenu: UITableView!
    var cellobj : SimpleCell = SimpleCell()
    
    let arrMenuItem = ["Home", "FirstView", "SecondView", "ThirdView", "FourthView", "FifthView"]
    
    let appdel = UIApplication.shared.delegate as! Appdelegate
    
    @IBOutlet weak var viewTbl: UIView!
    
    public func registerMethod()  {
        // For registering classes
        tblMenu.register(UINib(nibName: "SimpleCell", bundle: nil), forCellReuseIdentifier: "SimpleCell")
    }
}
extension ViewMenu: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didselect",indexPath.row)
        
        let menuObj : MenuOnWindow = MenuOnWindow()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:
            let viewContr = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            menuObj.push_POP_to_ViewController(destinationVC: viewContr, isAnimated: true)
        case 1:
            let ftviewobj = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
            menuObj.push_POP_to_ViewController(destinationVC: ftviewobj, isAnimated: true)
        case 2:
            let sdviewobj = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            menuObj.push_POP_to_ViewController(destinationVC: sdviewobj, isAnimated: true)
        case 3:
            let tdviewobj = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            menuObj.push_POP_to_ViewController(destinationVC: tdviewobj, isAnimated: true)
        case 4:
            let fourthviewobj = storyboard.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
            menuObj.push_POP_to_ViewController(destinationVC: fourthviewobj, isAnimated: true)
        case 5:
            let fifthviewobj = storyboard.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
            menuObj.push_POP_to_ViewController(destinationVC: fifthviewobj, isAnimated: true)
        default:
            print("Default")
        }
    }
}

extension ViewMenu: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenuItem.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            cellobj = tblMenu.dequeueReusableCell(withIdentifier: "SimpleCell") as! SimpleCell!
            cellobj.lblName.text = arrMenuItem[indexPath.row] as String
        return cellobj
    }
}
