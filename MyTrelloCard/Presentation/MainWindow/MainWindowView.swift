//
//  CardView.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 22/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

protocol MainWindowView: class {
    func loadBoards(boards: [Board])
    func loadLists(lists: [List])
    func loadCard(card: Card?)
}
