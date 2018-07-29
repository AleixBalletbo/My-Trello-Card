//
//  CardGateway.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 29/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

typealias GetFirstCardEntityGatewayCompletionHandler = (_ card: Result<Card?>) -> Void

protocol CardGateway {
    func getFirstCard(listId: String, completionHandler: @escaping GetFirstCardEntityGatewayCompletionHandler)
}
