+++
Description = ""
Tags = ["Development", "Haskell"]
date = "2015-10-13T10:46:54+02:00"
title = "Foldable for non-Haskellers: Haskell's controversial FTP proposal"
+++

In the Haskell world, there is currently a big fuss about
[the "Foldable/Traversable in Prelude"-proposal](https://wiki.haskell.org/Foldable_Traversable_In_Prelude).

**Edit:** For the record: it **was** a proposal, and has been implemented in the current version of Haskell (GHC)

As a non-Haskeller, you probably wonder what all the fuss is about.

## First things first: some context

In most languages, you have functions to iterate over a `sequence` / `array` / `iterable` / `list`, for example in C# (assuming we have an array called `values`)

```C#
int[] values = new int[] {1, 2, 3};

foreach(var v in values) {
  Console.WriteLine(v);
}
```

In Haskell, we usually refer to an `sequence` with a `list`, and the example code would look like this:

```Haskell
values = [1,2,3]

mapM_ print values
```

Let's say we need a function that concatenates several sequences of the type `a`.

In somewhat contrived C# we would write it like this (assuming we use arrays):

```C#
static Ta[] Concat<Ta>(Ta[][] values) {
    var res = new Ta[]{};
    foreach(var v in values) {
        res = res.Concat(v).ToArray();
    }
    return res;
}

int[][] values = new int[][] {
    new int[] {1, 2, 3},
    new int[] {4, 5, 6}
};

Concat(values);
// results in [1,2,3,4,5,6]
```
In Haskell we'd write it like this:

```Haskell
values :: [[Int]]
values = [[1,2,3],[4,5,6]]

concat :: [[a]] -> [a]
concat vals = foldr (\val acc -> val ++ acc) [] vals

concat values
-- results in [1,2,3,4,5,6]
```
> ### Optional reading: type definitions
>
> The odd `someName :: a -> b -> c` you see on top of the function implementations is a type definition.
>
> - The thing before the `::` defines the name of the function
> - The last term defines the type of return value.
> - Other terms define type of the function's parameters.
>
> A few examples:
>
> - `value :: Int`
>    - Takes no input
>    - Returns a value of the type `Int`
>    - Example: `value = 5`
> - `values :: [Int]`
>    - Takes no input
>    - Returns a `list` of values of the type `Int`
>    - Example: `values = [1,2,3]`
> - `values :: [[Int]]`
>    - Takes no input
>    - Returns a `list` of a `list` of values of the type `Int`
>    - Example: `values = [[1,2,3],[4,5,6]]`
> - `decrement :: Int -> Int`
>   - Takes a parameter of the type `Int`
>   - Returns a value of the type `Int`
>   - Example: `decrement x = x - 1`
> - `add :: Int -> Int -> Int`
>   - Takes two parameters of the type `Int`
>   - Returns a value of the type `Int`
>   - Example: `addTwoInts x y = x + y`
> - `length :: [a] -> Int`
>   - Takes a `list` of `a` where `a` can be any type
>   - Returns a value of the type `Int`
>   - This function works on any `list`, no matter which is the type of `a`:
>       - `length [4,5,6]` returns `3`
>       - `length ['a','b','c']` also returns `3`
>       - `length "abc"` also returns `3`, as a `String` is a synonym for a `list` of `Char`
> - `decrement :: Num a => a -> a`
>   - Requires a type `a` to implement the `Num` type class.
>      - A `type class` is somewhat similar to an `interface` in other languages.
>      - The type class `Num` implements arithmetic operators for the type.
>   - Takes a parameter of the type `a`
>   - Returns a value of the type `a`
>   - Example: `decrement x = x - 1`.
>
>Now back to the main content...

## What is a `Foldable` anyway

Notice that in the Haskell example the `concat` function is defined for a `list` of `lists`, i.e. `concat :: [[a]] -> [a]`.

There is a well known functional paradigm called a `fold`, which allows you to convert something that has multiple values into a single value.

Let's take the example of a `sum`:

- Starts with an initial `accumulator` value of `0`
- Adds each of the sequence's `values` one by one to the `accumulator`
- returns the final `accumulator`.

This would be the code:

```Haskell
sum :: Num a => [a] -> a
sum vals = foldl (\acc val -> acc + val) 0 vals

product :: Num a => [a] -> a
product vals = foldl (\acc val -> acc * val) 1 vals
```

Now, imagine that you have a `binary tree structure` where a `node` contains either:

- a node with a left and a right child node
- a leaf with a value
- an empty node:

```Haskell
data Tree a = Node (Tree a) (Tree a)
            | Leaf a
            | Empty
```

And that you need to get the sum and product for all these leaves. This goes as follows:

- `acc` refers to `the currently accumulated value`
- `ln` refers to a `left child node`
- `rn` refers to a `right child node`
- `val` refers to a `value of a leaf node`

If it's a `node`, the `XXXacc` recursively calls itself to add or multiply it's children's values,
if it's a leaf, it just adds/multiplies the value with the accumulator.

```Haskell
sum :: Num a => Tree a -> a
sum tree = sumAcc tree 0
  where
    sumAcc node acc =
      case node of
        Leaf val   -> acc + val
        Node ln rn -> acc + (sumAcc ln) + (sumAcc rn)
        Empty      -> acc

prod :: Num a => Tree a -> a
prod tree = prodAcc tree 1
  where
    prodAcc node acc =
      case node of
        Leaf val   -> acc * val
        Node ln rn -> acc * (prodAcc ln) * (prodAcc rn)
        Empty      -> acc
```

You might see a pattern here. Haskellers **hate** copy paste programming, so they extract what is common.

If you take a look at what is common and different, you see only two differences:

- We use `+` and `*`
- We start from `0` and `1`

So a Haskeller would extract this functionality, and as this is a common pattern, we'd call it a `Foldable` type class instance. Code would look like this

```Haskell
data Tree a = Node (Tree a) (Tree a)
            | Leaf a
            | Empty

instance Foldable Tree where
  -- some code here

sum :: Num a => Tree a -> a
sum tree = foldl (\acc val -> acc + val) 0 tree

prod :: Num a => Tree a -> a
prod tree = foldl (\acc val -> acc * val) 1 tree
```

> ### Optional reading: cleaning up Haskell code
>
> Even though this is compilable Haskell code, and the program would work, you would never see
> Haskell code like this in the wild. Haskellers apply some concepts to make the source
> code even leaner to read; let me show you how:
>
> - Let's take a look at this expression:
>   - `sum tree = foldl (\acc val -> acc + val) 0 tree`
> - The type declaration is `sum :: Num a => Tree a -> a` so we know the function
>     - Requires `a` to implement the `Num` type class.
>     - Takes a `Tree` that contains values of the type `a`
>     - Returns a value of the type `a`
> - In Haskell you can "convert operators into functions" by putting parenthesis around them, so
>   - `\acc val -> acc + val` is equivalent to  `\acc val -> (+) acc val`
>   - The type for this accumulator function is `Num a => a -> a -> a`
> - As both parameters now have the same order, we can apply a concept called currying (i.e. omit the last parameters if they are the same), so
>   - `\acc val ->  (+) acc val` is equivalent to `\acc -> (+) acc`.
>   - The type for this accumulator function remains `Num a => a -> a -> a`
> - we curry it once more, so
>   - `\acc ->  (+) acc` is equivalent to `\ -> (+)`.
>   - The type for this accumulator function remains `Num a => a -> a -> a`
> - Calling a function with no parameters is the same as calling the function directly, so
>   - `\ -> (+)` is equivalent to `(+)`
>   - The type for this accumulator function remains `Num a => a -> a -> a`
> - Replacing this in the original declaration, we now we end up with
>   - `sum tree = foldl (+) 0 tree`
>   - The type declaration still is `sum :: Num a => Tree a -> a`
> - As the function's parameters are similar once again, we can omit the `tree` part, so
>   - `sum tree = foldl (+) 0 tree` is equivalent to `sum = foldl (+) 0`
>   - The type declaration still is `sum :: Num a => Tree a -> a`
>
> So a Haskeller would most likely end up with the following code, while maintaining the same types:
>
>
> ```Haskell
>data Tree a = Node (Tree a) (Tree a)
>            | Leaf a
>            | Empty
>
>instance Foldable Tree where
>  -- some code here
>
>sum :: Num a => Tree a -> a
>sum = foldl (+) 0
>
>prod :: Num a => Tree a -> a
>prod = foldl (*) 1
>```

>
> #### This has one important consequence when you are doing Haskell:
> In order to figure out what parameters a function requires, you need to look at it's type
declaration, and not at the implementation.
>
>So both the `sum` and the `product` take a `Tree` of `a`, and return an `a`, where `a` implements the `Num` type class. This is the reason why Haskellers care so much about type definitions.

## Back to the controversial `FTP`-proposal

Haskell works with a system they call `modules` (referred to as `namespaces` in other languages).

By default, Haskell applications import a module called `Prelude`, which contains a lot of handy helper functions, for example the `sum` function we mentioned in the beginning :

```Haskell
sum :: Num a => [a] -> a
sum = foldl (+) 0
```

Now, as Haskellers do not only want to use `sum` on a `list`, but also on any `Foldable` instance, they decided to change the type signature to this:

```Haskell
sum :: (Foldable t, Num a) => t a -> a
sum = foldl (+) 0
```
Because there exists a `Foldable` instance for a  `list`, we can use the "Foldable `sum`" function, and remove the `sum` function that only works on lists.

## So what is controversial about this proposal?

<strike>People come from different backgrounds. When you talk about a `list`, people new in Haskell think about a sequence, and they can imagine what is happening.

However, due to the new signature (i.e. the `Foldable` thing), people new to Haskell might have a hard time to get started with Haskell, because they need to learn about
the concept of `Foldable` first, so the barrier of entry is getting larger.


In my opinion, it might be a little harder to grasp at first, but if, as a beginner, you are willing to just accept a few things without knowing why they are like they are,
the barrier to entry shouldn't be much higher than before.</strike>

### UPDATE

I assumed I understood what all the fuss was about, but apparently I did not. Luckily, [@bitemyapp](https://twitter.com/bitemyapp) went the extra mile to explain while it was wrong:

<blockquote class="twitter-tweet" lang="nl"><p lang="en" dir="ltr">Either and (,) in Haskell are not arbitrary&#10;&#10;<a href="https://t.co/2yJ1NBjMvS">https://t.co/2yJ1NBjMvS</a></p>&mdash; Chris Allen (@bitemyapp) <a href="https://twitter.com/bitemyapp/status/656273487267389440">20 oktober 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I'd suggest you to read his article, but I'll give you the recap here:

Next to a `Foldable`, we also have a `Functor`. A `Functor` is something that you can `map over`, a structure that contains zero, one or more values. An example in GHCI:

```Haskell
Prelude> let inc = (1 +)
Prelude> inc 5
6
Prelude> fmap inc [1,2,3]
[2,3,4]
Prelude> fmap inc (Just 5)
Just 6
Prelude> fmap inc Nothing
Nothing
Prelude> fmap inc (Right 4)
Right 5
Prelude> fmap inc (Left 3)
Left 3
```

Just think of this as a `map` or `select (C#)` statement. In the example above we have the following statements:

- `let inc = (1 +)`
  - is of the type `inc :: Num a => a -> a`, so it takes a `Num` instance, and adds `1` to it?
- `inc 5`
  - returns `6`
- `fmap inc [1,2,3]`
  - returns `[2,3,4]`
  - the container is a `List`, and the values in the list are `Num` instances.
  - the type signature for `fmap` is : `fmap (a->b) -> [a] -> [b]`
  - `fmap` takes a transformation function and a list, and returns a `List` containing the transformed values in the same order.
  - For a `list`, Haskell's `fmap` is equivalent to `map`, which is equivalent to a C# `select` statement.
  - In C#, `fmap` could be implemented for a list as `List<Tb> fmap<Ta,Tb>(Func<Ta,Tb> transform,List<Ta> list) => list.Select(transform).ToList()`.
  - `Bifunctors`:
    - The `Maybe` type is a type that either represents a value or nothing.
      - this type was introduced to avoid null checking in all of your code.
      - values are represented using `Just a` where a can be any value.
      - nothing is represented using `Nothing`.
      - when you want to change the value of a `Maybe`, you typically only want to change it, when it contains a value. If it does not contain a value, you just want to do nothing with it.
      - how do we change the value of something in a container when using Haskell? Exactly: using `fmap`
      - `fmap inc (Just 5)`
        - returns `Just 6`, so it applied the `inc` function to the value of the `Maybe`
      - `fmap inc Nothing`
        - returns `Nothing`, because it doesn't make any sense to apply changes to a "null value"
      - let's say we have a var called `maybeVal`, that has the type `Maybe Num`, so it is either `Nothing` or `Just x` where x is a number.
      - if we want to either increment the value if it's defined, or just return a `0` if it is not, we could do it like this:
      - `maybe 0 inc maybeVal`
        - if `maybeVal` is `Nothing` it uses the first argument : `0`
           - `maybe 0 inc Nothing` returns `0`
        - if `maybeVal` has a value (`Just 5`), it applies the `inc` function to the value and returns that value, i.e. `6`
          - `maybe 0 inc (Just 5)` returns `6`
        - `fmap` is the `Functor` implementation, `maybe` is the `Bifunctor` implementation.
    - the `Either` type
      - Now, avoiding `null` checks everywhere is fun and all, but what if you would like to return some kind of error message in case a value is not defined?
      - For this we have the `Either a b` type, that can return 2 different types:
        - It can `Left a`, where `Left a` is typically an error message
        - It can return a `Right b`, where `Right b` is similar to a `Just b`, so this contains the value.
        - Let's say we have a function to parse a `date` from a `string`. We want it to return either the date, or an error message.
          - this would be the type of the function: `parseDateFromString :: String -> Either Error Date`
          - this would be equivalent to `Either<Error,Date> parseDateFromString(String)`
          - in case there is a problem with the parsing we'd get return value like this: `Left (Error "Invalid date format; expected YYYY/MM/DD")`
          - in case there is no problem  with the parsing we'd get the value like this: `Right (Date 2015 10 20)`
        - What if we would like to print the year if it's a valid year, or display the error when it is not? Let's assume we have a value `eitherErrorOrDate`
          - we would call `either displayError printYear eitherErrorOrDate`
            - the type of `eitherErrorOrDate` would be `Either Error Date`
            - for now, just take my word for it: a type of `IO ()` means: `something that interacted with the outside world, but didn't return any value`
            - the type of the function `displayError` would be `Error -> IO ()`, so it takes an error, and implies a changed world when executed.
            - the type of the function `printYear` would be `Date -> IO ()`, so it takes an error, and implies a changed world when executed.

### Now what's wrong with the controversial FTP proposal:

In a `Maybe` or an `Either`, it makes sense that you only want to `map` to the `Just` value or the `Right` value.

Now, let's say you have a `Tuple`, and would map over this:

- A tuple has the type `(a,b)`
- So when you `fmap` `inc` over `(1,2)`, you'd expect a `(2,3)`, correct?
- Well, you don't : GHCI returns a `(1,3)`
- This is because a tuple can contain 2 different types, f.e. `("Hello",4)`
- As an `fmap` can only take one type as an input parameter, they decided to go for the second element, so `fmap inc ("Hello",4)` returns `("Hello", 5)`.
- This doesn't make sense, as the first element might be just as important in a tuple as the other, so this shouldn't have been a `Functor` in the first place.

Thank you Chris for taking the time to explain this!
