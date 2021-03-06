module AWSTests.RDSTests.EventTests
    ( runEventTests
    )
    where

import Data.Text (Text)
import Test.Hspec

import AWS.RDS
import AWSTests.Util
import AWSTests.RDSTests.Util

region :: Text
region = "ap-northeast-1"

runEventTests :: IO ()
runEventTests = do
    hspec describeEventsTest

describeEventsTest :: Spec
describeEventsTest = do
    describe "describeEvents doesn't fail" $ do
        it "describeEvents doesn't throw any exception" $ do
            testRDS region (
                describeEvents Nothing Nothing Nothing Nothing Nothing [] Nothing Nothing
                ) `miss` anyHttpException
