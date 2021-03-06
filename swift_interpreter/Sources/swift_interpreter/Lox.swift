//
//  File.swift
//  
//
//  Created by S. Ram Janarthana Raja on 20/6/22.
//

import Foundation

class Lox {
  private static var hasError = false;
  
  static func execute() {
    while (true) {
      print("Welcome to Lox :). \n If you have a file, press 1. \n If you want to interact via CLI, press 2. \n If you wanna quit, type exit :(")
      let input = readLine()
      
      if input == "1" {
        readFromFile()
      } else if input == "2" {
        readFromCLI()
      } else if input == "exit" {
        break
      } else {
        print("\nAwkz, you entered something I didn't understand :/... \n")
      }
    }
  }

  static func readFromFile() {
    print("Enter filename: ")
    guard let filename = readLine() else {
      print("No file, bye")
      return
    }
        
    do {
      if let source = try FileReader.readLoxTextFile(name: filename) {
        startRunning(source: source)
      } else {
        throw LoxError.fileReadingError
      }
    } catch {
      print("Error when reading file: \(error)")
    }
  }
  
  static func readFromCLI() {
    while (true) {
      print("> ")
      guard let input = readLine() else {
        print("No input, bye")
        return
      }
      
      if input.lowercased() == "exit" {
        print("Goodbye")
        return
      } else {
        startRunning(source: input)
      }
      
      if hasError {
        hasError = false
        return
      }
    }
  }
  
  private static func startRunning(source: String) {
    let scanner = Scanner(source: source)
    let tokens = scanner.scanTokens()
    print("Input: \(tokens.map { $0.debugDescription })")
    print("Total lines: \(scanner.line)")
  }
  
  static func throwError(line: Int, error: LoxError) {
    reportError(line: line, location: "", message: error.description)
  }
  
  private static func reportError(line: Int, location: String, message: String) {
    print("[line \(line)] Error \(location): \(message)")
    hasError = true
  }
}
