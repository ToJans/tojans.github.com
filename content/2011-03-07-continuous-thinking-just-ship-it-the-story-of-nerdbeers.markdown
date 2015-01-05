---
layout: post
title: ! 'Continuous thinking: just ship it - the story of NerdBeers'
---

<h2>Note</h2>
<p>This is the first in a series of posts :</p>
<ol>
<li><a href="http://www.corebvba.be/blog/post.aspx?id=47b4b0d1-1c1f-46a0-8a8d-5e4733b92868">Continuous thinking: just ship it - the story of NerdBeers</a> (this post)</li>
<li><a href="http://www.corebvba.be/blog/post.aspx?id=567301d7-eb44-4622-ba2a-1bb53ff54cb6">Continuous thinking: Nerdbeers continued - We all win !!</a></li>
<li><a href="http://www.corebvba.be/blog/post.aspx?id=e10561a4-bb3b-40cd-a333-4aa28b8b0f27">Continuous thinking: Nerdbeers - Providing business value by issue tracking</a></li>
</ol>
<h2>Introduction</h2>
<p>Ok, I will admit it: I am a software architecture junkie. I love thinking about it, and try to use it in every app I can. I am <a href="http://www.corebvba.be/blog/?tag=/CQRS">an avid fan of CQRS</a> (more info <a href="http://cqrsinfo.com/about/">here</a>), and I try to use it as much as possible.</p>
<p>Next to this, I am also a <a href="http://www.corebvba.be/blog/?tag=/BDD">very big fan of BDD</a>; to me it feels like there is nothing that even comes close to the process of describing a problem domain using the example stories.</p>
<p>I spend a huge amount of time on reading as much relevant articles as possible,<a href="http://groups.google.com" target="_blank"> joining discussions in newsgroups</a>, on blogs. This has provided me quite a broad knowledge about software approaches one should use. (Think SOLID,BDD. ...)</p>
<p>&nbsp;</p>
<h2>Ok, stop bragging please, what is your point here ?</h2>
<p>A while ago I got together with someone on a new idea (yes Geert, I am talking about you). We talked it through and started prototyping. So I set up a basic project, and built a CQRS architecture in order to get started, so we would have better scalable/testable/more maintainable code. In the mean time, the other person had already started prototyping, so I spend a few days converting his ADO code into a more appropriate model for CQRS, and convert everything.</p>
<p>I heard about the latest version of <a href="http://msdn.microsoft.com/en-us/library/aa697427%28v=vs.80%29.aspx" target="_blank">enitity framework</a>, which had a <a href="http://weblogs.asp.net/scottgu/archive/2010/07/16/code-first-development-with-entity-framework-4.aspx" target="_blank">code-first approach</a>, and since <a href="http://github.com/ToJans/MVCExtensions" target="_blank">I had been using fluent-nhibernate in the past</a> for view storage, I decided to go for the new player on the block. Unfortunately, the EF apparently did not support Enum storage, so we had to adjust about 80% of the viewmodels.</p>
<p>After migrating everything, it seemed like the other person was implementing code in the wrong places. He has always been a DAL/ORM kind of person, so the whole CQRS thing was really confusing to him. (which is completely normal; cqrs requires a different mindset than CRUD, and I did not take in to account the rather steep learning process I had made in the past).</p>
<p>I can go on and on about this, but to cut a long story short, the project was temporarily postponed to an undefined later date...</p>
<p>I also quit another project like this because I lost intrest in the project while building up the whole required architecture setup and a few basic screens.</p>
<p>So a lot of effort resulted in ... absolutely nothing</p>
<p>&nbsp;</p>
<h3>Fast-Forward to a few months later</h3>
<p>As time progressed, I read even more about architecture, learned some new frameworks on the way, and tried out a few things from which most did not even get to a usable phase. My software hobby projects were all seeded quickly, but abandoned even more quickly.</p>
<p>Until I read <a title="1.0 is the lonliest number" href="http://ma.tt/2010/11/one-point-oh/" target="_blank">an article on the blog of Matt Mullenweg</a>. The one phrase that kept lingering around in my mind was this one:</p>
<p style="padding-left: 30px;"><strong>if you&rsquo;re not embarrassed when you ship your first version you waited too long.</strong></p>
<p>Wow! That is a strong statement !! So I decided that my next project would respect this statement; I was just waiting for the perfect opportunity to come along</p>
<p>&nbsp;</p>
<h3>And there it was...</h3>
<p>I discovered <a href="http://github.com/thecodejunkie/Nancy" target="_blank">NancyFx</a>, a .Net web framework loosely inspired by <a href="http://github.com/bmizerany/sinatra" target="_blank">the ruby/sinatra approach</a>, as well as <a href="https://github.com/markrendle/Simple.Data" target="_blank">Simple.Data</a>, which one can compare to the <a href="http://ar.rubyonrails.org/" target="_blank">ruby ActiveRecord</a> approach. If there is one web platform that is known for it's productivity, it has to be <a href="http://rubyonrails.org/" target="_blank">RubyOnRails</a>. So I decided to give it a go, and merge the two in a new project.</p>
<p>As I was looking for an idea on an app to implement, <a href="http://twitter.com/grumpydev" target="_blank">@grumpydev</a> told me he had been thinking about trying to implement something like <a href="http://www.nerddinner.com" target="_blank">NerdDinner.com</a>, but maybe a bit more limited, and that I was free to try it.</p>
<h3>So I came up with NerdBeers<br /></h3>
<p>After taking a few hurdles (cloning the NancyFx git repo,installing ruby, building, installing sqlce, building, installing F#, building, cloning the simple.data repo, building it, finding an SQLCE editor, finding a Migrator.Net that supported SQLCE 4.0 and building it), I started a basic web project, where I had an index screen showing all upcoming nerdbeers and the possibility to add a new one, and a details screen where one could edit a nerdbeer.</p>
<p>I ditched Migrator.Net, since it was making things to complicated at this phase of the project.</p>
<p>I <a href="http://github.com/tojans/NerdBeers" target="_blank">published it at github</a>, tweeted about it, and got some very enthousiastic reponses from the creators as well as from the community, even inluding some people whom I consider to be impossible to reach...</p>
<p>As I published my sourcecode to github, I was thinking about my idle <a href="http://www.appharbor.com" target="_blank">appharbor </a>test account that I requested a few weeks before... Continuous deployment is required if one wants to approach lean development.... So I started hacking/reading/making stupid mistakes. Luckily the people from appharbor were there to help me, and pointed out what was wrong.</p>
<p>So after a few attempts and sleepless nights, I had a pretty useless app online, but it looked kind of cool due to the tersness of the code.</p>
<p>&nbsp;</p>
<h3>NerdBeers... The story continues</h3>
<p>Since I got so much positive responses to an app which was basically an empty shell, but showed a lot of potential, I was motivated enough to start hacking together something usable. After trying out a few things, checking out the Nancy sourcecode and bothering @GrumpyDev, <a href="http://twitter.com/thecodejunkie" target="_blank">@TheCodeJunkie</a> and <a href="http://twitter.com/markrendle" target="_blank">@MarkRendle </a>with all my noob questions, I finally got around to publishing something usable - allbeit in a very limited way - .</p>
<p>It still looks ugly as hell, but I am a developer, not a designer. Strings are being pulled currently to help me out (=replace) the design.</p>
<p>&nbsp;</p>
<h3>Conclusion<br /></h3>
<p>For me, this approach was WAY OUT of my comfort zone, but apparently it does work... If I take out the time to build the libs and workaround the bugs, check the source, bothering people about it, I have published a usable app in about a day...</p>
<p>It still looks really ugly (both the design and the code), but it works in a very basic way. I also cut out every possible feature not needed (i.e. currently one does not even have a login), so I would be able to ship it fast. And I have to say it worked: the short cycles kept me productive/motivated, and the small featureset helped me to focus on what was really important.So I did ship something !!</p>
<p>As the libs for NancyFx and Simple.Data progress, we will get a very mature platform which will enable truly lean development.</p>
<p>You can see the demo application at <a href="http://NerdBeers.apphb.com" target="_blank">http://NerdBeers.apphb.com</a>.</p>
<p>For me this has been a valuable lesson, and from now on, I will try to respect these principles more and more... I hope you found this an interesting read, and if you have had a similar experience, do not hesitate to let me know...</p>
<h3><br /></h3>
<h3>Update!!</h3>
<p>There is a followup post <a href="http://www.corebvba.be/blog/post/Continuous-thinking-Nerdbeers-continued-We-all-win-!!.aspx">here</a>.</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
