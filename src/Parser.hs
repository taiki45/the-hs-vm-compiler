module Parser where

import Text.ParserCombinators.Parsec
import Control.Applicative ((<$>))
import AST

parser :: Parser AST
parser = astP

numberP :: Parser Value
numberP = Number . read <$> many1 digit

signP :: Parser Char
signP = oneOf "+-*^%=<>"

symbolP :: Parser Symbol
symbolP = do c <- letter <|> signP
             cs <- many . try $ try alphaNum <|> try signP
             return $ c:cs

valueP :: Parser Value
valueP = numberP

funcCallP :: Parser AST
funcCallP = do char '('
               name <- symbolP
               spaces
               args <- try (astP `sepBy` skipMany1 space)
               char ')'
               return $ FuncCall name args

astP :: Parser AST
astP = try funcCallP <|> (Const <$> valueP) <|> (Ref <$> symbolP)
