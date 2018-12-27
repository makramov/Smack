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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //variables
    let avatarColor = "[0.5, 05, 05, 1]"
    var avatarName = "profileDefault"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUp()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if UserDataService.instanse.avatarName != "" {
            profileIconimg.image = UIImage(named: UserDataService.instanse.avatarName)
            avatarName = UserDataService.instanse.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                
                profileIconimg.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    
    //MARK: create account button
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else {return}
        guard let name = userNameTxt.text, userNameTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                print("Successfully created user.")
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                           
                            self.activityIndicator.isHidden = true
                            self.activityIndicator.stopAnimating()
                            self.performSegue(withIdentifier: GOTOCHANNEL_VC, sender: nil)
                            NotificationCenter.default.post(name: NOTIF_USER_DID_CHANGE, object: nil)
                        })
                    }
                })
            }
        }
    }
    
    //MARK: generate BackgroungColor Button Pressed
    @IBAction func generateBackgroungColorButtonPressed(_ sender: UIButton) {
        
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
      
        UIView.animate(withDuration: 0.5) {
        self.profileIconimg.backgroundColor = self.bgColor
        }
        
    }
    
    //MARK: Choose Avatar button pressed
    @IBAction func chooseAvatarButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: GOTOAVATAR_VC, sender: nil)
    }
    //MARK: Close button
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: GOTOCHANNEL_VC, sender: self)
    }
    
    
    func setUp() {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.stopEditing))
        view.addGestureRecognizer(gesture)
        activityIndicator.isHidden = true
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])

    }
    
    @objc func stopEditing() {
        
        view.endEditing(true)
    }
    
}
