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
    
    @IBOutlet weak var dueStackView: NSStackView!
    private var dueBackground: NSView = {
        let view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = CGColor.clear
        view.layer?.cornerRadius = 5
        return view
    }()
    @IBOutlet weak var dueIcon: NSImageView!
    @IBOutlet weak var dueLabel: NSTextField!
    
    @IBOutlet weak var checklistStackView: NSStackView!
    private var checklistBackground: NSView = {
        let view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = CGColor.clear
        view.layer?.cornerRadius = 5
        return view
    }()
    @IBOutlet weak var checklistIcon: NSImageView!
    @IBOutlet weak var checklistLabel: NSTextField!
    
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
    
    var dueText: String? {
        get { return dueLabel.stringValue }
        set { dueLabel.stringValue = newValue! }
    }
    
    var checklistItemsText: String? {
        get { return checklistLabel.stringValue }
        set { checklistLabel.stringValue = newValue! }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.wantsLayer = true
        self.superview?.wantsLayer = true
        initSubviews()
        pinBackground(dueBackground, to: dueStackView)
        pinBackground(checklistBackground, to: checklistStackView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
        pinBackground(dueBackground, to: dueStackView)
        pinBackground(checklistBackground, to: checklistStackView)
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
    
    private func initSubviews() {
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
    
    private func pinBackground(_ view: NSView, to stackView: NSStackView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        stackView.subviews.insert(view, at: 0)
        view.pin(to: stackView)
    }
    
    func setDueBackground(backgroundColor: CGColor, textColor: NSColor) {
        dueBackground.layer?.backgroundColor = backgroundColor
        dueLabel.textColor = textColor
        dueIcon.image = dueIcon.image?.tint(color: textColor)
    }
    
    func setChecklistBackground(backgroundColor: CGColor, textColor: NSColor) {
        checklistBackground.layer?.backgroundColor = backgroundColor
        checklistLabel.textColor = textColor
        checklistIcon.image = checklistIcon.image?.tint(color: textColor)
    }
    
}

extension NSView {
    public func pin(to view: NSView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension NSImage {
    func tint(color: NSColor) -> NSImage {
        guard !self.isTemplate else { return self }
        let image = self.copy() as! NSImage
        image.lockFocus()
        color.set()
        let imageRect = NSRect(origin: NSZeroPoint, size: image.size)
        imageRect.fill(using: .sourceAtop)
        image.unlockFocus()
        image.isTemplate = false
        return image
    }
}
