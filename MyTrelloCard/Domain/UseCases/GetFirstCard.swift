//
//  GetFirstCard.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 29/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

typealias GetFirstCardUseCaseCompletionHandler = (_ card: Result<Card?>) -> Void

protocol GetFirstCardUseCase {
    func getFirstCard(listId: String, completionHandler: @escaping GetFirstCardUseCaseCompletionHandler)
}

class GetFirstCardUseCaseImplementation: GetFirstCardUseCase {
    
    let cardGateway: CardGateway
    
    init(cardGateway: CardGateway) {
        self.cardGateway = cardGateway
    }
    
    func getFirstCard(listId: String, completionHandler: @escaping GetFirstCardUseCaseCompletionHandler) {
        cardGateway.getFirstCard (listId: listId) { (result) in
            completionHandler(result)
        }
    }
    
}
