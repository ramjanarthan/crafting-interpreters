//
//  ExpressionVisitor.swift
//  
//
//  Created by S. Ram Janarthana Raja on 30/6/22.
//

import Foundation

protocol ExpressionVisitor {
  associatedtype ResultType
  
  func visitBinaryExpression(_ expr: BinaryExpression) -> ResultType
  func visitUnaryExpression(_ expr: UnaryExpression) -> ResultType
  func visitGroupingExpression(_ expr: GroupingExpression) -> ResultType
  func visitLiteralExpression(_ expr: LiteralExpression) -> ResultType
}

struct ASTPrinterVisitor: ExpressionVisitor {
  typealias ResultType = String
  
  func print(_ expr: Expression) -> ResultType {
    return expr.accept(self)
  }
  
  func visitBinaryExpression(_ expr: BinaryExpression) -> String {
    return parenthesize(name: expr.oper.lexeme, exprs: [expr.left, expr.right])
  }
  
  func visitUnaryExpression(_ expr: UnaryExpression) -> String {
    return parenthesize(name: expr.oper.lexeme, exprs: [expr.right])
  }
  
  func visitGroupingExpression(_ expr: GroupingExpression) -> String {
    return parenthesize(name: "group", exprs: [expr.expr])
  }
  
  func visitLiteralExpression(_ expr: LiteralExpression) -> String {
    guard let val = expr.val else {
      return "nil"
    }
    
    return "\(val)"
  }
  
  private func parenthesize(name: String, exprs: [Expression]) -> String {
    var output = "("

    output += name
    for expr in exprs {
      output += " "
      let nested = expr.accept(self)
      output += nested
    }
    
    output += ")"
    return output
  }
}
