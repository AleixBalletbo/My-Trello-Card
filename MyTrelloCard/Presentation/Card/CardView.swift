//
//  CardView.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 30/7/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Cocoa

@IBDesignable
class CardView: NSView {

    @IBOutlet var contentView: NSView!
    
    @IBOutlet weak var nameLabel: NSTextField!
    
    @IBOutlet var descriptionLabel: NSTextView!
    
    @IBInspectable
    var backgroundColor: NSColor = NSColor.gray {
        didSet {
            layer?.backgroundColor = backgroundColor.cgColor
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet {
            layer?.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var shadowColor: NSColor = NSColor.black {
        didSet {
            layer?.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float = 0 {
        didSet {
            layer?.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer?.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 0 {
        didSet {
            layer?.shadowRadius = shadowRadius
        }
    }
    
    var nameText: String? {
        get { return nameLabel.stringValue }
        set { nameLabel.stringValue = newValue! }
    }
    
    var descriptionText: String? {
        get { return descriptionLabel.string }
        set { descriptionLabel.string = newValue! }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.wantsLayer = true
        self.superview?.wantsLayer = true
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    override func prepareForInterfaceBuilder() {
        //initSubviews()
        layer?.backgroundColor = backgroundColor.cgColor
        layer?.cornerRadius = cornerRadius
        
        layer?.shadowColor = shadowColor.cgColor
        layer?.shadowOpacity = shadowOpacity
        layer?.shadowOffset = shadowOffset
        layer?.shadowRadius = shadowRadius
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    func initSubviews() {
        // standard initialization logic
        let bundle = Bundle(for: type(of: self))
        let nib = NSNib(nibNamed: NSNib.Name(rawValue: "CardView"), bundle: bundle)
        nib!.instantiate(withOwner: self, topLevelObjects: nil)
        contentView.frame = bounds
        contentView.addSubview(nameLabel)
        self.addSubview(contentView)
        
        // custom initialization logic
        self.shadow = NSShadow()
    }
    
}
