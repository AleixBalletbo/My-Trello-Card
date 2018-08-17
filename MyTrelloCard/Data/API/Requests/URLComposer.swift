//
//  URLWithKeyAndToken.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 27/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

class URLComposer {
    
    var url: URLComponents
    
    init (string: String) {
        var urlComponents: URLComponents! = URLComponents(string: string)
        
        let secret = Secret()
        let key = secret.key
        let token = secret.token
        
        let queryItems = [URLQueryItem(name: "key", value: key), URLQueryItem(name: "token", value: token)]
        urlComponents.queryItems = queryItems
        url = urlComponents
    }
    
    func addQueryParam (name: String, value: String) {
        let queryItem = URLQueryItem(name: name, value: value)
        url.queryItems?.append(queryItem)
    }
    
    func getUrl () -> URL{
        return url.url!
    }
}
