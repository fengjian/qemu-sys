# qemu-sys

Introducing the latest Rust bindings for QEMU, tailored specifically for building secure virtual machine sandboxes. This project aims to provide a seamless interface for leveraging the latest features of QEMU within Rust-based applications, empowering developers to create robust and secure virtualization environments. With these bindings, users can harness the power of QEMU's advanced functionalities to implement secure sandboxing solutions for various use cases, including software testing, malware analysis, and application isolation. Join us in exploring the possibilities of Rust and QEMU for building resilient and secure virtualization infrastructures.

# To update low-level bindings:

0. `cargo install bindgen
1. `export LLVM\_CONFIG\_PATH=/path/where/you/llvm-config
2. `export QEMU\_ROOT=/path/where/you/qemu`
3. `cd src/ && ./gen\_bindings.sh`
