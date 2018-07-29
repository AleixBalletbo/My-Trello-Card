//
//  CardPresenter.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 15/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

protocol CardPresenter {
    func didLoad()
    func getLists(boardId: String)
}

class CardPresenterImplementation: CardPresenter {
    fileprivate weak var view: CardView?
    fileprivate let getBoardsUseCase: GetBoardsUseCase
    fileprivate let getListsUseCase: GetListsUseCase
    
    init(view: CardView, getBoardsUseCase: GetBoardsUseCase, getListsUseCase: GetListsUseCase) {
        self.view = view
        self.getBoardsUseCase = getBoardsUseCase
        self.getListsUseCase = getListsUseCase
    }
    
    func didLoad() {
        getBoards()
    }
    
    func getBoards () {
        getBoardsUseCase.getBoards { (result) in
            switch result {
            case let .success(boards):
                self.view?.loadBoards(boards: boards)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getLists (boardId: String) {
        getListsUseCase.getLists(boardId: boardId) { (result) in
            switch result {
            case let .success(lists):
                self.view?.loadLists(lists: lists)
            case let .failure(error):
                print(error)
            }
        }
    }
}
