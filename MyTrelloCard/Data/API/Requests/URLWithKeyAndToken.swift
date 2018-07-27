//
//  URLWithKeyAndToken.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 27/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

class URLWithKeyAndToken {
    static func makeURL (string: String) -> URL {
        var urlComponents: URLComponents! = URLComponents(string: string)
        
        let secrets = getSecrets()
        
        let queryItems = [URLQueryItem(name: "key", value: secrets["key"] as? String), URLQueryItem(name: "token", value: secrets["token"] as? String)]
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
    
    private static func getSecrets () -> NSDictionary {
        var keys: NSDictionary?
        if let path = Bundle.main.path(forResource: "Secret", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        return keys!
    }
}
