//
//  GetLists.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 28/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

typealias GetListsUseCaseCompletionHandler = (_ lists: Result<[List]>) -> Void

protocol GetListsUseCase {
    func getLists(boardId: String, completionHandler: @escaping GetListsUseCaseCompletionHandler)
}

class GetListsUseCaseImplementation: GetListsUseCase {
    
    let listsGateway: ListsGateway
    
    init(listsGateway: ListsGateway) {
        self.listsGateway = listsGateway
    }
    
    func getLists(boardId: String, completionHandler: @escaping GetListsUseCaseCompletionHandler) {
        listsGateway.getLists (boardId: boardId) { (result) in
            completionHandler(result)
        }
    }
    
}
