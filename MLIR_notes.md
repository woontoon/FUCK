## Compiler terms

- **Region** - op sequence in curly braces
- **Block** - arbitrarily defined partition of a region with any amount of exit points
- **Basic block** - block with one exit point
- **Label** - Marker for jump, branch, or loop target, usually defining the entry point for a basic block
    - Shown with ^, e.g. ^bb1 for the first basic block
- **Control flow graph** - representation of possible paths through a program during execution

## Utilities

- **Lit** - testing util. Tests are written as commented RUN commands, e.g:
    // RUN: mlir-opt %s -canonicalize [some IR here]
    - Configured in python
    - Shell commands are passed
    - Only the return value of the RUN command is tested for passing or failing
- **FileCheck** - util for output validation via the commented CHECK command, e.g:
    // CHECK: %0 = "some.op"{} : {} -> i32
    - Asserts using regex
    - Configured with a DSL that consists of CHECK-[SOMETHING] commands

