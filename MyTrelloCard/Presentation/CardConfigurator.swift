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
        let presenter = CardPresenterImplementation(view: cardViewController)
        cardViewController.presenter = presenter
    }
}
