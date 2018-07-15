//
//  CardViewController.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 15/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Cocoa

class CardViewController: NSViewController, CardView {
    
    var configurator: CardConfigurator!
    var presenter: CardPresenter!
    
    @IBOutlet var titleLabel: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        configurator.configure(cardViewController: self)
        presenter.getBoards()
    }
    
    func displayTitle(title: String) {
        titleLabel.stringValue = title
        (NSApp.delegate as! AppDelegate).changeStatusItemTitle(title: title)
    }
    
}

extension CardViewController {
    static func freshController(configurator: CardConfigurator) -> CardViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "CardViewController")
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? CardViewController else {
            fatalError("Why cant I find CardViewController? - Check Main.storyboard")
        }
        viewController.configurator = configurator
        return viewController
    }
}