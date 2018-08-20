//
//  CardViewController.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 15/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Cocoa

class MainWindowViewController: NSViewController, MainWindowView {
    
    var configurator: MainWindowConfigurator!
    var presenter: MainWindowPresenter!
    
    @IBOutlet var boardsPopUp: NSPopUpButton!
    
    @IBAction func popUpButtonUsed(_ sender: NSPopUpButton) {
        let board: Board = sender.selectedItem?.representedObject as! Board
        presenter.getLists(boardId: board.id)
    }
    
    @IBOutlet var originListsPopUp: NSPopUpButton!
    
    @IBOutlet var destinyListsPopUp: NSPopUpButton!
    
    @IBOutlet var loadCardButton: NSButton!

    @IBAction func loadCardButtonPressed(_ sender: NSButton) {
        let list: List = originListsPopUp.selectedItem?.representedObject as! List
        presenter.getCard(listId: list.id)
    }
    
    @IBOutlet weak var cardView: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        configurator.configure(cardViewController: self)
        presenter.didLoad()
    }
    
    func loadBoards(boards: [Board]) {
        let boardMenu = NSMenu()
        for board in boards {
            let boardMenuItem = NSMenuItem(title: board.name, action: nil, keyEquivalent: "")
            boardMenuItem.representedObject = board
            boardMenu.addItem(boardMenuItem)
        }
        boardsPopUp.menu = boardMenu
        boardsPopUp.select(nil)
    }
    
    func loadLists(lists: [List]) {
        let listMenu = NSMenu()
        for list in lists {
            let listMenuItem = NSMenuItem(title: list.name, action: nil, keyEquivalent: "")
            listMenuItem.representedObject = list
            listMenu.addItem(listMenuItem)
        }
        
        originListsPopUp.menu = listMenu
        originListsPopUp.isEnabled = true
        
        destinyListsPopUp.menu = listMenu.copy() as? NSMenu
        destinyListsPopUp.isEnabled = true
        
        loadCardButton.isEnabled = true
    }
    
    func loadCard(card: Card?) {
        if let existingCard = card {
            cardView.nameText = existingCard.name
            cardView.descriptionText = existingCard.description
            if let dueDate = existingCard.due {
                cardView.dueText = getReadableDate(date: dueDate)
            }
            else {
                cardView.dueText = "This card has no due date"
            }
        }
        else {
            cardView.nameText = "There are no cards left"
        }
    }
    
    func getReadableDate (date: String) -> String {
        let dateISOFormatter = ISO8601DateFormatter()
        dateISOFormatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
        let date = dateISOFormatter.date(from: date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter.string(from: date!)
    }
    
}

extension MainWindowViewController {
    static func freshController(configurator: MainWindowConfigurator) -> MainWindowViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "CardViewController")
        guard let viewController = storyboard.instantiateController(withIdentifier: identifier) as? MainWindowViewController else {
            fatalError("Why cant I find CardViewController? - Check Main.storyboard")
        }
        viewController.configurator = configurator
        return viewController
    }
}
