---
layout: post
date: "2014-01-25"
slug: "fixing-blatantly-obvious-wrong-assumptions-is-hard"
title: "Fixing blatantly obvious wrong assumptions is hard"
comments: true
categories: 
---

So, yesterday I had another one of those "in your face moments": While working on the 
[Erlang FoundationDB driver](https://github.com/happypancake/fdb-erlang), I spent **a lot** of time on a bug that was so blatantly obvious that I did not notice it for a long time.

![My dev environment](https://i.snag.gy/5r5eC.jpg)

As I had been stuck for a long time, [Tomas](https://twitter.com/ptomasroos) suggested me to ask the [FoundationDB guys](https://foundationdb.com/) for help, so we did.

When I asked for help, the bug was so obvious that it probably took them like 2 seconds to notice what the problem was. (I explain it step by step later, but [here's the commit fixing the bug](https://github.com/happypancake/fdb-erlang/commit/2b15aeef27ced6a6d14d97f9a01c9682f9047c14#diff-754ec66646d2386b94625d7ecb6c1ca8L309) if you cannot wait.)

What the bug comes down to, is that I had to pass pointers to instances that did exist, and that they would not be allocated by the calling function. (After all, having the caller allocating two `int`s and a reference to
a `struct` would be pretty useless IMO.)

### That's a stupid bug! How did that happen?

Well, in one of the usual ways it does... 

First things first: the solution is an Erlang interface to FoundationDB.

An [Erlang NIF](https://www.erlang.org/doc/tutorial/nif.html) - NIF is short for a "Native InterFace" -
requires you to write an interface with a lib-file (or DLL on windows) that converts the Erlang terms to proper binary parameters, calls the relevant function(s), and then reports 
the results back in the Erlang term binary format.

When I was creating this wrapper, I noticed this was quite a repetitive job, prone to errors, so I decided to write a bash script that generated the C-code skeleton for all of these calls for me, based on a header file and 
the library.

This turned out to be [quite easy to write](https://github.com/happypancake/fdb-erlang/blob/master/tools/generate_fdb_nif). I do agree that it is will probably be hard to de-construct, but as this script was required to run only once, this was good enough for me.

But, automatically parsing these things and generating the C-files had an extra implication: I generated code like this:
<script src="https://gist.github.com/ToJans/8613033.js?file=before.c"></script>

Hence, when I was calling the FoundationDB library, I did it like this:
<script src="https://gist.github.com/ToJans/8613033.js?file=intermediate.c"></script>

Please notice lines 4 to 6: these were auto-generated.

So while running my unit/integration tests on this, I started debugging the NIF - [GDB](https://www.gnu.org/software/gdb/) is pretty neat by the way -, and could not find the error.
When I asked the FoundationDB guys for help, they replied almost instantly saying I should not pass in pointers to integers and pointers to pointers to structs - `**` is usually a red flag in C code anyway, but, in my defense,  it had been over 15 years ago that I actually used C(PP) -.

So I replaced it with initialized values like this:
<script src="https://gist.github.com/ToJans/8613033.js?file=after.c"></script>

Once again, notice lines 4 to 6.

### Lessons learned

It has been probably more then a few years ago that I have been bitten by such a stupid bug.

Next time, if I am stuck on what seems to be a very hard problem, I'll better get some external advice sooner; apparently an extra pair of eyes helps big-time.


