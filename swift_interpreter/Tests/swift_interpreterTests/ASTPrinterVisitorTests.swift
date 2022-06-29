//
//  ASTPrinterVisitorTests.swift
//  
//
//  Created by S. Ram Janarthana Raja on 30/6/22.
//

import Foundation
import XCTest
@testable import swift_interpreter

class ASTPrinterVisitorTests: XCTest {
  var sut: ASTPrinterVisitor!
  
  override func setUp() {
    super.setUp()
    sut = ASTPrinterVisitor()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testBasic() {
    // given
    let mainExpr = BinaryExpression(left: UnaryExpression(right: LiteralExpression(val: 123),
                                                          oper: Token(type: .MINUS, lexeme: "-", literal: nil, line: 1)),
                                    right: GroupingExpression(expr: LiteralExpression(val: 45.67)),
                                    oper: Token(type: .STAR, lexeme: "*", literal: nil, line: 1))
    let expected = "(* (- 123) (group 45.67))"
    
    // when
    let output = sut.print(mainExpr)
    
    // then
    XCTAssertEqual(output, expected)
  }
}
