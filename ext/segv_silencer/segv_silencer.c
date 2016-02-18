#include "segv_silencer.h"
#include <signal.h>
#include <unistd.h>

VALUE rb_mSegvSilencer;
static struct sigaction org_segv_action;

static void
silent_segv_action(int signum)
{
    VALUE message = rb_iv_get(rb_mSegvSilencer, "@message");
    if(message != Qnil){
        fprintf(stderr, "%s\n", StringValuePtr(message));
    }
    fclose(stdout);
    fclose(stderr);
    VALUE file = rb_iv_get(rb_mSegvSilencer, "@file");
    if(file != Qnil){
        stderr = fopen(StringValuePtr(file), "w");
    }
    sigaction(signum, &org_segv_action, NULL);
    kill(getpid(), signum);
}

void
Init_segv_silencer(void)
{
    struct sigaction segv_action;
    rb_mSegvSilencer = rb_define_module("SegvSilencer");
    segv_action.sa_handler = silent_segv_action;
    sigemptyset(&segv_action.sa_mask);
    segv_action.sa_flags = 0;
    if(sigaction(SIGSEGV, &segv_action, &org_segv_action) == -1){
        rb_sys_fail("Failed to set silent SEGV handler");
    }
}
