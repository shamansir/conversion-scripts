#!/usr/bin/env stack
{- stack
   script
   --resolver lts-13.27
   --package aeson
   --package bytestring
-}


{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

import Data.Aeson
import Data.Aeson.Types
import GHC.Generics
import Data.ByteString.Lazy
import qualified Data.ByteString.Lazy as B


data Venue =
  Venue
  { lat :: Float
  , long :: Float
  } deriving (Generic, Show)



data Checkin =
   Checkin
   { venue :: Venue

   } deriving (Generic,Show)


instance FromJSON Venue
instance FromJSON Checkin


checkinsParser :: Value -> Parser [Checkin]
checkinsParser = withObject "response" $ \o -> do
  resp <- o .: "response"
  checkins <- resp .: "checkins"
  items <- checkins .: "items"
  return items


decodeCheckins :: Either String Checkin
decodeCheckins = eitherDecode "{ \"venue\": { \"lat\": 10, \"long\": 20 } }"


main :: IO ()
main = do
  input <- B.readFile "./20210301_0_50.json"
  Prelude.putStrLn
    $ show
    $ (parseEither checkinsParser =<< eitherDecode input)
  Prelude.putStrLn
    $ show
    $ decodeCheckins
