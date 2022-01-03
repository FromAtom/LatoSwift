import XCTest
@testable import LatoSwift

final class LatoTests: XCTestCase {
    func test_canUseAllUIFont() throws {
        Lato.FontWeight.allCases.forEach { weight in
            Lato.FontStyle.allCases.forEach { style in
                _ = Lato.uiFont(ofSize: 10, weight: weight, style: style)
            }
        }
    }

    func test_canUseAllSwiftUIFont() throws {
        Lato.FontWeight.allCases.forEach { weight in
            Lato.FontStyle.allCases.forEach { style in
                _ = Lato.font(ofSize: 10, weight: weight, style: style)
            }
        }
    }
}
