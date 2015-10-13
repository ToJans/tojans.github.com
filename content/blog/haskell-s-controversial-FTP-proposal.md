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

In most languages, you have functions to iterate over arrays, for example in C# (assuming we have an array called `values`)

```C#
foreach(var v in values) {
  Console.WriteLine(v);
}
```

In Haskell, we refer to an `array` with the term `list`, and the example code would look like this:

```Haskell
mapM_ print values
```

Let's say we need a function that concatenates several arrays of the type `a`.

In somewhat contrived C# we would write it like this:

```C#
static Ta[] Concat<Ta>(Ta[][] values) {
    var res = new Ta[]{};
    foreach(var v in values) {
        res = res.Concat(v).ToArray();
    }
    return res;
}

int[][] values = new int[][] {
    new int[] {1,2,3},
    new int[] {4,5,6}
};

Concat(values);
// results in [1,2,3,4,5,6]
```
In Haskell we'd write it like this:

(Note to Haskellers: Haskell code is written to be as readable as possible for non-Haskellers, so no currying etc)

```Haskell
concat :: [[a]] -> [a]
concat vals = foldl (\acc val -> acc ++ val) [] vals

values = [[1,2,3],[4,5,6]]

concat value
-- results in [1,2,3,4,5,6]
```

## What is a `Foldable` anyway

Notice that in the Haskell example the `concat` function is defined for a `list` (i.e. `array` in other languages).

There is a well known functional paradigm called a `fold`, which allows you to convert something that has multiple
instances into a single instance; for example a `sum` : it starts with an initial `accumulator` value of `0`, takes
`multiple numbers`, adds each of these numbers' `values` one by one to the `accumulator` and returns the final `accumulator`.

```Haskell
sum :: Num a => [a] -> a
sum vals = foldl (\acc val -> acc + val) 0 vals

product :: Num a => [a] -> a
product vals = foldl (\acc val -> acc * val) 1 vals
```

Now, imagine that you have a `binary tree structure` where a `node` contains either `a left and a right node` or `a leaf with a value` or an `empty node`:

```Haskell
data Tree a = Node (Tree a) (Tree a)
            | Leaf a
            | Empty
```

And that you need to get the sum and product for all these leafs. This goes as follows:

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

So a Haskeller would extract this functionality, and as this is a common pattern, we'd call it a `Foldable` class instance. Code would look like this

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

And due to currying real Haskell code would be even shorter:

```Haskell
data Tree a = Node (Tree a) (Tree a)
            | Leaf a
            | Empty

instance Foldable Tree where
  -- some code here

sum :: Num a => Tree a -> a
sum = foldl (+) 0

prod :: Num a => Tree a -> a
prod = foldl (*) 1
```

## Back to the controversial `FTP`-proposal

Haskell works with a system they call `modules` (referred to as `namespaces` in other languages).

By default, Haskell applications import a module called `Prelude`, that contains a lot of handy helper functions, for example the `sum` function we mentioned in the beginning :

```Haskell
sum :: Num a => [a] -> a
sum = foldl (+) 0
```

Now, as Haskellers do not only want to use `sum` on a `list` (i.e. `array`), but also on any `Foldable` instance, they decided to change the type signature to this:

```Haskell
sum :: (Foldable t, Num a) => t a -> a
sum = foldl (+) 0
```
Because there exists a `Foldable` instance for a  `list`, we can use the "Foldable `sum`" function, and remove the `sum` function that only works on lists.

## So what is controversial about this proposal?

People come from different backgrounds. When you talk about a `list`, people new in Haskell think about an `array`, and they can imagine what is happening.

However, due to the new signature (i.e. the `Foldable` thing), people new to Haskell might have a hard time to get started with Haskell, because they need to learn about
the concept of `Foldable` first, so the barrier of entry is getting larger.

In my opinion, it might be a little harder to grasp at first, but if, as a beginner, you are willing to just accept a few things without knowing why they are like they are,
the barrier to entry shouldn't be much higher than before.
