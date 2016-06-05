{-# LANGUAGE OverloadedStrings #-}
import Text.XML.HXT.Core 
import Text.HandsomeSoup as HandsomeSoup
import Data.Text.Lazy as T
import Data.List as L
import Text.XML.HXT.Arrow.XmlState.TypeDefs
import Data.Tree.NTree.TypeDefs
import Text.XML.HXT.DOM.TypeDefs

main = do
    productos <- getBazarProducts "http://www.legrandpere.com.ar/BAZAR-BAZAR"
    mapM_ putStrLn productos
    -- writeFile "scraping/bazar" $ L.unwords productos


getDocument:: String -> IOSArrow b (NTree XNode)
getDocument  = HandsomeSoup.fromUrl

filterEmptyStrings:: String -> Bool
filterEmptyStrings = (> 0) . T.length . strip . pack

productsSelector:: ArrowXml a => a (NTree XNode) (NTree XNode)
productsSelector = HandsomeSoup.css "table tbody tr"  >>> HandsomeSoup.css "td:nth-child(1), td:nth-child(2) div:nth-child(1)"

getBazarProducts:: String -> IO[String]
getBazarProducts x = runX $ (getDocument x >>> productsSelector /> getText) >>. L.filter (filterEmptyStrings)

