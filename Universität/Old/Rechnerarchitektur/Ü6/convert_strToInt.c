#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <inttypes.h>

#define RED		"\033[31m"
#define DEFAULT "\033[39m"

#define BOLD	"\033[1m"
#define RESET	"\033[0m"

#define STR_LEN	50

extern int64_t strToInt(const char*, uint8_t);

int main(int argc, char* argv[]) {
	if(argc < 3) {
		printf(BOLD RED "Not enough arguments!\n" RESET);
		return EXIT_FAILURE;
	}

	char* end = NULL;
	uint64_t base = strtoul(argv[2], &end, 10);
	if(*end || base > 255) {
		printf(BOLD RED "No valid base: %s\n" RESET, argv[2]);
		return EXIT_FAILURE;
	}

	int64_t val = strToInt(argv[1], (uint8_t)base);
	printf("Integer: %"PRId64"_10\n", val);

	return EXIT_SUCCESS;
}
