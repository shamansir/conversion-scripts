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


data Location =
  Location
  { address :: Maybe String
  , lat :: Float
  , lng :: Float
  , postalCode :: Maybe String
  , neighborhood :: Maybe String
  , city :: Maybe String
  , state :: Maybe String
  , formattedAddress :: Maybe [String]
  } deriving (Generic, Show)



data Venue =
  Venue
  { name :: String
  , location :: Location
  } deriving (Generic, Show)



data Checkin =
   Checkin
   { venue :: Venue
   , createdAt :: Int
   , timezoneOffset :: Maybe Int
   } deriving (Generic,Show)


instance FromJSON Location
instance FromJSON Venue
instance FromJSON Checkin


checkinsParser :: Value -> Parser [Checkin]
checkinsParser = withObject "response" $ \o -> do
  resp <- o .: "response"
  checkins <- resp .: "checkins"
  items <- checkins .: "items"
  return items


main :: IO ()
main = do
  input <- B.readFile "./20210301_0_50.json"
  Prelude.putStrLn
    $ show
    $ (parseEither checkinsParser =<< eitherDecode input)
