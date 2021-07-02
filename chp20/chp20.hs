{-
Java Version
----------------

public class Example {

    public static int mystery1(int val1, int val2){
        int val3 = 3;
        return Math.pow(val1 + val2 + val3, 2);
    }

    public static int mystery2(int val1, int val2){
        int val3 = 3;
        System.out.print("Enter a number");
        try {
            Scanner in = new Scanner(System.in);
            val3 = in.nextInt();
        } catch (IOException e) {

            e.printStackTrace();
        }
        return Math.pow(val1 + val2 + val3,2);
    }

}
-}

-- Haskell Version
mystery1 :: Int -> Int -> Int
mystery1 val1 val2 = (val1 + val2 + val3)^2
    where val3 = 3

mystery2 :: Int -> Int -> IO Int
mystery2 val1 val2 = do
    putStrLn "Enter a number"
    val3Input <- getLine
    let val3 = read val3Input
    return ((val1 + val2 + val3)^2)


