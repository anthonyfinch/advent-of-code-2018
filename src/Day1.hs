module Day1 where

import System.IO
import Data.List

day1 :: [String] -> IO ()
day1 args = do
  case args of
    [] -> putStrLn "Error: please provide a filename to read for input"
    (f:fs) -> do
        ls <- readFile f
        let opList = map parseOps $ lines ls

        putStr "Final Total: "
        putStrLn $ show $ foldr (\f t -> f t) 0 $ opList
        putStr "First duplicate frequency: "
        putStrLn $ show $ firstDup $ cycle $ opList

parseOps :: String -> (Integer -> Integer)
parseOps "" = (+0)
parseOps (op:valString) = case op of
      '+' -> (+) (read valString)
      '-' -> (\val ->  val- (read valString))
      _ -> (+0)

firstDup :: [(Integer -> Integer)] -> Integer
firstDup ops = loop [] ops
  where
    loop _ [] = 0
    loop [] (op:ops) = loop [op 0] ops
    loop all@(last:seen) (op:ops) =
      let newT = op last in
      if (newT `elem` all)
      then
        newT
      else
        loop (newT:all) ops
