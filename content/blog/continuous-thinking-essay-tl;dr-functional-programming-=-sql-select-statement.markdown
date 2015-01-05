---
layout: post
date: "2011-12-18"
slug: "continuous-thinking-essay-tl;dr-functional-programming-=-sql-select-statement"
title: 'Continuous thinking: Essay: TL;DR - functional programming = SQL SELECT
  statement'
---

<h3>Introduction</h3>
<p>I am currently in the process of studying F# - a functional programming language -.&nbsp;Since I am a <a href="http://www.corebvba.be/blog/post/Essay-the-duality-of-knowledge.aspx">big fan of meta-cognition</a>, I am trying to find out how the mindset of the functional programming paradigm differs from that of a C# one (i.e. the more conventional, object oriented paradigm).</p>
<p>This essay also tries to point out some existing bridges to the functional paradigm that are currently implemented in the imperative programming language C#.</p>
<h3>What is "Functional programming" exactly ?</h3>
<p>I will reference <a href="http://en.wikipedia.org/wiki/Functional_programming" target="_blank">wikipedia</a>&nbsp;- while it still exists - for the definitions:</p>
<pre style="padding-left: 30px; ">In computer science, functional programming is a programming paradigm&nbsp;
that treats computation as the evaluation of mathematical functions 
and avoids state and mutable data. 
It emphasizes the application of functions, in contrast to the imperative&nbsp;
programming style, which emphasizes changes in state.</pre>
<p>Let us start with the first bit:</p>
<p></p>
<h3>A programming paradigm ? What is that ?</h3>
<p>Again from <a href="http://en.wikipedia.org/wiki/Programming_paradigm" target="_blank">wikipedia</a>:</p>
<pre>A programming paradigm is a fundamental style of computer programming.&nbsp;
(Compare with a methodology, which is a style of solving specific software&nbsp;engineering problems.) 
Paradigms differ in the concepts and abstractions used to represent the elements of a program 
(such as objects, functions, variables, constraints, etc.) 
and the steps that compose a computation 
(assignment, evaluation, continuations, data flows, etc.).</pre>
<p>I will describe my evolution as a developer by looking at the program paradigms I have used. (An overview of the known paradigms can be found <a href="http://en.wikipedia.org/wiki/Comparison_of_programming_paradigms" target="_blank">here</a>)</p>
<h4>The imperative paradigm</h4>
<p>This paradigm describes step by step the procedure that should be followed to solve a problem; you could consider this a long list with instructions: first do this, then do that. These are considered the first 3 language generations. This was the first paradigm I learned writing software.</p>
<p>&nbsp;</p>
<h4>The&nbsp;imperative paradigm -&nbsp;Generation 1 -&nbsp;Machine code</h4>
<p>Back in the days, this meant pulling/plugging wires/switches to develop an app; currently you could compare this to writing your app in a hex editor</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2011%2f12%2fhex.png" alt="" /></p>
<p>As I do not know these hex codes by heart (I used to be able to interpret some of the hex codes during my demo/hacking days way back), I used the code from the next generation to generate this output (Yes, I cheated!).</p>
<p>&nbsp;</p>
<h4>The&nbsp;imperative paradigm -&nbsp;Generation 2 - Assembly language</h4>
<p>The machine hardware is abstracted using mnemonics,f.e. MOV EAX,1; please note that the labels could be considered a part of generation 3. Here is an x86 example:</p>
<p>
<script src="https://gist.github.com/1493152.js?file=1.essay.asm"></script>
</p>
<p>On a side note: it has been <a href="http://pouet.net/prod.php?which=8765">about 25 years ago</a> since I wrote my last applications in assembly, so it took me some time to get this started again. I built the COM-file in <a href="http://flatassembler.net/" target="_blank">FASM (an assembly IDE and compiler)</a> and used <a href="http://www.dosbox.com/" target="_blank">dosbox</a> to run it, since <a href="http://en.wikipedia.org/wiki/COM_file" target="_blank">a COM-file is considered 16-bit and is unsupported on Windows 7</a>.</p>
<p>&nbsp;</p>
<h4>The&nbsp;imperative/structured/procedural&nbsp;paradigm -&nbsp;Generation 3 -&nbsp;Procedural language or high-level language</h4>
<p>This is the first generation that allows you to represent your problem in the language of your problem domain introducing the concept of variable names/function names etc.. The structured means it tries to avoid GOTO statements, but replaces them with while/Foreach/... Here is a Pascal example:&nbsp;</p>
<p>
<script src="https://gist.github.com/1493152.js?file=2.essay.pas"></script>
</p>
<p>This also took me a while to write it, since it has been even longer since I wrote (Turbo) Pascal; I used<a href="http://www.bloodshed.net/devpascal.html" target="_blank"> Dev Pascal</a> to write and test this code.</p>
<p>&nbsp;</p>
<h4>The&nbsp;imperative/structured&nbsp;object-oriented paradigm</h4>
<p>While the procedural paradigm offers some abstraction regarding your problem domain, it still requires you to describe your problem domain in a series of procedures. OO design is the next step; OO allows you to group procedures and functions and attach them to their respective data. This allows you to group functionality and data by behavior. Please note that showing this example case in OO is a bit ridiculous, as the functionality is quite simple. However, as complexity grows, OO offers some real advantages.</p>
<p>
<script src="https://gist.github.com/1493152.js?file=3.essay.cs"></script>
</p>
<p>As this is the language/paradigm I have been working in for the last years, this did not take to much effort...</p>
<p>OO is currently considered as one of the mainstream ways to approach software development (n=1).</p>
<p>&nbsp;</p>
<h4>The functional paradigm</h4>
<p>Ok, we considered my evolution as a developer (and I assume there are a lot of you who have made a similar progression), so now it is time to take a look again at the rest of the definition:</p>
<pre style="padding-left: 30px; ">In computer science, functional programming is a programming paradigm&nbsp;
that treats computation as the evaluation of mathematical functions 
and avoids state and mutable data. 
It emphasizes the application of functions, in contrast to the imperative&nbsp;
programming style, which emphasizes changes in state.</pre>
<p>Hmmz, what does this mean exactly ? This means that instead of modifying the data, we only have immutable state that we transform through functions. How does this look ? Here is the F# example:</p>
<p>
<script src="https://gist.github.com/1493152.js?file=essay.fs"></script>
</p>
<p>Disclaimer: As I am new to F#, I gave it my best shot, and it&nbsp;took me some time to write.</p>
<p>Luckily I got <a href="https://twitter.com/#!/rickasaurus/status/148780837368901633" target="_blank">a confirmation from @Rickasaurus/Richard Meinerich that it is an acceptable implementation</a>.</p>
<h3><br /></h3>
<h3>Hmmz; these look similar; what did I do wrong ?</h3>
<p>In hindsight, I would have to say that I probably have chosen a wrong example as this does not demonstrate the advantages of functional programming. So, while this was a nice exercise and fun to do - x86 asm FTW! - , it does not really help a lot.</p>
<p>However, I did read a nice description somewhere on the internet (I can not exactly recall where), but it said something similar to this:</p>
<pre>Draw a grid, with the column headers being the Types in your problem, 
and the row headers the functionalities. 
When doing OO, you use the columns as building blocks;
when doing functional programs, you use the rows as building blocks</pre>
<p>This sums it up pretty nicely I think, and it somehow helped me to get started with functional programming. The focus is on the behavior, not on the data structures.</p>
<p>&nbsp;</p>
<h3>Here's a fact; you are probably using the functional approach already</h3>
<p>Yes ? What ? How ?</p>
<p>Ever heard about SQL SELECT statements? This could be considered an application of functional programming, You have an immutable state (within the scope of a query), and map/reduce it at runtime to a new set of data. Or how about Linq ?</p>
<p>In fact, every time you pass in an Action/Func/Predicate in C#, you are actually doing functional programming...&nbsp;</p>
<p>One can do imperative programming in a functional language, as wel as functional programming in an imperative language, but the specific language facilitates the paradigm you should use it for. For example, take a look at that F# code again; do you see a single reference to a specific type in this code ? No you do not. Does this mean that this is dynamically typed then ? No, it is not, as the compiler can figure out the types by analyzing the program.</p>
<p>&nbsp;</p>
<h3>Conclusion</h3>
<p>I wrote this article to enable a paradigm shift, and it worked for me. Functional programming requires a whole new approach to solutions, by representing them in another way. While learning something new, I always consider it a good thing to take a step back, and look at it from a distance. This article was such an attempt, and I hope it was as usefull to you as it was to me.</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
