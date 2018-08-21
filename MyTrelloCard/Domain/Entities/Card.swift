//
//  Card.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 29/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

struct Card {
    var id: String
    var name: String?
    var description: String?
    var due: Date?
    var checkItems: Int
    var checkItemsChecked: Int
    var labelsColors: [String]
}
