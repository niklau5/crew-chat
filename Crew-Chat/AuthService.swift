//
//  AuthService.swift
//  Crew-Chat
//
//  Created by Nikolai Brix Laursen on 17/03/2017.
//  Copyright © 2017 CrewNET IVS. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completion = (_ errMsg: String?, _ data: Any?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    
    func login(email: String, password: String, OnCompletion: Completion?) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: (error?._code)!) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: OnCompletion)
                            } else {
                                if user?.uid != nil {
                                    
                                    DataService.instance.saveUser(uid: user!.uid)
                                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            self.handleFirebaseError(error: error! as NSError, onComplete: OnCompletion)
                                        } else {
                                            OnCompletion?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                        
                    }
                } else {
                    self.handleFirebaseError(error: error! as NSError, onComplete: OnCompletion)
                }
            } else {
                OnCompletion?(nil, user)
            }
        })
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completion?) {
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            switch (errorCode) {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email addresss", nil)
                break
            case .errorCodeWrongPassword:
                onComplete?("invalid password", nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Email already in use", nil)
                break
            default:
                onComplete?("There was a problem, try again.", nil)
            }
        }
    }
    
    
    
    
}
