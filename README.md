# argvspoof - a small example of process name spoofing

This is a tiny program that, when launched, uses execve() to relaunch itself with a modified list of arguments that, in this particular case, pretends to be an "rm -rf / --no-preserve-root" command (which, usually would be busy deleting every file it can find).

While the true executable file name can be revealed by using the "c" parameter of the "ps" command, tools like htop will trust the argument list instead and show this process as "rm -rf / --no-preserve-root".
