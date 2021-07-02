{-# LANGUAGE  OverloadedStrings #-}

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC

-- you can enter byte strings as ascii text when using the OverloadedString extension
sampleBytes :: B.ByteString
sampleBytes = "Hello!"

bcInt :: BC.ByteString
bcInt = "6"

bcToInt :: BC.ByteString -> Int
bcToInt = read . BC.unpack

-- run bcToInt bcInt
