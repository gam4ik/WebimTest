//
//  AuthService.swift
//  WebimTest
//
//  Created by Gamid on 13.12.2019.
//  Copyright © 2019 Gam4ik. All rights reserved.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}

final class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appId = "7244950"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        let scope = ["offline"]
        
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            if state == VKAuthorizationState.authorized {
                print("VKAuthorizationState.authorized")
                delegate?.authServiceSignIn()
            } else if state == VKAuthorizationState.initialized {
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            } else {
                print("Error!")
                delegate?.authServiceDidSignInFail()
            }
        }
    }
    
    // MARK: - VKSdkDelegate
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        }
    }
       
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
       
    // MARK: - VKSdkUiDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(controller)
    }
       
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
    
}
