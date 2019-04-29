module FooCore where

data Foo = Foo

renderFoo :: Foo -> String
renderFoo = const "foo"
