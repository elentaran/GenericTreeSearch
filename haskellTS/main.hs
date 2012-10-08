import Tree
import AlgDepthFirst
import AlgBreathFirst

main = do 
    blah <- readFile "ProbToy1.txt"
    let tree = loadTree (lines blah)
    --putStrLn ("hello, world\n" ++ blah)
    putStrLn ("hello, world\n" ++ show tree)
    putStrLn ("hello, world\n" ++ show (solveDFSMax tree))
    putStrLn ("hello, world\n" ++ show (solveBFSMax tree))

