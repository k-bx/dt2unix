module Main where

import Data.Semigroup ((<>))
import Data.Time.Clock
import Data.Time.Format
import Options.Applicative

data Params = Params
  { date :: UTCTime
  }

params :: Parser Params
params =
  Params <$>
  option
    auto
    (long "date" <> metavar "DATE" <>
     help "Date. Example: 2017-06-14 00:00:00 UTC")

main :: IO ()
main = do
  ps <- execParser opts
  putStrLn (formatTime defaultTimeLocale "%s" (date ps))
  return ()
  where
    opts =
      info
        (params <**> helper)
        (fullDesc <> progDesc "Convert between human-readable and unixtime")
