//
//  SecondRegisterViewController.swift
//  Worktime
//
//  Created by Kamil Gancarczyk on 12/04/2019.
//  Copyright © 2019 Kamil Gancarczyk. All rights reserved.
//

import UIKit
import Firebase

class SecondRegisterViewController: UIViewController {
    
    var email : String = ""
    var password : String = ""
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        if firstnameTextField.text == "" || lastnameTextField.text == ""{
            //Empty fields
            return
        }
        else {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if error != nil {
                    
                    print(error!)
                } else {
                    
                    print("Register successed")
                    self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
                }
            }
            
        }
        
    }
    
}
