//
//  GetListsApiRequest.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 28/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

struct GetListsApiRequest: ApiRequest {
    
    var boardId: String
    
    init(boardId: String) {
        self.boardId = boardId
    }
    
    var urlRequest: URLRequest {
        let urlComposer = URLComposer(string: "https://api.trello.com/1/boards/" + boardId + "/lists")
        urlComposer.addQueryParam(name: "filter", value: "open")
        urlComposer.addQueryParam(name: "fields", value: "id,name")
        
        var request = URLRequest(url: urlComposer.getUrl())
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        return request
    }
}
