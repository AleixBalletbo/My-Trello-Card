//
//  ApiListGateway.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 28/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Foundation

class ApiListsGatewayImplementation: ListsGateway {
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getLists(boardId: String, completionHandler: @escaping GetListsEntityGatewayCompletionHandler) {
        let getListsApiRequest = GetListsApiRequest(boardId: boardId)
        apiClient.execute(request: getListsApiRequest) { (result: Result<ApiResponse<[ApiList]>>) in
            switch result {
            case let .success(response):
                let lists = response.entity.map { return $0.list}
                completionHandler(.success(lists))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
}

