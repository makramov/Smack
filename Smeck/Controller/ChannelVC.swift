//
//  ChannelVC.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/18/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //outlets here
    @IBOutlet weak var loginBTN: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.width - 50
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: LOGIN_VC, sender: self)
    }
    
    
}
