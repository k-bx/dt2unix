{-# LANGUAGE TypeApplications #-}

module Main where

import Data.Semigroup ((<>))
import Data.Time.Clock
import Data.Time.Format
import Options.Applicative

data Params = Params
  { date :: Int
  }

params :: Parser Params
params =
  Params <$>
  option
    auto
    (long "date" <> metavar "DATE" <>
     help "Date in unix timestamp (seconds). Example: 1477440000")

main :: IO ()
main = do
  ps <- execParser opts
  putStrLn
    (show
       @UTCTime
       (parseTimeOrError False defaultTimeLocale "%s" (show (date ps))))
  return ()
  where
    opts =
      info
        (params <**> helper)
        (fullDesc <> progDesc "Convert between human-readable and unixtime")
