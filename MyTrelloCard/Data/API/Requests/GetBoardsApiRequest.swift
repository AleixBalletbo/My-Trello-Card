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
        let url = URLWithKeyAndToken.makeURL(string: "https://api.trello.com/1/members/me/boards")
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "GET"
        
        return request
    }
}
