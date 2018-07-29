//
//  GetCardsRequest.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 29/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

struct GetCardsApiRequest: ApiRequest {
    
    var listId: String
    
    init(listId: String) {
        self.listId = listId
    }
    
    var urlRequest: URLRequest {
        let url = URLWithKeyAndToken.makeURL(string: "https://api.trello.com/1/lists/" + listId + "/cards")
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "GET"
        
        return request
    }
}
