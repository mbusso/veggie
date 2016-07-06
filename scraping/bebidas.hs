import Scrap as Scrap
import Data.List as L

main = do
    bebidasLinks <- Scrap.getBebidasLinks "http://www.legrandpere.com.ar/Bebidas-Bebidas"
    bebidas <- Scrap.getBebidas bebidasLinks
    mapM_ putStrLn(L.concat(bebidas))
    