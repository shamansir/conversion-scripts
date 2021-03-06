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
import GHC.Generics
import Data.ByteString.Lazy



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


decodeCheckins :: Either String Checkin
decodeCheckins = eitherDecode "{ \"venue\": { \"lat\": 10, \"long\": 20 } }"


main :: IO ()
main =
  Prelude.putStrLn
    $ show
    $ decodeCheckins
