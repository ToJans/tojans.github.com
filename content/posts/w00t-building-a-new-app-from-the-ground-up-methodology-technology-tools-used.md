---
layout: post
date: "2009-10-19"
slug: "w00t-building-a-new-app-from-the-ground-up-methodology-technology-tools-used"
title: 'w00t : Building a new app from the ground up : methodology, technology &
  tools used'
---

<p>
This is one of the articles in our series; the parts are:<br />
</p>
<ol>
	<li><a href="https://www.corebvba.be/blog/post/w00t-Building-a-new-app-from-the-ground-up-methodology-technology-tools-used.aspx">Methodology, technology &amp; tools used</a></li>
	<li><a href="https://www.corebvba.be/blog/post/w00t-Building-a-new-app-from-the-ground-up-setting-up-the-environment.aspx">Setting up the environment</a></li>
	<li><a href="https://www.corebvba.be/blog/post/w00t-Building-a-new-app-from-the-ground-up-First-specs-and-getting-started.aspx">First specs and getting started</a></li>
	<li><a href="https://www.corebvba.be/blog/post/w00t-Building-a-new-app-from-the-ground-up-IOC-database-and-other-stuff3b-a-real-framework.aspx">IOC, database and other stuff; a real framework</a>&nbsp; <br />
	</li>
</ol>
<p>
&nbsp;Happy reading !<br />
</p>
<h1>Introduction</h1>
<p>
Since I have always been very interested in the latest technology developments, and I needed to start a new and initially very simple project, I decided to do some studying and opt for new things...<br />
After reading quite some articles, I decided to write about my experiences in my blog, in order to learn some things about my experiences, and even help you decide on some aspects... 
</p>
<p>
If you disagree in any way with my opinions, or have some interesting suggestions please comment, since I am always eager to know about the opinion of somebody else.
</p>
<p>
&nbsp;
</p>
<h1>Methodology : the paradigm shift<br />
</h1>
<p>
Since my programming in <a href="https://en.wikipedia.org/wiki/TRS-80" target="_blank">TRS-80-basic</a> as a 7-year old, a lot has changed... This is an overview of my personal evolution :
</p>
<h2><a href="https://en.wikipedia.org/wiki/Procedural_programming" target="_blank">Procedural programming</a><br />
</h2>
<p>
Initially I got started with <a href="https://en.wikipedia.org/wiki/BASIC" target="_blank">BASIC</a>, since it was the most understandable development platform at the time, very easy to get started with. A few years later, I had been developing in <a href="https://en.wikipedia.org/wiki/MASM" target="_blank">MASM</a>, <a href="https://en.wikipedia.org/wiki/Turbo_pascal" target="_blank">Turbo Pascal</a> and even <a href="https://en.wikipedia.org/wiki/C--" target="_blank">C--</a> in the <a href="https://en.wikipedia.org/wiki/Demo_scene" target="_blank">demoscene</a> (<a href="https://www.pouet.net/prod.php?which=8765" target="_blank">only limited tracks available</a>), all choices that opted my preference for execution speed, before I really entered my next level of programming consciousness...
</p>
<h2><a href="https://en.wikipedia.org/wiki/Object_oriented" target="_blank">Object oriented programming</a><br />
</h2>
<p>
Since I had been a hardcore developer in the demo-scene, most OO-concepts were a stranger to me (speed was king)... It has only been a few years later in my professional carreer that the advantages of OO were becoming obvious to me. Unfortunately, until then I reinvented the wheel for just about each problem I had, since I never heard about the next part..
</p>
<h2><a href="https://en.wikipedia.org/wiki/Design_pattern" target="_blank">Design patterns</a> </h2>
<p>
After hearing about <a href="https://en.wikipedia.org/wiki/Factory_method_pattern" target="_blank">factories</a>, <a href="https://en.wikipedia.org/wiki/Service_%28systems_architecture%29" target="_blank">services</a>, <a href="https://en.wikipedia.org/wiki/Command_pattern" target="_blank">command patterns</a>, all kinds of <a href="https://en.wikipedia.org/wiki/Interface_%28computer_science%29" target="_blank">interfaces </a>etc. I decided that that was the next thing for me, so I started studying the <a href="https://en.wikipedia.org/wiki/Design_Patterns_%28book%29" target="_blank">GOF design patterns</a>, <a href="https://en.wikipedia.org/wiki/Martin_Fowler" target="_blank">Martin Fowler</a>&#39;s <a href="https://martinfowler.com/" target="_blank">blog </a>and all kinds of reference material that I could find. Slowy some of the more interesting concepts were getting to me, but in the meantime there was a new buzz on the development scene... 
</p>
<h2><a href="https://en.wikipedia.org/wiki/Unit_testing" target="_blank">Unit testing</a> </h2>
<p>
What&#39;s that ? Testing your code by programming tests as well ? Although I read a lot about this subject, it never seemed to be able to convince me, since i was more of a fan of the higher level automated testing, aka
</p>
<h2><a href="https://en.wikipedia.org/wiki/Functional_testing" target="_blank">Functional/acceptance testing</a> </h2>
<p>
I allready used this from the beginning on, I wrote programs that did some kind of black box testing, before tools like <a href="https://fitnesse.org/" target="_blank">Fitnesse </a>were available by means of simple input/output. This seemed more usefull then writing unit tests. Until now : the next buzz
</p>
<h2><a href="https://www.corebvba.be/blog/admin/Pages/Behavior%20Driven%20Development" target="_blank">Behavior driven development</a></h2>
<p>
Finally something that replaces the ubiqutous unit tests with a more interesting approach, write in &quot;business language&quot; what a program has to do, and implement that in code afterwards.. Since I am quite new to this I expect that I will have some problems on the go, so I will share them with all of u in the future..
</p>
<p>
&nbsp;
</p>
<h1>Technology</h1>
<p>
Regarding the technology : my choice is quite simply based on my experience :
</p>
<h2>Development platform&nbsp; : <a href="https://en.wikipedia.org/wiki/ASP.NET_MVC" target="_blank">ASP.Net MVC</a> / <a href="https://en.wikipedia.org/wiki/C_Sharp_%28programming_language%29" target="_blank">C#</a></h2>
<p>
2 very simple reasons : It needed to be web-based, and I have had lots of experience with&nbsp; this platform since the early betas. (The design of ASP.NET MVC also encourages seperation of concerns.)
</p>
<h2>DB/<a href="https://en.wikipedia.org/wiki/Object-relational_mapping" target="_blank">ORM</a> : <a href="https://subsonicproject.com/docs/Using_SimpleRepository" target="_blank"></a><a href="https://subsonicproject.com/" target="_blank">Subsonic </a>SimpleRepository</h2>
<p>
On the database part I am not quite sure yet, but I think a good ORM should not make me obliged to keep using the same DB after all, so I think I will use SqlLite initially, but switch later on to a better one. Strict POCO is not a necessity for me<br />
Since I have no interest whatsoever on the db part, I think i have to choose between 2 options :
</p>
<ul>
	<li><a href="https://fluentnhibernate.org/" target="_blank">FluentNHibernate</a></li>
	<li>SubSonic SimpleRepository</li>
</ul>
<p>
While I have been using FluentNhibernate in the past, I have a gut/good feeling about Subsonic SimpleRepository, so I will initially probably start with the second one. Since I wil be using an interface anyway I should be able to switch between two versions quite quick.
</p>
<h2><a href="https://en.wikipedia.org/wiki/Inversion_of_Control" target="_blank">IOC </a>container : <a href="https://www.castleproject.org/container/index.html" target="_blank">Castle Windsor</a></h2>
<p>
Since I have no idea about an IOC container, I will probably use the one I have the most experience with : Castle Windsor.
</p>
<h2>BDD : <a href="https://codebetter.com/blogs/aaron.jensen/archive/2008/05/08/introducing-machine-specifications-or-mspec-for-short.aspx" target="_blank">MSpec</a> </h2>
<p>
Because I am new to this mather,I will choose the one that got me interested in this : MSpec.
</p>
<p>
&nbsp;
</p>
<h1>Tools </h1>
<p>
There is only a very limited list of extra tools I need :
</p>
<h2>IDE</h2>
<p>
For the programming/web design : <a href="https://en.wikipedia.org/wiki/Visual_studio" target="_blank">Visual studio</a>. For the initial SqlLite management I will use <a href="https://sqliteadmin.orbmu2k.de/" target="_blank">SqlLiteAdmin</a>.
</p>
<h2>
Source control
</h2>
<p>
No doubt about this : <a href="https://en.wikipedia.org/wiki/Git_%28software%29" target="_blank">GIT </a>.<br />
Because of :
</p>
<ul>
	<li>Atomic commits</li>
	<li>Ease to setup</li>
	<li>Ease to do branching/merging/pulling other sources etc <br />
	</li>
</ul>
<p>
&nbsp;You can read more about this in my <a href="https://www.corebvba.be/blog/post/To-git-or-not-to-git-Source-control-done-right-intro-and-quick-tutorial.aspx" target="_blank">other blog article</a>.
</p>
<h2>Timetracker</h2>
<p>
Even though this is not a project that I can bill by the hour, I like to keep track of the hours I invested in this. Here I simply use <a href="https://en.wikipedia.org/wiki/Google_Calendar" target="_blank">google calendar</a>, as I do for all my customers. I even wrote an article about this <a href="https://www.corebvba.be/blog/post/Convert-ICal-icsgoogle-calendar-to-textcsv-file.aspx" target="_blank">here</a>.
</p>
<h1>Summary</h1>
<p>
Those are the inital choicesI have made. I will now setup my development environment and I&#39;ll keep you all posted on my blog (<a href="https://www.corebvba.be/blog/?tag=/w00t" target="_blank">articles with tag w00t </a>). 
</p>
