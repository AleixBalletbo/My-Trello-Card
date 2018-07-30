//
//  CardView.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 30/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Cocoa

class CardView: NSView {

    @IBOutlet var contentView: NSView!
    @IBOutlet weak var titleLabel: NSTextField!
    
    var title: String? {
        get { return titleLabel.stringValue }
        set { titleLabel.stringValue = newValue! }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = NSNib(nibNamed: NSNib.Name(rawValue: "CardView"), bundle: nil)
        nib!.instantiate(withOwner: self, topLevelObjects: nil)
        contentView.frame = bounds
        addSubview(contentView)
            
        // custom initialization logic
    }
    
}
