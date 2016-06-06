--import Scrap as Scrap
import Text.XML.HXT.Core 
import Text.HandsomeSoup
import Data.List as L

main = do
    let doc = fromUrl "http://www.legrandpere.com.ar/Bebidas-Bebidas?page=1"
    bebidas <- runX $ doc >>> css ".pagination [href]" >>> getAttrValue "href"
    mapM_ putStrLn bebidas