import Scrap as Scrap

main = do
    bebidasLinks <- Scrap.getBebidasLinks "http://www.legrandpere.com.ar/Bebidas-Bebidas"
    mapM_ putStrLn bebidasLinks