cup flOz = \_ -> flOz
cup flOz = \message -> message flOz

getOz aCup = aCup(\flOz -> flOz)

isEmpty aCup = getOz aCup == 0

drink aCup ozDrank = if isEmpty aCup
    then cup ozDiff
    else cup 0
  where flOz = getOz aCup
        ozDiff = flOz - ozDrank

