//
//  FirstRegisterViewController.swift
//  Worktime
//
//  Created by Kamil Gancarczyk on 12/04/2019.
//  Copyright © 2019 Kamil Gancarczyk. All rights reserved.
//

import UIKit

class FirstRegisterViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmedPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        if loginTextField.text == "" || passwordTextField.text == "" || confirmedPasswordTextField.text == "" {
            // Empty fields
            return
        }
        else{
            if passwordTextField.text == confirmedPasswordTextField.text{
                self.performSegue(withIdentifier: "goToSecondRegisterView", sender: self)
                passwordTextField.text = ""
                confirmedPasswordTextField.text = ""
                
            }
            else{
                // Different passwords
                return
            }
        }
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSecondRegisterView"{
            let secondRegisterVC = segue.destination as! SecondRegisterViewController
            
            secondRegisterVC.userName = loginTextField.text!
            secondRegisterVC.password = passwordTextField.text!
        }
    }
    
}
