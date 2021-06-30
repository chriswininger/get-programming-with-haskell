getNFromListSub 0 item list = item
getNFromListSub n item list = getNFromListSub nextN nextItem nextList
  where nextN = n - 1
        nextItem = head list
        nextList = tail list

getNFromList n list = getNFromListSub n 0 list



gdc a b = if remainder == 0
    then b
    else gdc b remainder
  where
    remainder = a `mod` b

myRepeat :: Integer -> Integer -> [Integer] -> [Integer]
myRepeat n 0 list = list
myRepeat n y list = myRepeat n nextY nextList
  where nextY = y -1
        nextList = n:list

--myRepeatSub n y arr = if i == y
--    then n:arr
--    else myRepeatSub n i n:arr
--  where
--    i = y - 1

myDrop n list =
    if diff < 0
      then []
      else
        if i < 0
          then list
          else myDrop i restOfList
  where
    i = n - 1
    restOfList = tail list
    diff = length list - n

finiteCycle  (first:rest) = first:rest ++ [first]

myCycle (first:rest) = first:myCycle (rest++[first])


ackermann m n =
  if m == 0
    then n + 1
  else
    if n == 0 then ackermann (m -1) 1
    else
      ackermann (m - 1) (ackermann m (n -1))

collatz n =
  if n == 1
    then 1
    else
      if even n
      then 1 + collatz (n `div`  2)
      else 1 + collatz (n * 3 + 1)


fib n =
  if n == 0
    then 0
    else
      if n == 1
      then 1
      else
        fib (n - 1) + fib (n - 2)


-- pattern matching example
mul3ByAll [] = []
mul3ByAll (x:xs) = (3 * x):mul3ByAll xs


addAnA [] = []
addAnA (x:xs) = (" a " ++ x):addAnA xs
