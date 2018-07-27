//
//  CardConfigurator.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 16/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

protocol CardConfigurator {
    func configure(cardViewController: CardViewController)
}

class CardConfiguratorImplementation: CardConfigurator {
    func configure(cardViewController: CardViewController) {
        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default, completionHandlerQueue: OperationQueue.main)
        let apiBoardsGateway = ApiBoardGatewayImplementation(apiClient: apiClient)
        let getBoardsUseCase = GetBoardsUseCaseImplementation(boardGateway: apiBoardsGateway)
        let presenter = CardPresenterImplementation(view: cardViewController, getBoardsUseCase: getBoardsUseCase)
        cardViewController.presenter = presenter
    }
}
