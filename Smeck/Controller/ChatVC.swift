//
//  ChatVC.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/18/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var menuBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //swRevealViewController Method here
          swRevealVC()
        
        }
    
    
    //MARK: SWrevealViewControllerMethods here
    
    func swRevealVC () {
        menuBTN.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        if let pangestureRecognizer = self.revealViewController()?.panGestureRecognizer() {
            self.view.addGestureRecognizer(pangestureRecognizer)
        }
        
        if let tapGestureRecognizer = self.revealViewController()?.tapGestureRecognizer() {
            
            self.view.addGestureRecognizer(tapGestureRecognizer)
        }
    }


}
