import Scrap as Scrap

main = do
    bebidasLinks <- Scrap.getBebidasLinks "http://www.legrandpere.com.ar/Bebidas-Bebidas"
    bebidas <- Scrap.getBebidas bebidasLinks
    mapM_ putStrLn bebidas
    