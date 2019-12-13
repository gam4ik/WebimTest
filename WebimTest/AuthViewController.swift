//
//  AuthViewController.swift
//  WebimTest
//
//  Created by Gamid on 13.12.2019.
//  Copyright © 2019 Gam4ik. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authService = AppDelegate.shared().authService
    }
    
    @IBAction func signInTouch() {
           authService.wakeUpSession()
       }

}
