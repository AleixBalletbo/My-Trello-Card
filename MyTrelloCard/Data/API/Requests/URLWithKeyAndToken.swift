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
        
        let secret = Secret()
        let key = secret.key
        let token = secret.token
        
        let queryItems = [URLQueryItem(name: "key", value: key), URLQueryItem(name: "token", value: token)]
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}
