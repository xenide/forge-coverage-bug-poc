# forge coverage `vm.accesses` bug

To reproduce bug, run:

```shell
forge test
```

You will see that all tests pass, with only one storage read being recorded. Now, run:

```shell
forge coverage
```

You will see that the number of accesses recorded is now 2. If you do a print of the accesses, you will see that it's a
duplicated entry. This only happens when the mapped type is a struct. The length of the access seem to correspond to
the number of items in the struct.
