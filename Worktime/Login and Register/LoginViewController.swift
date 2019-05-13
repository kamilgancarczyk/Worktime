//
//  ViewController.swift
//  Worktime
//
//  Created by Kamil Gancarczyk on 11/04/2019.
//  Copyright © 2019 Kamil Gancarczyk. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: CustomTextField!
    
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToHomePage"{
//            let tabBarPageVC = segue.destination as! TabBarViewController
            let tabCtrl: UITabBarController = segue.destination as! UITabBarController
            let homePageVC = tabCtrl.viewControllers![0] as! HomePageViewController
            homePageVC.email = emailTextField.text!
        }
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            
            if error != nil{
                print(error!)
            } else {
                print("Login successed")
                //self.emailTextField.text = ""
                self.passwordTextField.text = ""
                self.performSegue(withIdentifier: "goToHomePage", sender: self)
            }
            
        }
        
    }
    
    
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
    }
    
    
}

