import UIKit
import SwiftUI

public enum Lato {
    public enum FontWeight: String, CaseIterable {
        case black
        case bold
        case regular
        case light
        case thin
    }

    public enum FontStyle: CaseIterable {
        case regular
        case italic
    }

    public static func uiFont(ofSize size: CGFloat, weight: FontWeight = .regular, style: FontStyle = .regular) -> UIFont {
        let name: String
        switch weight {
        case .black:
            switch style {
            case .regular:
                name = "Lato-Black"
            case .italic:
                name = "Lato-BlackItalic"
            }
        case .bold:
            switch style {
            case .regular:
                name = "Lato-Bold"
            case .italic:
                name = "Lato-BoldItalic"
            }
        case .regular:
            switch style {
            case .regular:
                name = "Lato-Regular"
            case .italic:
                name = "Lato-Italic"
            }
        case .light:
            switch style {
            case .regular:
                name = "Lato-Light"
            case .italic:
                name = "Lato-LightItalic"
            }
        case .thin:
            switch style {
            case .regular:
                name = "Lato-Hairline"
            case .italic:
                name = "Lato-HairlineItalic"
            }
        }

        if let font = UIFont(name: name, size: size) {
            return font
        } else {
            FontLoader.load(fontName: name)
            return UIFont(name: name, size: size)!
        }
    }

    public static func font(ofSize size: CGFloat, weight: FontWeight = .regular, style: FontStyle = .regular) -> Font {
        let uiFont = uiFont(ofSize: size, weight: weight, style: style)
        return Font(uiFont as CTFont)
    }
}

final private class FontLoader {
    class func load(fontName: String) {
        guard let url = FontsBundle.url(forResource: fontName, withExtension: "ttf") else {
            return
        }
        guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
            return
        }
        guard let font = CGFont(fontDataProvider) else {
            return
        }
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("[Lato.swift] error registering font: \(error.debugDescription)")
        }
    }
}
