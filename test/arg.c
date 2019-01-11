int main(int argc, char *argv[], char *envp[]);
int dprintf(int fd, const char * restrict format, ...);

int main(int argc, char *argv[], char *envp[])
{
	dprintf(1, "argc: %d\n", argc);

	for (int i = 0; i < argc; i++) {
		dprintf(1, "argv[%d]: %s\n", i, argv[i]);
	}

	dprintf(1, "env:\n");

	while(*envp)
		dprintf(1, "%s\n",*envp++);

	return 0;
}
