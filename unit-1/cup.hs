
-- closure captures the value of the argument passed to cup
-- cup :: t1 -> (t1 -> t2) -> t2
cup flOz = \message -> message flOz


-- coffeecup :: (Integer -> t) -> t
-- cup gives us a function that takes one more argument 'message' after we give it an Int
coffeecup = cup 12


-- getOz :: ((p -> p) -> t) -> t
getOz aCup = aCup (\n -> n)


-- this is taking Integer ozDrank, subtracting it from the oz's in the cup, then returning a new function or 'instance' of a cup, thus resembling an object
drink aCup ozDrank = if ozDiff >= 0
                    then cup (flOz - ozDrank)
                    else cup 0
    where flOz = getOz aCup
          ozDiff = flOz - ozDrank


-- compare if the oz's are EQ to zero
isEmpty aCup = getOz aCup == 0