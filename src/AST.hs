module AST where

data AST = Const Value
         | FuncCall Symbol [AST]
         | Ref Symbol
         deriving Show

data Value = Number Int
           deriving Show

type Symbol = String
