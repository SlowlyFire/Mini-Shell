//Gal Giladi
// C Program to design a shell in Linux.
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>

#define MAX_LETTERS 100 // max number of letters to be supported
#define MAX_COMMANDS 100 // max number of commands to be supported
#define MAX_PID 10 // max numbers of letters of PID


// Function where the system command is executed.
void execArgs(char** parsed, char list[][MAX_LETTERS], char pidList[][MAX_PID], int countList)
{
	// fork returns pid of son
	pid_t pid = fork();
	// if fork have failed, returns -1 to pid and print a msg
	if (pid == -1) {
        perror("fork failed");
		return;
	// if fork returns 0 to pid, im in son proccess
	} else if (pid == 0) {
		if (execvp(parsed[0], parsed) < 0) {
			perror("execvp failed");
		}
		exit(0);
	} else {
		// waiting for child to terminate
		wait(NULL);
        sprintf(pidList[countList], "%d", (int)pid);
		return;
	}
}


// Function to execute built-in commands (exit, cd and history).
// returns 1 if its built-in command, and 0 if its system command.
int ownCmdHandler(char** parsed, char list[][MAX_LETTERS], char pidList[][MAX_PID], int countList)
{
	int NoOfOwnCmds = 3, i, switchOwnArg = 0;
	char* ListOfOwnCmds[NoOfOwnCmds];
	ListOfOwnCmds[0] = "exit";
	ListOfOwnCmds[1] = "cd";
	ListOfOwnCmds[2] = "history";

	for (i = 0; i < NoOfOwnCmds; i++) {
		if (strcmp(parsed[0], ListOfOwnCmds[i]) == 0) {
			switchOwnArg = i + 1;
			break;
		}
	}

	switch (switchOwnArg) {
    // exit
	case 1:
        sprintf(pidList[countList], "%d", (int)getpid());
		exit(0);
    // cd
	case 2:
        sprintf(pidList[countList], "%d", (int)getpid());
		chdir(parsed[1]);
		return 1;
    // history
	case 3:
        sprintf(pidList[countList], "%d", (int)getpid());
        int i;
        for( i=0 ; i<=countList ; i++) {
            printf("%s ", pidList[i]);
            printf("%s\n", list[i]);
        }
		return 1;
	default:
		break;
	}
	// if its not built in command
	return 0;
}


// function for parsing command words.
void parseSpace(char* str, char** parsed)
{
	int i;
	for (i = 0; i < MAX_LETTERS; i++) {
		parsed[i] = strsep(&str, " ");
		if (parsed[i] == NULL)
			break;
		if (strlen(parsed[i]) == 0)
			i--;
	}
}

int main(int argc, char ** argv)
{
  	char inputString[MAX_LETTERS], *parsedArgs[MAX_LETTERS];
	int execFlag = 0;
	char list[MAX_COMMANDS][MAX_LETTERS]={""};
    char pidList[MAX_COMMANDS][MAX_PID];
	int countList = 0;
    char* pathList;
    	int i;

	pathList=getenv("PATH");
    for( i=1; i<argc; i++) {
	    strcat(pathList, ":");
        strcat(pathList, argv[i]);
        setenv("PATH", pathList, 1);
    }
        pathList=getenv("PATH");

	while (1) {
		// print shell line
	    printf("$ ");
	    fflush(stdout);
		// get input from user, which is a command
	    scanf(" %[^\n]", inputString);
        // if its not an empty command, save to list (we use it for history function)
       	if (strlen(inputString) != 0) {
            strcpy(list[countList], inputString);
		}

		// process
		parseSpace(inputString, parsedArgs);

        // if ownCmdHandler returns 1, execute built-in command
       	if (ownCmdHandler(parsedArgs, list, pidList, countList)) {
            execFlag = 1;
            countList++; 
           }
		else {
            // else ownCmdHandler returns 0, then execute system command
            execFlag = 0;
            execArgs(parsedArgs, list, pidList, countList);
            countList++;
        }

	} // end while loop

	return 0;
}
