//
//  File.swift
//  
//
//  Created by FromAtom on 2022/01/05.
//

import Foundation

// Workaround for SwiftUI preview crashing
// ref: https://developer.apple.com/forums/thread/664295?answerId=657852022#657852022

public let FontsBundle = Bundle.myModule

private class CurrentBundleFinder {}
extension Foundation.Bundle {
    static var myModule: Bundle = {
        let bundleNameIOS = "LatoSwift_LatoSwift"
        let bundleNameMacOs = "LatoSwift_LatoSwift"
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: CurrentBundleFinder.self).resourceURL,
            Bundle.main.bundleURL,
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),
        ]

        for candidate in candidates {
            let bundlePathiOS = candidate?.appendingPathComponent(bundleNameIOS + ".bundle")
            let bundlePathMacOS = candidate?.appendingPathComponent(bundleNameMacOs + ".bundle")
            if let bundle = bundlePathiOS.flatMap(Bundle.init(url:)) {
                return bundle
            } else if let bundle = bundlePathMacOS.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle")
    }()
}
