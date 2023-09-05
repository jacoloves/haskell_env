{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Data.Aeson
import Data.Text (Text)
import qualified Data.ByteString.Lazy as BSL
import Data.Time (getZonedTime, formatTime, defaultTimeLocale)

data DrunkCal = DrunkCal { date :: Text, message :: Text} deriving (Show)

instace ToJson DrunkCal where
    toJSON (DrunkCal date message) = object ["date" .= date, "message" .= message]

main :: IO ()
main = do
   current <- getZonedTime
   let (year, month, day) = (read (formatTime defaultTimeLocale "%Y" current) :: Int, read (formatTime defaultTimeLocale "%m" current) :: Int, read (formatTime defaultTimeLocale "%d" current) :: Int)

   let filename = show year ++ show month ++ ".json"
   let targetDay = show year ++ "-" ++ show month ++ "-" ++ show day

   putStrLn $ "今日はお酒を飲みましたか？"
   response <- getLine
   case response of
        "y" -> do
            let drunkCal = DrunkCal targetDay "Drunk"
        "n" -> do
            let drunkCal = DrunkCal targetDay "Not Drunk"
