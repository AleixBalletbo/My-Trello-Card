//
//  BoardGateway.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 23/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

typealias GetBoardsEntityGatewayCompletionHandler = (_ boards: Result<[Board]>) -> Void

protocol BoardGateway {
    func getBoards(completionHandler: @escaping GetBoardsEntityGatewayCompletionHandler)
}
