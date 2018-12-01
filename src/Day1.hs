module Day1 where

import System.IO


day1 :: [String] -> IO ()
day1 args = do
  case args of
    [] -> putStrLn "Error: please provide a filename to read for input"
    (f:fs) -> do
        ls <- readFile f
        putStrLn$ show $ foldl accum 0 (lines ls)
  where
    accum total "" = total
    accum total (op:valString) = case op of
      '+' -> total + (read valString)
      '-' -> total - (read valString)
      _ -> total
