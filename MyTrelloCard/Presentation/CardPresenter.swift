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
    
    init(view: CardView) {
        self.view = view
    }
    
    func getBoards () {
        
    }
}
