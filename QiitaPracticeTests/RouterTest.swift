//
//  HomeRouterTest.swift
//  QiitaPracticeTests
//
//  Created by fukuda taichiro on 2024/01/27.
//

import XCTest
import SwiftUI
@testable import QiitaPractice

final class RouterTest: XCTestCase {
    private var router: Router<TestRoute>!
    
    override func setUp() {
        super.setUp()
        router = .init(isPresented: .constant(.none))
    }
    
    func testPush() {
        router.routeTo(.view1)
        XCTAssertEqual(router.path.count, 1)
    }
    
    func testDismissFromPush() {
        router.routeTo(.view1)
        router.dismiss()
        XCTAssertEqual(router.path.count, 0)
    }
    
    func testSheet() {
        router.routeTo(.view2)
        XCTAssertNotNil(router.presentingSheet)
    }
    
    func testDismissSheet() {
        router.routeTo(.view2)
        router.dismiss()
        XCTAssertNil(router.presentingSheet)
    }
    
    func testPresentFullScreenCover() {
        router.routeTo(.view3)
        XCTAssertNotNil(router.presentingFullScreenCover)
    }
    
    func testDismissFullScreenCover() {
        router.routeTo(.view3)
        router.dismiss()
        XCTAssertNil(router.presentingFullScreenCover)
    }
}

fileprivate enum TestRoute: Routable {
    case view1
    case view2
    case view3
    
    @ViewBuilder
    func viewToDisplay(router: Router<Self>) -> some View {
        switch self {
        case .view1:
            Text("view1")
        case .view2:
            Text("view2")
        case .view3:
            Text("view3")
        }
    }
    
    var navigationType: NavigationType {
        switch self {
        case .view1:
            return .push
        case .view2:
            return .sheet
        case .view3:
            return .fullScreenCover
        }
    }
}
