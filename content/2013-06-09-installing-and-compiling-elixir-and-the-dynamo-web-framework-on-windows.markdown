---
layout: post
title: Installing and compiling Elixir and the Dynamo web framework on Windows
comments: true
sharing: true
footer: true
---

<h3>Introduction</h3>
<p>People following me on twitter noticed I got entangled in yet another new language for the Erlang/BEAM VM:&nbsp;</p>
<h3><img style="font-size: 10px;" src="http://www.corebvba.be/blog/image.axd?picture=2013%2f6%2felixir-logo.png" alt="" /></h3>
<p>Elixir could be easily described as "ruby for the BEAM/Erlang VM". In previous posts, I mentioned <a href="http://www.corebvba.be/blog/post/Erlang-Camp-Amsterdam-why-you-should-follow-it-and-getting-started-with-Erlang-and-Axiom.aspx">why people should learn Erlang</a>, but in fact, I think most people might be better off when they skip Erlang and opt directly for Elixir. It has all the advantages of Erlang, but offers a Ruby-like syntax, macros, polymorphism and more.</p>
<p>As <a href="http://benjamintanweihao.github.io/blog/2013/06/08/why-my-next-programming-language-is-elixir/" target="_blank">someone else made a perfect blog post on why you should learn Elixir</a>, I will not elaborate further on it in this post. Read his post; the info is all there.</p>
<p>As usual, you can find more info about Elixir on <a href="http://en.wikipedia.org/wiki/Elixir_(programming_language)" target="_blank">Wikipedia</a>&nbsp;, or on the <a href="http://elixir-lang.org/" target="_blank">Elixir site</a>.</p>
<p>In this post, I will show you how to get started with Elixir and generate a template website using the <a href="https://github.com/elixir-lang/dynamo" target="_blank">Dynamo web framework</a>.</p>
<p>Installing Elixir is simple, but because one of the Dynamo web framework dependencies requires the make tool, you need to do some extra work. If anybody finds a better/simpler way to do this, please let me know in the comments.</p>
<!--more-->
<h3>Prerequisites</h3>
<p>In order to get started with Elixir on windows, you need several apps installed:</p>
<ul>
<li>git: I use <a href="http://msysgit.github.io/" target="_blank">msysgit </a>(installed with <a href="http://chocolatey.org/" target="_blank">Chocolatey</a>: <a href="http://chocolatey.org/packages/git.install" target="_blank">cinst git.install</a>)</li>
<li><a href="http://www.erlang.org/" target="_blank">erlang</a>: You need at least Erlang <a href="http://erlang.org/download/otp_win64_R16B.exe" target="_blank">R16B</a>, so you can not use chocolatey here.</li>
<li>Elixir: you need a&nbsp;precompiled package that is not realeased yet, <a href="https://github.com/elixir-lang/elixir/issues/1203" target="_blank">0.9.1 crashes on windows, but Jos&eacute; Valim quickly built a hotfix &nbsp;- Thanks Jos&eacute; !-</a>. Older versions will not work on Windows. You can download it <a href="https://dl.dropboxusercontent.com/u/4934685/elixir/v0.9.2.dev.zip" target="_blank">here</a>; I unzipped it in "c:\program files\elixir".</li>
<li>Minimal system from Minimalist GNU for Windows (also installed with Chocolatey:<a href="http://chocolatey.org/packages/mingw" target="_blank"> cinst mingw </a>) - make sure you install the mingw developer toolkit - see screenshot:</li>
</ul>
<div><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f6%2fmingw.png" alt="" /></div>
<div><br /></div>
<p>Next you need to make sure that "erlang/bin", "elixir/bin" and "MinGW\bin" are in your path, and we will verify that everything works; we will also need to copy the file "c:\mingw\bin\mingw32-make.exe" to "c:\mingw\bin\make.exe". Next we can test whether everything works:</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f6%2fprerequisites.png" alt="" /></p>
<h3>Getting and building the web framework for Elixir: Dynamo</h3>
<p><a href="https://github.com/elixir-lang/dynamo" target="_blank">Dynamo</a> is a web framework tailored specificly to the Elixir language. As it is written on top of the Erlang Cowboy/Ranch stack, it uses proven technology to accelerate web development.</p>
<p>It might be nice to know that <a href="https://twitter.com/josevalim" target="_blank">Jos&eacute; Valim</a> (the creator of the Elixir language and the Dynamo web framework) <a href="http://contributors.rubyonrails.org/contributors/jose-valim/commits" target="_blank">is one of the main contributors to the Ruby On Rails engine</a>, so you can assume he knows a thing or two about web frameworks.</p>
<p>Anyway, enough background; let us get started with the installation...</p>
<p>First we need to clone the dynamo repo(which is a web framework that has a workflow comparable to Ruby on Rails) &nbsp;and build it. You can get it using the following command: "git clone https://github.com/elixir-lang/dynamo.git".</p>
<p>Because building the dependency Cowboy requires the make.exe tool (the reason we needed to install MinGW MSys), we need to do this in an msys shell. You can find the msys shell under "c:\mingw\msys\1.0\msys.bat".</p>
<p>Open up the shell, clone the repo and get/build the dependencies from dynamo using the mix tool : "mix deps.get".</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f6%2fdyn-get-deps.png" alt="" /></p>
<p>You will get an error in the end, but that is not really a problem; the compilation should be succesful. Now you need to compile the dynamo app: "mix compile"</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f6%2fdyn-compile.png" alt="" /></p>
<h3>Generate a web app with dynamo: blah</h3>
<p>You can now test whether dynamo works. You can now use dynamo to generate a web app: "mix dynamo [path of app]"</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f6%2fdynamo-works.png" alt="" /></p>
<p>This has created a web-app in the blah folder. We go to the blah folder, and run once again "mix deps.get" and "mix compile". Then we should be able to start the server by typing "mix server".</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f6%2fblah-works.png" alt="" /></p>
<p>Open up a browser on <a href="http://localhost:4000/" target="_blank">http://localhost:4000</a> and you can see the labor of your work.</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2013%2f6%2fblah-runs.png" alt="" /></p>
<p>Now you can start working on your app, but that is the subject for another blog post. You can find more information about the dynamo web framework&nbsp;<a href="https://github.com/elixir-lang/dynamo#readme" target="_blank">here</a>.</p>
<p>Happy Elixiring !</p>
<p>Tom</p>