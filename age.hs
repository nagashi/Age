import Text.Read (readMaybe) -- Import readMaybe for safe parsing

getInput :: IO Int  -- Function getInput is of type IO that returns type Int
getInput = do
  -- Start a do-block for sequential IO actions
  putStrLn "Please enter your birth year"
  inputStr <- getLine
  case readMaybe inputStr :: Maybe Int of  -- Attempt to read an Int, resulting in Maybe Int.
    Nothing -> do
      putStrLn "Invalid input.  Please try again."
      getInput  -- Recursive call to restart the input process.
    Just val -> return val -- Return the valid value within the IO monad.

main :: IO () -- Declare the type of main as an IO action returning unit
main = do
  birthYear <- getInput --  Call the recursive function.
  putStrLn $ "In 2025, you will be: " ++ show (2025 - birthYear) -- Calculate and print the age
