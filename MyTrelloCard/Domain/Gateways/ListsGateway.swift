//
//  ListsGateway.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 28/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

typealias GetListsEntityGatewayCompletionHandler = (_ lists: Result<[List]>) -> Void

protocol ListsGateway {
    func getLists(boardId: String, completionHandler: @escaping GetListsEntityGatewayCompletionHandler)
}
