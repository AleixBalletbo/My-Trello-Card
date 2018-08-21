//
//  Color.swift
//  MyTrelloCard
//
//  Created by Aleix Balletbó on 21/8/18.
//  Copyright © 2018 Aleix Balletbó. All rights reserved.
//

import Cocoa

class Color {
    static func fromString(_ color: String) -> NSColor{
        switch color {
        case "green":
            return NSColor.RGB(red: 87, green: 181, blue: 70)
        case "yellow":
            return NSColor.RGB(red: 240, green: 208, blue: 0)
        case "orange":
            return NSColor.RGB(red: 255, green: 148, blue: 25)
        case "red":
            return NSColor.RGB(red: 232, green: 79, blue: 62)
        case "purple":
            return NSColor.RGB(red: 187, green: 108, blue: 220)
        case "blue":
            return NSColor.RGB(red: 0, green: 110, blue: 183)
        case "sky":
            return NSColor.RGB(red: 0, green: 186, blue: 220)
        case "lime":
            return NSColor.RGB(red: 72, green: 228, blue: 141)
        case "pink":
            return NSColor.RGB(red: 255, green: 109, blue: 196)
        case "black":
            return NSColor.RGB(red: 68, green: 68, blue: 68)
        default:
            return NSColor.gray
        }
    }
}

private extension NSColor {
    static func RGB (red: CGFloat, green: CGFloat, blue:CGFloat) -> NSColor {
        return NSColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
