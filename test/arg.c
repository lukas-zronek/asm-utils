int main(int argc, char *argv[], char *envp[]);
int fprintf(int fd, const char * restrict format, ...);

int main(int argc, char *argv[], char *envp[])
{
	fprintf(1, "argc: %d\n", argc);

	for (int i = 0; i < argc; i++) {
		fprintf(1, "argv[%d]: %s\n", i, argv[i]);
	}

	fprintf(1, "env:\n");

	while(*envp)
		fprintf(1, "%s\n",*envp++);

	return 0;
}
