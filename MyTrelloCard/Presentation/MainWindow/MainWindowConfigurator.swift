//
//  CardConfigurator.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 16/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

protocol MainWindowConfigurator {
    func configure(cardViewController: MainWindowViewController)
}

class MainWindowConfiguratorImplementation: MainWindowConfigurator {
    func configure(cardViewController: MainWindowViewController) {
        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default, completionHandlerQueue: OperationQueue.main)
        
        let apiBoardsGateway = ApiBoardsGatewayImplementation(apiClient: apiClient)
        let apiListsGateway = ApiListsGatewayImplementation(apiClient: apiClient)
        let apiCardGateway = ApiCardGatewayImplementation(apiClient: apiClient)
        
        let getBoardsUseCase = GetBoardsUseCaseImplementation(boardsGateway: apiBoardsGateway)
        let getListsUseCase = GetListsUseCaseImplementation(listsGateway: apiListsGateway)
        let getFirstCardUseCase = GetFirstCardUseCaseImplementation(cardGateway: apiCardGateway)
        
        let presenter = MainWindowPresenterImplementation(view: cardViewController,
                                                    getBoardsUseCase: getBoardsUseCase,
                                                    getListsUseCase: getListsUseCase,
                                                    getFirstCardUseCase: getFirstCardUseCase)
        cardViewController.presenter = presenter
    }
}
