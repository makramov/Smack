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
    let avatarColor = "[0.5, 05, 05, 1]"
    var avatarName = "profileDefault"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if UserDataService.instanse.avatarName != "" {
            profileIconimg.image = UIImage(named: UserDataService.instanse.avatarName)
            avatarName = UserDataService.instanse.avatarName
        }
    }
    
    
    //MARK: create account button
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else {return}
        guard let name = userNameTxt.text, userNameTxt.text != "" else {return}
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                print("Successfully created user.")
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            print(name)
                            self.performSegue(withIdentifier: GOTOCHANNEL_VC, sender: nil)
                        })
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
        performSegue(withIdentifier: GOTOAVATAR_VC, sender: nil)
    }
    //MARK: Close button
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: GOTOCHANNEL_VC, sender: self)
    }
    
    
}
