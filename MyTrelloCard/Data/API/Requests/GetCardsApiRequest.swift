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
        let urlComposer = URLComposer(string: "https://api.trello.com/1/lists/" + listId + "/cards")
        urlComposer.addQueryParam(name: "fields", value: "id,name,desc,due,badges")
        
        var request = URLRequest(url: urlComposer.getUrl())
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        return request
    }
}
