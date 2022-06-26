//
//  ScannerTests.swift
//  
//
//  Created by S. Ram Janarthana Raja on 26/6/22.
//

import XCTest
@testable import swift_interpreter

final class ScannerTests: XCTestCase {
  func test_identifier_1() throws {
    // given
    let input = try XCTUnwrap(getFileContent(.iden1))
    let scanner = swift_interpreter.Scanner(source: input)
    
    // when
    let tokens = scanner.scanTokens()
    
    // then
    XCTAssertEqual(tokens.map { $0.debugDescription }, ["VAR var", "IDENTIFIER x", "EQUAL =", "STRING \"asdlfkj\"", "WHILE while", "IDENTIFIER hello", "NUMBER 123.23452334", "LEFT_BRACE {", "LEFT_BRACE {", "LEFT_PAREN (", "LEFT_PAREN (", "IDENTIFIER laskdf", "AND and", "STRING \"adsfaq_123\"", "IDENTIFIER ad_234", "PLUS +", "MINUS -", "LESS_EQUAL <=", "NUMBER 234.03", "RIGHT_PAREN )", "RIGHT_PAREN )", "RIGHT_BRACE }", "RIGHT_BRACE }", "EOF "])
    XCTAssertEqual(scanner.line, 5)
  }
  
  func test_multiline_comment_1() throws {
    // given
    let input = try XCTUnwrap(getFileContent(.multilinecomment1))
    let scanner = swift_interpreter.Scanner(source: input)
    
    // when
    let tokens = scanner.scanTokens()
    
    // then
    XCTAssertEqual(tokens.map { $0.debugDescription }, ["VAR var", "IDENTIFIER x", "EQUAL =", "STRING \"asdlfkj\"", "WHILE while", "IDENTIFIER hello", "NUMBER 123.23452334", "LEFT_BRACE {", "LEFT_BRACE {", "LEFT_PAREN (", "LEFT_PAREN (", "IDENTIFIER laskdf", "AND and", "STRING \"adsfaq_123\"", "IDENTIFIER ad_234", "PLUS +", "MINUS -", "LESS_EQUAL <=", "NUMBER 234.03", "RIGHT_PAREN )", "RIGHT_PAREN )", "RIGHT_BRACE }", "RIGHT_BRACE }", "EOF "])
    XCTAssertEqual(scanner.line, 10)
  }
  
  func test_numbers_1() throws {
    // given
    let input = try XCTUnwrap(getFileContent(.numbers1))
    let scanner = swift_interpreter.Scanner(source: input)
    
    // when
    let tokens = scanner.scanTokens()
    
    // then
    XCTAssertEqual(tokens.map { $0.debugDescription }, ["NUMBER 123", "NUMBER 124.45", "NUMBER 120023421.9012", "NUMBER 00234.1234", "STRING \"All done :)\"", "EOF "])
    XCTAssertEqual(scanner.line, 8)
  }
  
  func test_simple() throws {
    // given
    let input = try XCTUnwrap(getFileContent(.simple))
    let scanner = swift_interpreter.Scanner(source: input)
    
    // when
    let tokens = scanner.scanTokens()
    
    // then
    XCTAssertEqual(tokens.map { $0.debugDescription }, ["STRING \"token\"", "LEFT_BRACE {", "RIGHT_BRACE }", "LEFT_PAREN (", "LEFT_PAREN (", "RIGHT_PAREN )", "RIGHT_PAREN )", "LEFT_PAREN (", "STRING \"test\"", "RIGHT_PAREN )", "EOF "])
    XCTAssertEqual(scanner.line, 8)
  }
}

// MARK: Helper methods
extension ScannerTests {
  private enum FileName: String {
    case iden1
    case multilinecomment1
    case numbers1
    case simple
  }
  
  
  private func getFileContent(_ name: FileName) -> String? {
    return try? FileReader.readLoxTextFile(name: name.rawValue, isTest: true)
  }
}
