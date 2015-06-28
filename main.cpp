#include <ppapi_simple/ps_main.h>

/* Can be any name. */
int ppapi_simple_main(int argc, char* argv[]) {
	return 0;
}

/* Register it. */
PPAPI_SIMPLE_REGISTER_MAIN(ppapi_simple_main)