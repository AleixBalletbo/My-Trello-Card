//
//  Secret.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 27/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

class Secret {
    
    let key: String
    let token: String
    
    init () {
        var secrets: NSDictionary?
        if let path = Bundle.main.path(forResource: "Secret", ofType: "plist") {
            secrets = NSDictionary(contentsOfFile: path)
        }
        key = secrets!["key"] as! String
        token = secrets!["token"] as! String
    }
}
