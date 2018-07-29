//
//  GetBoards.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 22/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

typealias GetBoardsUseCaseCompletionHandler = (_ boards: Result<[Board]>) -> Void

protocol GetBoardsUseCase {
    func getBoards(completionHandler: @escaping GetBoardsUseCaseCompletionHandler)
}

class GetBoardsUseCaseImplementation: GetBoardsUseCase {
    
    let boardsGateway: BoardsGateway
    
    init(boardsGateway: BoardsGateway) {
        self.boardsGateway = boardsGateway
    }
    
    func getBoards(completionHandler: @escaping GetBoardsUseCaseCompletionHandler) {
        boardsGateway.getBoards { (result) in
            completionHandler(result)
        }
    }
    
}
