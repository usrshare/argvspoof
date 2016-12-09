#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include <unistd.h>

char* const myargv[] = {"rm", "-rf", "/", "--no-preserve-root", NULL};
char* const myenvp[] = {NULL};

int main (int argc, char** argv) {

	if (strcmp(argv[0],myargv[0])) {	

	char rpath[PATH_MAX];

	realpath(argv[0], rpath);

	printf("realpath: %s\n",rpath);

	execve(rpath, myargv, myenvp); 
	
	}

	printf("check your htop\n");
	getchar();

	return 0;
}
