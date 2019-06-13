//
//  SnapshotTestCase.swift
//  KataSwiftUITests
//
//  Created by Davide Mendolia on 13/06/2019.
//  Copyright © 2019 Karumi. All rights reserved.
//

import Foundation
import XCTest
import SwiftUI
import SnapshotTesting

class SnapshotTestCase: XCTestCase {
    override func setUp() {
        super.setUp()
        SnapshotTesting.record = ProcessInfo.processInfo.environment["RECORD_MODE"] != nil
    }

    func verify<V: View>(view: V, file: StaticString = #file,
                         testName: String = #function,
                         line: UInt = #line) {
        assertSnapshot(matching: view.body, as: .dump, file: file, testName: testName, line: line)
    }
}
