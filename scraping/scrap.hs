{-# LANGUAGE OverloadedStrings #-}
import Text.XML.HXT.Core 
import Text.HandsomeSoup as HandsomeSoup
import Data.Text.Lazy as T
import Data.List as L

main = do
    let doc = HandsomeSoup.fromUrl "http://www.legrandpere.com.ar/BAZAR-BAZAR"
    productos <- runX $ (doc >>> css "table tbody tr"  >>> css "td:nth-child(1), td:nth-child(2) div:nth-child(1)" /> getText) >>. L.filter ((> 0) . T.length . strip . pack)
    mapM_ putStrLn productos

