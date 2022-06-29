//
//  Expression.swift
//  
//
//  Created by S. Ram Janarthana Raja on 28/6/22.
//

import Foundation

protocol Expression {
  func accept<T: ExpressionVisitor>(_ visitor: T) -> T.ResultType
}

struct LiteralExpression: Expression {
  let val: Any?
  
  func accept<T>(_ visitor: T) -> T.ResultType where T : ExpressionVisitor {
    return visitor.visitLiteralExpression(self)
  }
}

struct BinaryExpression: Expression {
  let left: Expression
  let right: Expression
  let oper: Token
  
  func accept<T>(_ visitor: T) -> T.ResultType where T : ExpressionVisitor {
    return visitor.visitBinaryExpression(self)
  }
}

struct UnaryExpression: Expression {
  let right: Expression
  let oper: Token
  
  func accept<T>(_ visitor: T) -> T.ResultType where T : ExpressionVisitor {
    return visitor.visitUnaryExpression(self)
  }
}

struct GroupingExpression: Expression {
  let expr: Expression
  
  func accept<T>(_ visitor: T) -> T.ResultType where T : ExpressionVisitor {
    return visitor.visitGroupingExpression(self)
  }
}
