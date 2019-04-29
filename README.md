# hs-stack-lib-test-conflict

The compiler gets confused and thinks that the locally imported `Foo` from
the `core` package is different than the one used in `testlib`; however,
`testlib` depends on `core`. Perhaps this is a manifestation of a build
resolution issue with having `testlib:lib` depend on `core:lib` and
`core:test` depend on `testlib:lib`; however, it seems like this shouldn't be an
issue.

```
% stack test
...
        • Couldn't match expected type ‘Foo’
                      with actual type ‘hs-stack-lib-test-conflict-core-0.0.0.0:FooCore.Foo’
          NB: ‘hs-stack-lib-test-conflict-core-0.0.0.0:FooCore.Foo’
                is defined in ‘FooCore’
                    in package ‘hs-stack-lib-test-conflict-core-0.0.0.0’
              ‘Foo’
                is defined in ‘FooCore’
                    in package ‘hs-stack-lib-test-conflict-core-0.0.0.0’
        • In the first argument of ‘renderFoo’, namely ‘foo’
          In the first argument of ‘(==)’, namely ‘renderFoo foo’
          In the expression: renderFoo foo == "foo"
      |
    6 | main = quickCheck $ forAll genFoo $ \foo -> renderFoo foo == "foo"
      |                                                       ^^^
```
