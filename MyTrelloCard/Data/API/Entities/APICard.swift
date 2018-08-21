//
//  APICard.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 29/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

struct ApiCard: InitializableWithData, InitializableWithJson {
    var id: String
    var name: String
    var description: String
    var due: String?
    var checkItems: Int
    var checkItemsChecked: Int
    var labelsColors: [String]
    
    init (data: Data?) throws {
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data),
            let json = jsonObject as? [String: Any] else {
                throw NSError.createParseError()
        }
        
        try self.init(json: json)
    }
    
    init (json: [String: Any]) throws {
        //print(json)
        guard let id = json["id"] as? String,
            let name = json["name"] as? String,
            let description = json["desc"] as? String,
            let badges = json["badges"] as? [String: Any],
            let labels = json["labels"] as? [[String: Any]] else {
                throw NSError.createParseError()
        }
        
        let due = json["due"] as? String //if due is nil, it means that there is no due date for this card
        
        guard let checkItems = badges["checkItems"] as? Int,
            let checkItemsChecked = badges["checkItemsChecked"] as? Int else {
                throw NSError.createParseError()
        }
        
        var labelsColors: [String] = []
        for label in labels {
            if let labelColor = label["color"] as? String {
                labelsColors.append(labelColor)
            }
        }
        
        self.id = id
        self.name = name
        self.description = description
        self.due = due
        self.checkItems = checkItems
        self.checkItemsChecked = checkItemsChecked
        self.labelsColors = labelsColors
    }
}

extension ApiCard {
    
    var card: Card {
        return Card(id: id, name: name, description: description, due: getDueDate(due: due), checkItems: checkItems, checkItemsChecked: checkItemsChecked, labelsColors: labelsColors)
    }
    
    private func getDueDate (due: String?) -> Date? {
        if let dueDate = due {
            let dateISOFormatter = ISO8601DateFormatter()
            dateISOFormatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
            return dateISOFormatter.date(from: dueDate)
        }
        else {
            return nil
        }
    }
}
