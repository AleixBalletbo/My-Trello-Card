//
//  GetBoardsRequest.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 24/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

struct GetBoardsApiRequest: ApiRequest {
    var urlRequest: URLRequest {
        let urlComposer = URLComposer(string: "https://api.trello.com/1/members/me/boards")
        urlComposer.addQueryParam(name: "filter", value: "open")
        urlComposer.addQueryParam(name: "fields", value: "id,name")
        urlComposer.addQueryParam(name: "lists", value: "none")
        urlComposer.addQueryParam(name: "membership", value: "none")
        
        var request = URLRequest(url: urlComposer.getUrl())
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        return request
    }
}
