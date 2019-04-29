import FooArbitrary
import FooCore
import Test.QuickCheck

main :: IO ()
main = quickCheck $ forAll genFoo $ \foo -> renderFoo foo == "foo"
