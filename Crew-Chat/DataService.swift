//
//  DataService.swift
//  Crew-Chat
//
//  Created by Nikolai Brix Laursen on 17/03/2017.
//  Copyright © 2017 CrewNET IVS. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child("users")
    }
    
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: "gs://crewchat-895a7.appspot.com/")
    }
    
    var imagesStorageRef: FIRStorageReference {
        return mainStorageRef.child("images")
    }
    
    var videoStorageREf: FIRStorageReference {
        return mainStorageRef.child("videos")
    }
    
    
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, Any> = ["firstName": "", "lastName": ""]
            mainRef.child("users").child(uid).child("profile").setValue(profile)
    }
    
    
    func sendMediaPullRequest(senderUID: String, sendingTo: Dictionary<String, User>, mediaURl: URL, textSnippet: String? = nil) {
        
        var uids = [String]()
        for uid in sendingTo.keys {
            uids.append(uid)
        }
        
        
        var pr: Dictionary<String, Any> = ["mediaUrl":mediaURl.absoluteString, "userID":senderUID, "openCount": 0, "recipients": uids]
        
        mainRef.child("pullRequests").childByAutoId().setValue(pr)
    }
    
    
    
    
    
}
