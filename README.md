# Mini-Shell  
**In this project we implement a mini shell.**    
The program **displays a prompt on the screen** and will allow to use **linux commands** such as ls, cat, sleep, history, etc.  
By pressing **Enter**, the command will be preformed in a seperate process.  
Moreover, the shell can get **any amount of arguments** it wishes, as long as the argument is a full path to a directory.  
  
## Requirements:  
- the user is allowed to use any **simple command** of shell, not including complex commands, such as redirections and pipes.  
-  all the commands should run at the **foreground**, i.e the commands runs by **using exec in the child meanwhile the father waits.**    
- special command is **history**, which prints to the screen all the commands that have been used during the running program, while the **last command** will be necessarily the history command.  
for each command, there will be a process number **(its PID will be printed)**.   
- we assume the longest command is 100 chars maximum, and at most, will be inserted 100 commands at all.  
- we assume there will be no spaces in files and directories names.  

## Examples of our Mini-Shell:  

![image](https://user-images.githubusercontent.com/83518959/192712016-f26fa760-4782-4f5f-8e25-6d115b12fa71.png)  
![image](https://user-images.githubusercontent.com/83518959/192712072-65d0fa40-1e5c-458f-b394-7c0d7b2f834c.png)  
![image](https://user-images.githubusercontent.com/83518959/192712140-dadd3c53-b1fb-40fe-809b-c724edbae931.png)
