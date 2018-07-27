//
//  ApiBoardGateway.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 24/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

class ApiBoardGatewayImplementation: BoardGateway {
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getBoards(completionHandler: @escaping GetBoardsEntityGatewayCompletionHandler) {
        let getBoardsApiRequest = GetBoardsApiRequest()
        apiClient.execute(request: getBoardsApiRequest) { (result: Result<ApiResponse<[ApiBoard]>>) in
            switch result {
            case let .success(response):
                let boards = response.entity.map { return $0.board}
                completionHandler(.success(boards))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
}
