//
//  CreateAccountVC.swift
//  Smeck
//
//  Created by Mansur Akramov on 12/18/18.
//  Copyright © 2018 Mansur Akramov. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

//outlets
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var profileIconimg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    //MARK: create account button
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                print("Successfully created user.")
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    
                    if success {
                       print("Logged in")
                       print(AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
    //MARK: generate BackgroungColor Button Pressed
    @IBAction func generateBackgroungColorButtonPressed(_ sender: UIButton) {
    }
    
    //MARK: Choose Avatar button pressed
    @IBAction func chooseAvatarButtonPressed(_ sender: UIButton) {
    }
    //MARK: Close button
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: gotoChannel, sender: self)
    }
    

}
