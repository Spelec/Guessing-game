all: README.md

README.md: guessinggame.sh
	echo "*The Guessing Game*" > README.md
	echo "-------------------" >>README.md
	echo -n "1. Last make run: " >> README.md
	date >> README.md 
	echo -n "2. Number of lines in source file is: " >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md
