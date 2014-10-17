#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	// set-up
	int digit;

	// internal functions
	int isint(char *arg);

	// external functions
	extern int triple(int);
	extern int log2i(int);
	extern float avgarray(int[],int); // need to change int->float!!
	extern int isprime(int);
	extern int caller(int);
	
	// argv[0] == .exe name
	// check that there are at least two given arguments
	if (argc < 3) {
		printf("usage error");
		return 0;
	}

	// check that the second arg is a valid int
	// if 1 continue, if 0 complain
	if (isint(argv[2]) == 0) {
		printf("usage error");
		return 0;
	}

	// call the desired function and print out the result
	if (strcmp(argv[1],"triple") == 0) {
		printf("%d\n",triple(atoi(argv[2])));
	}
	else if (strcmp(argv[1],"log2i") == 0) {
		printf("%d\n",log2i(atoi(argv[2])));
	}
	else if (strcmp(argv[1],"avgarray") == 0) {
		// get the given length and initialize the array
		int givenlen = atoi(argv[2]);
		int *full_arr;
		int arr[givenlen];
		
		// set all array elms to 0
		for (int i = 0; i < givenlen; i++) {
			arr[i] = 0;
		}
		// write in all valid entries, print usage error otherwise
		for (int i = 3; i < argc; i++) {
			if (isint(argv[i]) == 0) {
				printf("usage error");
				return 0;
			}
			else {
				arr[(i-3)] = atoi(argv[i]);
			}
		}

		full_arr = arr;

		printf("%f\n", avgarray(full_arr, givenlen));
	}
	else if (strcmp(argv[1],"isprime") == 0) {
		printf("%d\n",isprime(atoi(argv[2])));
	}
	else if (strcmp(argv[1],"caller") == 0) {
		printf("%d\n",caller(atoi(argv[2])));
	}
	else {
		printf("usage error");
	}


	return 0;
}
// isint takes in a char argument and determines whether or not it is an int
// ret 1 = true, ret 0 = false
int isint(char *arg) {
	// library function
	int isdigit(int c);
	
	// utilize isdigit for every char in the arg
	int digit = 0;
	for (int i = 0; i <= (strlen(arg)-1); i++) {
		// account for the possibility of minus signs
		if ((isdigit(arg[i]) == 0) && (arg[i]!='-')){
			digit = 1;
		}
	}
	if (digit == 1) {
		return 0;
	}
	return 1;
}
