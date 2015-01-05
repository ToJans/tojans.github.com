---
layout: post
date: "2012-11-16"
slug: "fallacies-of-the-tech-recruitment-process"
title: Fallacies of the tech recruitment process
---

<p>Note: I would like to thank <a href="https://twitter.com/gbarrs">@gbarrs</a> for reviewing my blog post almost instantly, and also the offer of  <a href="https://twitter.com/GraemeF">@GraemeF</a>, <a href="https://twitter.com/MarkRendle">@MarkRendle</a>,  <a href="https://twitter.com/swaggerdmangene">@swaggerdmangene</a> and  <a href="https://twitter.com/moldyseaswimmer">@moldyseaswimmer</a> to be a reviewer. Without them, there would be a lot more <a href="http://en.wikipedia.org/wiki/Dunglish">Dunglish</a> in this post...</p>
<h2>Why I like my job.</h2>
<p>I have been hooked into computers ever since I wrote my first few lines of Basic on my mothers' brand new <a href="http://oldcomputers.net/trs80iii.html">TRS-80 Model 3</a> with 64Kb of ram and 2 - yes 2 !!! - diskdrives of a whopping 178Kb.  (Actually, I did not write the code, but I copied it character by character from <a href="http://www.1000bit.it/support/manuali/trs/Introduction%20to%20TRS-80%20Level%20II%20BASIC%20%281980%29%28Michael%20Zabinski%29%28pdf%29.pdf">a textbook that might have looked like this</a>, but in my defense, I was about 7 years old).</p>
<p>The first program probably looked like this:</p>
<p><code>10 PRINT "HI, WHAT IS YOUR NAME?"</code></p>
<p><code>20 INPUT N$</code></p>
<p><code>30 PRINT "HELLO, ",N$</code></p>
<p>Exciting, is it not? In the five years that followed, I learned almost every in and out of this machine, where to peek and poke in memory, how to set pixels on the screen (monochrome, 128x48 resolution, imagine that), which ASCII codes to send to my dot matrix printer to switch control modes, ...</p>
<p>When I was about twelve years old, I had written a drawing application, complete with circles, boxes, Bresenham lines, and even the possibility to print the graphics on the (very noisy) dot matrix printer (remember those printers which had to print on chained paper?).</p>
<p></p>
<p>Then we got our first 80286, an IBM-compatible PC that ran at a mind-boggling speed of 16 Mhz, with 4 megs of memory and a color VGA screen... A screen buffer of 320x200 pixels with 256 colors was available directly by poking at the #A000 segment, and we discovered a whole brave new world out there using color pallette rotation, and apps like <a href="http://en.wikipedia.org/wiki/Deluxe_Paint">Deluxe Paint</a>. We even managed to do blitting by <a href="http://www.wagemakers.be/english/doc/vga">reprogramming the VGA-card directly</a> by poking video card ports and bypassing BIOS...</p>
<p><img src="http://upload.wikimedia.org/wikipedia/en/6/6c/Snapshot_DeluxePaint_II_MSDOS.png" alt="Our GFX artist probably spent thousands of hours in Deluxe Paint" /></p>
<p>As years progressed I got involved in the Belgian BBS/hacking/cracking scene, but after one of our fellow BBS's got all his material confiscated, we decided to focus on the demo scene, as we had some experience writing some "cool intros" for our and other BBS's.</p>
<p>In the demo scene, we were not very succesfull, but we did have a lot of fun. (This was the pre-internet-era folks, so figuring out how to write a software 3D rasterizer from disassembling other demo 'exe' files was a bit of a challenge. The example below was one of those demos we completely disassembled to figure out how everything worked.)</p>
<p>
<object width="480" height="360">
<param name="movie" value="http://www.youtube.com/v/XtCW-axRJV8?version=3&amp;hl=nl_NL" />
<param name="allowFullScreen" value="true" />
<param name="allowscriptaccess" value="always" /><embed type="application/x-shockwave-flash" width="480" height="360" src="http://www.youtube.com/v/XtCW-axRJV8?version=3&amp;hl=nl_NL" allowscriptaccess="always" allowfullscreen="true"></embed>
</object>
</p>
<p>The biggest achievement that is now still traceable would probably be the fact that I did manage to come <a href="http://www.pouet.net/prod.php?which=8765">second in a 4K assembler demo on a demo party in Mons</a> (Which is now, in the hardware-accelerated era, probably pretty unspectacular) .</p>
<h2>Fast forward to a few years later...</h2>
<p>I walked a very diverse path, both in programming languages (e.g. all kinds of Basic, Turbo Pascal, x86 assembly, C, C++, C--, (PL/Transact)-SQL, Smalltalk, lua, ruby, shell scripts, C#, some 4GL's and probably a dozen of others), in platforms (pre-PC area, Windows, *nix , VMS, AS400, ...) as well as in my <a href="http://www.linkedin.com/in/tomjanssens">career</a> (Oracle dev/DBA, C++ dev, c# dev, ICT manager, technical analist, independent consultant).</p>
<p>As I got involved with .Net (I wrote my first app framework when independent using a Beta of .Net 1.0), I started focussing on this new thing, first Winforms, and afterwards ASP.NET, and finally ASP.NET MVC.</p>
<p>I skipped things like Silverlight, WCF, WWF and XAML as they all seemed way to much overhead for achieving something to me.</p>
<p>However, in the last few years I started realizing something...</p>
<h2>If you focus on the tech stack, you are focussing on the wrong thing!</h2>
<p>Spending all those years behind a PC and the last 15 years interacting with both business and development, I started realizing the biggest problem is not in the tech stack, but it is in the interaction between business and technology that the biggest problems occur.</p>
<p>From my numerous experiences with all those different environments, I know by experience that <strong>learning a new tech thing usually takes somewhere between a week and a few months before you can be productive</strong> (becoming an expert is a different thing, but that is not what I am referring to here).</p>
<p>The hardest part is not in the tech, but it is in <strong>learning how to scope, plan and build software that matches the business' expectations</strong>. That is something one cannot learn in a few weeks, let alone months.</p>
<p>This is exactly the reason why I read <a href="http://www.corebvba.be/blog/post/Continuous-thinking-Essential-business-books-shortlist-3-business-books-everyone-should-have-read.aspx">numerous business books</a> every year, and have taken several sabatticals of a few months studying new things (more specific: <a href="http://www.corebvba.be/blog/?tag=/BDD">Behaviour Driven Development</a>, Domain Driven Design including the <a href="http://www.corebvba.be/blog/?tag=/CQRS">Command-Query responsibility Seggregation thing</a>, as well as the whole <a href="http://www.corebvba.be/blog/post/Project-Startup10-Learning-to-build-your-own-business.aspx">Lean startup development process</a>).</p>
<p>I did make some mistakes in the past, but hey, I am learning from them... (On a side-note, you should really check out <a href="http://sethgodin.typepad.com/seths_blog/2011/12/the-difference-between-a-failure-and-a-mistake.html">this blog post from Seth Godin</a> about the difference between a failure and a mistake.)</p>
<h2>"What does this have to do with the tech recruitment process?"</h2>
<p>The last few years all my business leads came from my personal or online network. Some experiences turned out pretty good, and some a bit less.</p>
<p>Unfortunately, my current client's project got delayed for a few months at first, and cancelled afterwards by his customer, so I am currently short on leads. (Luckily they are now giving me the opportunity to migrate them from a waterfall to a more scrum-like approach, so I am not quite broke yet; however, the job ends this month.)</p>
<p>As I got short on leads, I decided to accellerate my job/project search using companies that play an intermediate between me and the customer, and I was flabbergasted by most of them...</p>
<h2>Most recruiters just seem to play "Keyword lottery"</h2>
<p>People from my personal/social network <strong>do not hire me because I know a certain tech stack, they hire me because they think I am capable of solving the problem they have.</strong></p>
<p>However, <strong>almost</strong> every recruiter that contacts me - the exceptions know who they are - just search their database for keywords, and contact you based on those keywords. In the rare case that you do get asked some technical questions, the interviewers either do not know anything about the subject, or they start asking questions about the things irrelevant to the job.</p>
<p>In my experience <strong>this keyword approach is as usefull as taking an asprin when your leg is broken</strong>. Here is an excerpt from a recent conversation I had with Szymon Pobiega on twitter:</p>
<blockquote class="twitter-tweet" lang="nl">
<p>@<a href="https://twitter.com/tojans">tojans</a> Same for any technology, approach and methodology. Juniors tend to write they are experts if they heard a buzzword more than 3 times</p>
&mdash; Szymon Pobiega (@SzymonPobiega) <a href="https://twitter.com/SzymonPobiega/status/268951237389598720">november 15, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>Every single recruiter I talk to talks about how they would like to bond and invest into people, and really contribute and build a relationship, so I point them to my blog, and tell them this is exactly who I am. However, almost nobody - again, some exceptions - decided to invest in me by reading the blog and finding out what my exact profile is.</p>
<p>There are exceptions to this rule, and some even go a long way to acquire your trust and confidence, for example the story of github recruitment comes to my mind; who would not love to be treated like that?</p>
<blockquote class="twitter-tweet" lang="nl">
<p>After doing lots of job interviews, this sounds like Walhalla: the @<a href="https://twitter.com/github">github</a> hiring experience <a title="https://github.com/blog/1269-the-github-hiring-experience" href="https://t.co/yTNE1wxw">github.com/blog/1269-the-&hellip;</a>" /via @<a href="https://twitter.com/jacopretorius">jacopretorius</a></p>
&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/status/269327080850874368">november 16, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<h2>Closing up</h2>
<p>I intended to make this a short post (i.e. 1K words), as it was more of a rant then a true essay, but as usual I am having a hard time respecting the limit.</p>
<p>I hope I did not blow any of my own bridges by writing this post, but I find this whole recruiter thing rather frustrating, as the business model for most of them seems to evolve around introducing as many candidates as possible to as many potential customers as possible, filtering only by keywords...</p>
<p>As the globalization and "enterprise consumerization" continues, I assume the world will evolve into an interconnected network of people first and organizations second, so I think that recruitment organizations that are simply focusing on getting the most contracts by using pure volume will not manage to survive in the future. (Maybe they should try reading <a href="http://agilemanifesto.org/">the Agile manifesto</a>.)</p>
<p>Once again I will close this blog post with a quote:</p>
<p><em>"The greatest enemy of knowledge is not ignorance, it is the illusion of knowledge." - <a href="http://en.wikipedia.org/wiki/Stephen_Hawking">Stephen Hawking</a></em></p>
