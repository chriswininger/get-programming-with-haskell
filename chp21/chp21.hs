import Data.Map as Map

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

costData :: Map.Map Int Double
costData = Map.fromList [(1, 18.0), (2, 16.0)]

sizeData :: Map.Map Int Double
sizeData = Map.fromList [(1, 20.0), (2, 15.0)]

maybeMain :: Maybe String
maybeMain = do
  size1 <- Map.lookup 1 sizeData
  cost1 <- Map.lookup 1 costData

  size2 <- Map.lookup 2 sizeData
  cost2 <- Map.lookup 2 costData

  let pizza1 = (size1,cost1)
  let pizza2 = (size2,cost2)

  let betterPizza = comparePizzas pizza1 pizza2

  return (describePizza betterPizza)