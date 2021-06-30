sumNumbers :: [Int] -> Int
sumNumbers xs = doSum 0 xs
    where
        doSum total []   = total
        doSum total [y] = total + y
        doSum total (y:ys) = doSum(total + y) ys
