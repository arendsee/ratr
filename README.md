# ratr

An R package wrapper for Rat

# Status

This package is highly unstable. It is a wrapper for `rat`, a language that is
not fully specified and whose compiler only has a subset of the full
functionallity implemented. `rat` compiles `rat` language into a intermediate
instructions, which are then translated into R code by the R backend. Language
requirements are driven by `pied`, a workflow package.

A quick example:

rat code:
```
(A --> B) (C --> D) --> E
```

Where A, B, C, D, and E are function classes.

The rat compiler frontened translates this into an intermediate language:
```
emit  A    A_1
emit  B    B_2
link  B_2  A_1
emit  C    C_3
emit  D    D_4
link  D_4  C_3
emit  E    E_5
link  E_5  B_2  D_4
```

Where `A_1` is an instance of `A`.

The `rat` R backend then translates this into the following R code

```
A_1 <- A()
B_2 <- B()
B_2 <- link(B_2, A_1)
C_3 <- C()
D_4 <- D()
D_4 <- link(D_4, C_3)
E_5 <- E()
E_5 <- link(E_5, B_2, C_4)
```

This code can then be evaluated in R. The function class A, B, C, D, and E must
be in scope, along with the `link` function.

This example will be out-of-date by early this afternoon, but it shows the
basic approach.

`ratr` passes the rat code to the rat compiler and receives the R code as
a character vector. I may package the code a bit, perhaps add handling for
plotting the function graph. Maybe I'll add some checking. I cannot, however,
evaluate the code within `ratr`, since the function classes will be defined in
the code that calls ratr. Therefore, the onus of implementing `link` and the
function classes lies with the user.
