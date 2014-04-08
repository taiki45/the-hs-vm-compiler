import AST
import Parser

main :: IO ()
main = getLine >>= run

run :: String -> IO ()
run s = case parse parser "REPL" s of
            Left e -> print e
            Right r -> print r
