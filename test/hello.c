int main(int argc, char *argv[], char *envp[]);
char *gets_s(char *s, int size);
int dprintf(int fd, const char * restrict format, ...);
#define NULL 0

int main(int argc, char *argv[], char *envp[])
{
	char input[21];

	dprintf(1, "What is your name?\n");

	if(NULL == gets_s(input, 21)) {
		return 0;
	}

	dprintf(1, "Hello, %s!\n", input);

	return 0;
}
