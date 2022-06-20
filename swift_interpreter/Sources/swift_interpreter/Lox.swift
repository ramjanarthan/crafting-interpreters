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
    
    print("You have entered file name: \(filename). Goodbye")
  }
  
  static func readFromCLI() {
    while (true) {
      print("$ ")
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
    print("Input: \(scanner.scanTokens())")
  }
  
  private static func throwError(line: Int, message: String) {
    reportError(line: line, location: "", message: message)
  }
  
  private static func reportError(line: Int, location: String, message: String) {
    print("[line \(line)] Error \(location): \(message)")
    hasError = true
  }
}
