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
    
    let boardGateway: BoardGateway
    
    init(boardGateway: BoardGateway) {
        self.boardGateway = boardGateway
    }
    
    func getBoards(completionHandler: @escaping GetBoardsUseCaseCompletionHandler) {
        boardGateway.getBoards { (result) in
            completionHandler(result)
        }
    }
    
}
