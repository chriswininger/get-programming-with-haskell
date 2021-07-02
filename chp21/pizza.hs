areaGivenDiameter :: Double -> Double
areaGivenDiameter size = pi * (size / 2)^2

type Pizza = (Double,Double)

costPerInch :: Pizza -> Double
costPerInch (size, cost) = cost / areaGivenDiameter size

comparePizzas :: Pizza -> Pizza -> Pizza
comparePizzas pizza1 pizza2 = if costPizza1 < costPizza2
                              then pizza1
                              else pizza2
  where costPizza1 = costPerInch pizza1
        costPizza2 = costPerInch pizza2

describePizza :: Pizza -> String
describePizza (size,cost) = "The " ++ show size ++ " pizza " ++
                            "is cheap at " ++
                            show costSqInch ++
                            " per square inch"
  where costSqInch = costPerInch (size,cost)

main :: IO ()
main = do
  putStrLn "What is the size of pizza 1"
  size1 <- getLine

  putStrLn "What is the cost of pizza 1"
  cost1 <- getLine

  putStrLn "What is the size of pizza 2"
  size2 <- getLine

  putStrLn "What is the cost of pizza 2"
  cost2 <- getLine

  let pizza1 = (read size1, read cost1)
  let pizza2 = (read size2, read cost2)
  let betterPizza = comparePizzas pizza1 pizza2

  putStrLn (describePizza betterPizza)