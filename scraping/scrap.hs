{-# LANGUAGE OverloadedStrings #-}
import Text.XML.HXT.Core 
import Text.HandsomeSoup as HandsomeSoup
import Data.Text.Lazy as T
import Data.List as L
import Text.XML.HXT.Arrow.XmlState.TypeDefs
import Data.Tree.NTree.TypeDefs
import Text.XML.HXT.DOM.TypeDefs

main = do
    let doc = getDocument "http://www.legrandpere.com.ar/BAZAR-BAZAR"
    productos <- runX $ (doc >>> css "table tbody tr"  >>> css "td:nth-child(1), td:nth-child(2) div:nth-child(1)" /> getText) >>. L.filter (filterEmptyStrings)
    mapM_ putStrLn productos
    -- writeFile "scraping/bazar" $ L.unwords productos


-- getBazarProducts :: [Char]
--getBazarProducts = 
--	HandsomeSoup.fromUrl "http://www.legrandpere.com.ar/BAZAR-BAZAR" >>= \ doc ->
--    runX((doc >>> css "table tbody tr"  >>> css "td:nth-child(1), td:nth-child(2) div:nth-child(1)" /> getText) >>. L.filter ((> 0) . T.length . strip . pack))

getDocument:: String -> IOSArrow b (NTree XNode)
getDocument  = HandsomeSoup.fromUrl

filterEmptyStrings:: String -> Bool
filterEmptyStrings = (> 0) . T.length . strip . pack