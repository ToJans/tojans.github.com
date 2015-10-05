+++
Categories = ["Development", "Haskell"]
Description = "A Haskell implementation of the hangman game"
Tags = ["Development", "Haskell"]
date = "2015-10-04T10:23:42+02:00"
title = "Hangman in Haskell"
slug ="hangman-in-haskell"

+++

As I noticed a [question for a more idiomatic **Haskell** version of the game **Hangman** on
codereview.stackoverflow.com](http://codereview.stackexchange.com/questions/106485/hangperson-in-haskell?atw=1),
 I decided to give it a go; this is the result:

### Note

This article has been [posted on Reddit's Haskell channel](https://www.reddit.com/r/haskell/comments/3nfook/my_version_of_hangman_in_haskell_feedback_welcome/), and gradual improvements were made on this article
based on tips in the threads, so feel free to check these.

## Tips

Most idiomatic Haskell code I see has a very high **signal to noise ratio**. In your code I have to read every single line and figure out what it does in my head.

You can achieve this by making a lot of tiny functions (after all, **composition is key** for a functional program), and use as much of the **domain language** as possible. These tiny functions don't need to stand on their own; using `let x=... in ...` or `where x=...` tends to help a lot.

Also, try to figure out what state you need to keep, and name it. I see a lot of functional programmers design their apps **types-first**. Having an explicit model that doesn't allow faulty state tends to help big-time.

Make sure you don't add state you can calculate from other state, use functions for that, otherwise your data structure might get inconsistent. Old dogs refer to this as **normalisation**. Normalisation used to be
a necessity because storage was expensive back in the days, but not any longer. However, in code, it is better
to still respect this rule.

AFAIK tuples should mostly be used inside functions, but never exposed, except maybe for the most trivial cases like key-value pairs, and even that is debatable... After all, how much work is it to define `data KeyValuePair a b= KeyValuePair a b`?

I am by no means an expert in Haskell, and learned these rules from doing mostly object-oriented programming. However, in a functional language these rules tend to be way easier to implement.

About operator shortcuts etc: I don't use them a lot - yet -, unless the Haskell linter suggests me to use it.

I do think that using a tool like `ghc-mod` and `hlint` is a necessity for Haskell development.

**TL;DR: use proper types, extract parts into smaller functions, and try to properly name them.**

<script src="https://gist.github.com/ToJans/e97db3b4ed3902677361.js"></script>
