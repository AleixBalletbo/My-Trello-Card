//
//  APIBoard.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 24/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

struct ApiBoard: InitializableWithData, InitializableWithJson {
    var id: String
    var name: String
    
    init (data: Data?) throws {
        guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data),
                let json = jsonObject as? [String: Any] else {
                    throw NSError.createParseError()
        }
        
        try self.init(json: json)
    }
    
    init (json: [String: Any]) throws {
        guard let id = json["id"] as? String,
                let name = json["name"] as? String else {
                    throw NSError.createParseError()
        }
        
        self.id = id
        self.name = name
    }
}

extension ApiBoard {
    var board: Board {
        return Board(id: id, name: name)
    }
}
