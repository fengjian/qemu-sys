#pragma once


#if defined(UNUSED)
#elif defined(__GNUC__)
#define UNUSED(x) x __attribute__((unused))
#elif defined(__LCLINT__)
#define UNUSED(x) /*@unused@*/ x
#else
#define UNUSED(x) x
#endif

#include "qemu/typedefs.h"
#include "qemu/osdep.h"
#include "qemu/log.h"
#include "cpu.h"
#include "sysemu/kvm.h"
#include "sysemu/hw_accel.h"
#include "sysemu/runstate.h"
#include "sysemu/cpus.h"
#include "exec/exec-all.h"
#include "exec/gdbstub.h"
#include "qemu/qemu-plugin.h"
#include "accel/kvm/kvm-cpus.h"
#include "exec/tb-flush.h"

#include <linux/kvm.h>
