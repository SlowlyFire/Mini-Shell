#!/bin/bash
#Gal Giladi 312491616
path=$1
word=$2
numOfArgs=$#

# check number of arguments passed by
if [ $numOfArgs -lt 2 ] || [ $numOfArgs -gt 4 ]; then
	echo "Not enough parameters"
	exit
fi

# delete all existing .out file
rm -f $path/*.out

# this function compiles all the files in given directory
compile_files_in_directory() {
        result=$( grep -w -c -i $word $file )
        if [ $result -ge 1 ]; then
                # basename now have the file name including the
                # .c suffix
                basename=$(basename $file)
                # basename now have the file name without the
                # .c suffix
                basename=${basename%.*}
                #compile
                cd $path
                gcc -w $basename.c -o $basename.out
                cd $currentDir
        fi
} # end of function

# if we have only 2 arguments, then compile the files in the given directory
if [ $numOfArgs -eq 2 ]; then
  currentDir=$PWD
  for file in $path/*.c; do
	compile_files_in_directory
  done

# else we have 3 arguments, with -r flag, and we compile the files in
# given directory and its subdirectories.
elif [ $numOfArgs -eq 3 ]; then
	currentDir=$PWD
	if [ $3 = "-r" ]; then
		# for loop runs for all the files exists in $path (directory), including
		# files and subdirectories.
		for file in $path/*; do
			# if found a subdirectory in $path (directory), use recursion
			# to compile its files.
			if [ -d $file ]; then
				$0 $file $word "-r"
			elif [ -f $file ]; then
		                # basename now have the file name including the
               			#.c suffix
        		         basename=$(basename $file)
		         	if [[ $basename == *.c ]]; then
				        $0 $path $word
	            		fi
			fi
		done
	fi
fi
