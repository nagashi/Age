-- Import readMaybe for safe parsing

import Data.Char (toLower)
import System.Exit
import Text.Read (readMaybe)

stringToLower :: String -> String
stringToLower str = map toLower str

getInput :: IO Int -- Function getInput is of type IO that returns type Int
getInput = do
  -- Start a do-block for sequential IO actions
  putStrLn "Please enter your birth year or\ntype QUIT to exit"
  inputStr <- getLine

  let lowerCaseString = stringToLower inputStr
  if lowerCaseString == "quit"
    then putStrLn "Exiting..." >> exitSuccess
    else case readMaybe inputStr :: Maybe Int of -- Attempt to read an Int, resulting in Maybe Int.
      Nothing -> do
        putStrLn "Invalid input.  Please try again."
        getInput -- Recursive call to restart the input process.
      Just val -> return val -- Return the valid value within the IO monad.

main :: IO () -- Declare the type of main as an IO action returning unit
main = do
  birthYear <- getInput --  Call the recursive function.
  putStrLn $ "In 2025, you will be: " ++ show (2025 - birthYear) -- Calculate and print the age
