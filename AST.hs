module AST where

data AST = Const Value
         | FuncCall Symbol [AST]
         deriving Show

data Value = Number Int
           deriving Show

type Symbol = String
