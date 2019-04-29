module FooArbitrary where

import FooCore
import Test.QuickCheck

genFoo :: Gen Foo
genFoo = pure Foo

instance Arbitrary Foo where arbitrary = genFoo
