//
//  ApiCardGateway.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 29/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

class ApiCardGatewayImplementation: CardGateway {
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getFirstCard(listId: String, completionHandler: @escaping GetFirstCardEntityGatewayCompletionHandler) {
        let getCardsApiRequest = GetCardsApiRequest(listId: listId)
        apiClient.execute(request: getCardsApiRequest) { (result: Result<ApiResponse<[ApiCard]>>) in
            switch result {
            case let .success(response):
                let cards = response.entity.map { return $0.card}
                if cards.isEmpty {
                    completionHandler(.success(nil))
                }
                else {
                    completionHandler(.success(cards[0]))
                }
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
