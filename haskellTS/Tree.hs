module Tree where
    import Data.List.Split

    data Node = Nd Float [Node] 

    carLimit = '-'

    termNode :: Node -> Bool
    termNode (Nd _ []) = True
    termNode (Nd _ l) = False

    getChild :: Node -> [Node]
    getChild (Nd _ l) = l

    getVal :: Node -> Float
    getVal (Nd a _) = a

    instance Show Node where
        show n = printNodeDec n 0

    printNodeDec :: Node -> Int -> String
    printNodeDec (Nd a []) n = addTiret n ++ show a ++ "\n"
    printNodeDec (Nd a l) n = addTiret n ++ show a ++ "\n" ++ (foldr (\x y -> x ++ y) "" stringList)
        where stringList = map (\x -> printNodeDec x (n+1)) l 

    addTiret :: Int -> String
    addTiret 0 = ""
    addTiret n = [carLimit] ++ addTiret (n-1)

    loadTree :: [String] -> Node
    loadTree [] = Nd 0 []
    loadTree (x:xs) = Nd firstLine subTree
        where firstLine = read x :: Float
              subTree = map loadTree (splitLinesCarLimit (removeCarLimit xs))

    isCarLimit :: String -> Bool
    isCarLimit (x:xs)
        | x == carLimit = True
        | x /= carLimit = False

    splitLinesCarLimit :: [String] -> [[String]]
    splitLinesCarLimit a = mySplit a

    mySplit = split (dropInitBlank $ keepDelimsL $ whenElt (\x -> (isCarLimit x) == False))

    removeCarLimit :: [String] -> [String]
    removeCarLimit a = map tail a 
    

