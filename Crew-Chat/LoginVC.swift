//
//  LoginVC.swift
//  Crew-Chat
//
//  Created by Nikolai Brix Laursen on 17/03/2017.
//  Copyright © 2017 CrewNET IVS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginPressed(_ sender: Any) {
        if let email = emailField.text, let pass = passwordField.text , (email.characters.count > 0 && pass.characters.count > 0) {
            
              AuthService.instance.login(email: email, password: pass, OnCompletion: { (errMsg, data) in
                guard errMsg == nil else {
                    let alert = UIAlertController(title: "Error auth", message: errMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
                
              })
        
        
        } else {
            let alert = UIAlertController(title: "Username and password required", message: "you must enter both a username and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

}
