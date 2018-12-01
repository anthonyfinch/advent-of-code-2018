module Main where

import System.Environment
import System.IO

import Day1

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "ERROR: please specify which day to run"
    (day:args) ->
      case day of
        "day1" -> day1 args
        _ -> putStrLn "ERROR: please specify a correct day to run"
