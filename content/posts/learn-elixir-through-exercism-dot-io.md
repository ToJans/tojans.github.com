---
layout: post
date: "2013-07-27"
slug: "learn-elixir-through-exercism-dot-io"
title: "Learn Elixir (or Ruby, Javascript, Clojure) through exercism.io"
comments: true
categories: 
---
I am currently in the process of improving my [Elixir](https://elixir-lang.org) skills
using the site [Exercism.io](https://exercism.io). 

## What's Exercism.io?

Exercism.io is a really neat concept: it provides you a platform to learn a new development language, where you get feedback on your exercises from other users who previously succeeded in completing the exercise.

## How does it work?

It works using a command line tool to manage things on your machine, and the website, where users provide feedback on your code, and you provide feedback on the code from other people if you completed the exercise previously.

![My Exercism.io dashboard](https://i.snag.gy/Lw7K4.jpg)

I will walk you briefly through the steps here.

#### Get a new exercise

`exercism fetch`

This creates a folder for the next exercise, and downloads the initial files you need to start writing code. It usually contains a `README.md` with a short description on the problem, and a `test_whatever.exs` which contains your unit tests. Initially only the first test is commented out, all the other test implementations are commented.

You can now create a file `whatever.exs` and then just type `elixir test_whatever.exs` and you will get test feedback.

#### Submit your solution

`exercism submit whatever.exs`

This will allow you to submit your solution to the website, available for others to give you suggestions to improve your code. You can change your code and repeat the  `submit` process.

After your code is considered done, "someone" - whoever that might be or however that might work - approves your solution and you can `fetch` the next exercise.

## That's it - what does it look like?

Simple, isn't it. To show you it really works, I will provide you some implementations of my first few exercises I completed - I really love the neatness of Elixir BTW -.

- [Word count](https://gist.github.com/ToJans/6093252)
- [Anagram](https://gist.github.com/ToJans/6093258)
- [99 bottles of beer](https://gist.github.com/ToJans/6092952)

If you would like to learn a new language (they currently offer `ruby`,`javascript`,`elixir` and `clojure`) I would strongly suggest you to try it out!

Have fun!



