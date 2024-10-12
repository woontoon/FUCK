## Compiler terms

- **Region** - op sequence in curly braces
- **Block** - arbitrarily defined partition of a region with any amount of exit points
- **Basic block** - block with one exit point
- **Label** - Marker for jump, branch, or loop target, usually defining the entry point for a basic block
    - Shown with ^, e.g. ^bb1 for the first basic block
- **Control flow graph** - representation of possible paths through a program during execution
- **Loop rolling & unrolling** - technique to optimise loops by minimising loop control overhead
    - Loop rolling refers to normal loops where the loop control and the loop body executes for each iteration
    - Loop rolling eg. Basic for loop that prints values 0 to 3 by incrementing a counter and checking the counter each loop
    - Loop unrolling refers to an optimisation technique for loops that involves minimising the execution of loop control by duplicating the loop body multiple times within a loop, or entirely flattening it
    - Loop unrolling eg. Basic for loop is fully unrolled by printing the values 0 to 3 individually, eliminating the necessity of the loop
    - Loop partial unrolling refers to duplicating a loop body by combining two iterations into one and cutting down the need for an extra iteration, but not necessarily removing the need for the loop
- **Loop flattening** - technique to optimise nested loops by simplifying it into a single loop
    - Done in cases where loops may be independent or if indices can be mapped in a more straightforward way
- **Abstract Syntax Tree** - Tree representation of a program that is syntax agnostic
- **Pattern Rewriting** - allows repeatedly applying transformations to an IR substructure until that substructure is removed
    - Rewrite patterns are subclasses of the OpRewritePattern class
    - Pattern matching and transformations are done by the matchAndRewrite method, which returns a wrapper around a boolean indicating success/failure
    - Multiple patterns can be applied in one pass if they are collected in a PatternSet, where the benefit argument determines the order patterns are applied in

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
- **walk** - traverses the abstract syntax tree of a program
    - May have to be used for transformations over the pattern rewrite engine if the transformation is not local
    - More difficult than pattern rewriting

