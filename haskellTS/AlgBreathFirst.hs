module AlgBreathFirst where
    import Tree
    import Debug.Trace

    solveBFS:: Node -> (Float -> Float -> Float) -> Float
    --solve n f | trace ("myfun\n" ++ show n ++ " ") False = undefined
    solveBFS (Nd a []) f = a
    solveBFS (Nd a l) f = foldr f a list
        --where list = createListBFS l
        where list = trace ("list: " ++ show (createListBFS l)) (createListBFS l)

    createListBFS :: [Node] -> [Float]
    createListBFS [] = []
    createListBFS a = map getVal a ++ createListBFS children
        where children = foldr (++) [] (map getChild a)


    solveBFSMax:: Node -> Float
    solveBFSMax n = solveBFS n max

    solveBFSMin:: Node -> Float
    solveBFSMin n = solveBFS n min
