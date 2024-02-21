#/bin/bash

echo "qemu root: $QEMU_ROOT"

# Generate Rust bindings to C API for each architecture
bindgen bindings.h -o bindings/x86_64.rs --no-layout-tests -- -std=gnu11 -I$QEMU_ROOT/build -I$QEMU_ROOT/build/x86_64-softmmu -I$QEMU_ROOT/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I$QEMU_ROOT/target/i386 -I$QEMU_ROOT/tcg/i386 -I$QEMU_ROOT/tcg -DNEED_CPU_H -I$QEMU_ROOT -isystem $QEMU_ROOT/linux-headers -DCONFIG_TARGET=\"x86_64-softmmu-config-target.h\" -DCONFIG_DEVICES="x86_64-softmmu-config-devices.h"

bindgen bindings.h -o bindings/i386.rs --no-layout-tests -- -std=gnu11 -I$QEMU_ROOT/build -I$QEMU_ROOT/build/i386-softmmu -I$QEMU_ROOT/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I$QEMU_ROOT/target/i386 -I$QEMU_ROOT/tcg/i386 -I$QEMU_ROOT/tcg -DNEED_CPU_H -I$QEMU_ROOT -isystem $QEMU_ROOT/linux-headers -DCONFIG_TARGET=\"i386-softmmu-config-target.h\" -DCONFIG_DEVICES="i386-softmmu-config-devices.h"

bindgen bindings.h -o bindings/arm.rs --no-layout-tests -- -std=gnu11 -I$QEMU_ROOT/build -I$QEMU_ROOT/build/arm-softmmu -I$QEMU_ROOT/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I$QEMU_ROOT/target/arm -I$QEMU_ROOT/tcg/arm -I$QEMU_ROOT/tcg -DNEED_CPU_H -I$QEMU_ROOT -isystem $QEMU_ROOT/linux-headers -DCONFIG_TARGET=\"arm-softmmu-config-target.h\" -DCONFIG_DEVICES="arm-softmmu-config-devices.h"

bindgen bindings.h -o bindings/aarch64.rs --no-layout-tests -- -std=gnu11 -I$QEMU_ROOT/build -I$QEMU_ROOT/build/aarch64-softmmu -I$QEMU_ROOT/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I$QEMU_ROOT/target/arm -I$QEMU_ROOT/tcg/aarch64 -I$QEMU_ROOT/tcg -DNEED_CPU_H -I$QEMU_ROOT -isystem $QEMU_ROOT/linux-headers -DCONFIG_TARGET=\"aarch64-softmmu-config-target.h\" -DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"

bindgen bindings.h -o bindings/ppc.rs --no-layout-tests -- -std=gnu11 -I$QEMU_ROOT/build -I$QEMU_ROOT/build/ppc-softmmu -I$QEMU_ROOT/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I$QEMU_ROOT/target/ppc -I$QEMU_ROOT/tcg/ppc -I$QEMU_ROOT/tcg -DNEED_CPU_H -I$QEMU_ROOT -isystem $QEMU_ROOT/linux-headers -DCONFIG_TARGET=\"ppc-softmmu-config-target.h\" -DCONFIG_DEVICES="ppc-softmmu-config-devices.h"

bindgen bindings.h -o bindings/mips.rs --no-layout-tests -- -std=gnu11 -I$QEMU_ROOT/build -I$QEMU_ROOT/build/mips-softmmu -I$QEMU_ROOT/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I$QEMU_ROOT/target/mips -I$QEMU_ROOT/tcg/mips -I$QEMU_ROOT/tcg -DNEED_CPU_H -I$QEMU_ROOT -Ifake_headers -isystem $QEMU_ROOT/linux-headers -DCONFIG_TARGET=\"mips-softmmu-config-target.h\" -DCONFIG_DEVICES="mips-softmmu-config-devices.h"

bindgen bindings.h -o bindings/mipsel.rs --no-layout-tests -- -std=gnu11 -I$QEMU_ROOT/build -I$QEMU_ROOT/build/mipsel-softmmu -I$QEMU_ROOT/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I$QEMU_ROOT/target/mips -I$QEMU_ROOT/tcg/mips -I$QEMU_ROOT/tcg -DNEED_CPU_H -I$QEMU_ROOT -Ifake_headers -isystem $QEMU_ROOT/linux-headers -DCONFIG_TARGET=\"mipsel-softmmu-config-target.h\" -DCONFIG_DEVICES="mipsel-softmmu-config-devices.h"

bindgen bindings.h -o bindings/mips64.rs --no-layout-tests -- -std=gnu11 -I$QEMU_ROOT/build -I$QEMU_ROOT/build/mips64-softmmu -I$QEMU_ROOT/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I$QEMU_ROOT/target/mips -I$QEMU_ROOT/tcg/mips -I$QEMU_ROOT/tcg -DNEED_CPU_H -I$QEMU_ROOT -Ifake_headers -isystem $QEMU_ROOT/linux-headers -DCONFIG_TARGET=\"mips64-softmmu-config-target.h\" -DCONFIG_DEVICES="mips64-softmmu-config-devices.h"

bindgen bindings.h -o bindings/mips64el.rs --no-layout-tests -- -std=gnu11 -I$QEMU_ROOT/build -I$QEMU_ROOT/build/mips64el-softmmu -I$QEMU_ROOT/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I$QEMU_ROOT/target/mips -I$QEMU_ROOT/tcg/mips -I$QEMU_ROOT/tcg -DNEED_CPU_H -I$QEMU_ROOT -Ifake_headers -isystem $QEMU_ROOT/linux-headers -DCONFIG_TARGET=\"mips64el-softmmu-config-target.h\" -DCONFIG_DEVICES="mips64el-softmmu-config-devices.h"

# Remove double-declared constant
sed '/pub const IPPORT_RESERVED: .* = 1024;/d' bindings/x86_64.rs -i
sed '/pub const IPPORT_RESERVED: .* = 1024;/d' bindings/i386.rs -i
sed '/pub const IPPORT_RESERVED: .* = 1024;/d' bindings/arm.rs -i
sed '/pub const IPPORT_RESERVED: .* = 1024;/d' bindings/aarch64.rs -i
sed '/pub const IPPORT_RESERVED: .* = 1024;/d' bindings/ppc.rs -i
sed '/pub const IPPORT_RESERVED: .* = 1024;/d' bindings/mips.rs -i
sed '/pub const IPPORT_RESERVED: .* = 1024;/d' bindings/mipsel.rs -i
sed '/pub const IPPORT_RESERVED: .* = 1024;/d' bindings/mips64.rs -i
sed '/pub const IPPORT_RESERVED: .* = 1024;/d' bindings/mips64el.rs -i
