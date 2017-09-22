#include <spawn.h>
#include <signal.h>
%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)fp8 {
%orig;
pid_t pid;
int status;
const char *argv[] = {NULL, NULL, NULL};
posix_spawn(&pid, "/usr/libexec/flux", NULL, NULL, (char* const*)argv, NULL);
waitpid(pid, &status, WEXITED);
}
%end