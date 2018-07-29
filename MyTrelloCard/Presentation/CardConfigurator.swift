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
        
        let apiBoardsGateway = ApiBoardsGatewayImplementation(apiClient: apiClient)
        let apiListsGateway = ApiListsGatewayImplementation(apiClient: apiClient)
        
        let getBoardsUseCase = GetBoardsUseCaseImplementation(boardsGateway: apiBoardsGateway)
        let getListsUseCase = GetListsUseCaseImplementation(listsGateway: apiListsGateway)
        
        let presenter = CardPresenterImplementation(view: cardViewController, getBoardsUseCase: getBoardsUseCase, getListsUseCase: getListsUseCase)
        cardViewController.presenter = presenter
    }
}
