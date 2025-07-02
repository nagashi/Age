import Text.Read (readMaybe) -- Import readMaybe for safe parsing

main :: IO () -- Declare the type of main as an IO action returning unit
main = do -- Start a do-block for sequential IO actions
  putStrLn "Please enter your birth year" -- Display a prompt to the user
  year <- getLine -- Read a line from standard input into the variable 'year'

  case readMaybe year :: Maybe Int of -- Safely attempt to parse the input 'year' as an integer
    Nothing -> putStrLn "You provided an invalid year" -- Handle the case where parsing fails
    Just birthYear -> -- If parsing is successful, bind the integer to 'birthYear'
      putStrLn $ "In 2025, you will be: " ++ show (2025 - birthYear) -- Calculate and print the age
