---
layout: post
date: "2013-06-25"
slug: "running-elixir-on-my-android-tablet"
title: "Running elixir on my Android tablet"
comments: true
categories: 
---

As the Mrs. does not allow me to take the laptop on vacation, but we do take the tablet with us, I decided to find out 
whether [Elixir](http://elixir-lang.org) runs on an Android tablet.

I experimented for about an hour or so, and apparently it is quite easy. Here is my proof:

<blockquote class="twitter-tweet"><p><a href="https://twitter.com/search?q=%23elixir&amp;src=hash">#elixir</a> on android, now all I need is a REPL! <a href="https://twitter.com/search?q=%23DirtyHackButItWorks&amp;src=hash">#DirtyHackButItWorks</a> <a href="https://twitter.com/search?q=%23SL4A&amp;src=hash">#SL4A</a> <a href="https://twitter.com/search?q=%23Erlang4Android&amp;src=hash">#Erlang4Android</a> -pa /elixir/lib/elixir/ebin <a href="http://t.co/cAN2Ez4UQb">pic.twitter.com/cAN2Ez4UQb</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/349508106407014400">June 25, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### How do you do this

With a lot of unicorns and fairydust... No, actually it is quite simple.... <!--more-->

> Please note that all these steps should be performed on the tablet

1. Make sure your tablet is allowed to install non-verified packages/apk's (Under `settings`/`security`, `allow unknown sources` - 
I am not sure about the naming, as my tablet is in Dutch.)
2. Install [ScriptingLayer4Android/SL4A](https://code.google.com/p/android-scripting/) by downloading it from 
[here](https://code.google.com/p/android-scripting/downloads/detail?name=sl4a_r6.apk&can=2&q=). I used release 6.
3. Install [Erlang4Android](https://code.google.com/p/erlang4android/) R16B - download 
[here](https://code.google.com/p/erlang4android/downloads/detail?name=Erlang4AndroidR16B.apk&can=2&q=).
4. Download the [Elixir precompiled package](http://elixir-lang.org/packages.html) and unzip it on your device. I used 
[v0.9.3](http://dl.dropbox.com/u/4934685/elixir/v0.9.3.zip) and unzipped into `/mnt/sdcard/elixir`
5. Fire up `Erlang4Android`, install `Erlang`, and click on the 3 squares on the top right, choose `settings`. Enter 
`-pa /mnt/sdcard/elixir/lib/elixir/ebin` as a parameter, so your erlang scripting environment will auto-load the elixir lib.
6. Close `Erlang4Android`, open up `SL4A`, and click the menu on the bottom, `view`, and then choose `interpreters`
7. Click on the `Erlang` interpreter, it should fire up an erlang interactive console.
8. Type the following code:

```
elixir:eval("IO.puts 'blah'",[]).
```

and press `return`.

> For non-erlangers: to quit, type `q().` and press `return`.

### Todo

While this works, it is by no means workable; I tried using `elixir:start_cli().` but that does not work as it closes down the 
Erlang shell and 'SL4A' assumes it can close the scripting environment. It might be easy to setup a quick REPL script, but the 
proper way to do this, would be building a script package.
