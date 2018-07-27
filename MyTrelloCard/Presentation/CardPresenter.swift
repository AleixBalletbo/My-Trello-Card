//
//  CardPresenter.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 15/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

protocol CardPresenter {
    func getBoards()
}

class CardPresenterImplementation: CardPresenter {
    fileprivate weak var view: CardView?
    fileprivate let getBoardsUseCase: GetBoardsUseCase
    
    init(view: CardView, getBoardsUseCase: GetBoardsUseCase) {
        self.view = view
        self.getBoardsUseCase = getBoardsUseCase
    }
    
    func getBoards () {
        getBoardsUseCase.getBoards { (result) in
            switch result {
            case let .success(boards):
                self.view?.displayTitle(title: boards[0].name)
            case let .failure(error):
                print(error)
            }
        }
        
    }
}
