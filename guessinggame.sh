#function for guess evaluation--------------------------------------
#compares two parameter numbers, 1st the guess 2nd the true value
#outputs "Too low!", "Too high!" or "Correct!" as a result

function eval_guess {
   local n=$1
   local N=$2

   if [[ n -lt N ]]
   then
      echo "Too low!"
   elif [[ n -gt N ]]
   then
      echo "Too high!"
   else
      echo "Correct!"
   fi
}
#-------------------------------------------------------------------
#function for numeric input
#prompts input until number is entered

function enter_number {
   echo "Enter a number:"
   read n
   #testing for numeric input
   while  [[ ! $n =~ ^[0-9]+$  ]]
   do
      echo "Numeric input please!"
      read n
   done
}

#--------------------------------------------------------------------
#initial guess
echo "Guess the number of files in current directory:"
enter_number

#true number of files in current directory (and subdirectories included)
N=$(ls -Rl|grep "^-.*"|wc -l)

#guess evaluation
evg=$(eval_guess $n $N)
echo "Your guess is: $evg"

#guessing cycle
while [[ $evg != "Correct!" ]]
do
   enter_number
   evg=$(eval_guess $n $N)
   echo "Your guess is: $evg"
done

echo "Congratulations!"




