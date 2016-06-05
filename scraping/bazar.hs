import Scrap as Scrap

main = do
    productos <- Scrap.getBazarProducts "http://www.legrandpere.com.ar/BAZAR-BAZAR"
    mapM_ putStrLn productos
    -- writeFile "scraping/bazar" $ L.unwords productos




