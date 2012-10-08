module AlgDepthFirst where
    import Tree
    import Debug.Trace

    solveDFS:: Node -> (Float -> Float -> Float) -> Float
    --solveDFS n f | trace ("myfun\n" ++ show n ++ " ") False = undefined
    solveDFS (Nd a []) f = trace ("res = " ++ show a) a
    --solveDFS (Nd a []) f = a
    solveDFS (Nd a l) f = foldr f a (map (\x -> solveDFS x f) l)


    solveDFSMax:: Node -> Float
    solveDFSMax n = solveDFS n max

    solveDFSMin:: Node -> Float
    solveDFSMin n = solveDFS n min
