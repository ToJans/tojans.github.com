---
layout: post
date: "2009-12-02"
slug: "rant-your-abomination-is-my-clever-hack"
title: 'Rant : Your abomination is my clever hack'
---

<p>When I read the <a href="https://odetocode.com/Blogs/scott/archive/2009/11/30/your-abomination-is-my-clever-hack.aspx" target="_blank">article from OdeToCode about the abuse of a programming language to create shortcuts</a>, I felt the need to respond.</p>
<h3>What is it about ?</h3>
<p>Simply stated, it is about using some clever tricks to make it easier for the developer to reach his goal. The example was a stackoverflow post : <a href="https://stackoverflow.com/questions/1718037/abuse-of-c-lambda-expressions-or-syntax-brilliance">Abuse of C# lambda expressions or Syntax brilliance? </a></p>
<p>Which discusses code that looks like this :</p>
<p><div class="code">
</p>
<p>.Attributes(style =&gt; <span class="str">"width:100%"</span>)</p>
<p></div></p>
<h3>What is the issue here ?</h3>
<p>The issue was that the reaction of the c# language designers. They said it was unacceptable to use such a shortcut, since it was not originally intended in the language design. According to them, one should never use such a construct. I firmly disagree...</p>
<h3>Why should one be allowed to abuse a development language ?<br /></h3>
<p>Simply stated : because you can. Every single thing that can help a developer to make cleaner/safer/better code (in his/her opinion) should be allowed. Why do we develop most of our applications in c#/java/ruby/PHP and not in assembly ? Because using these languages is considered cleaner/safer/better then using assembly. So while the original language designers might not like the idea, the hacks provide an extra cleaner/safer/better way to address a certain implementation subdomain. After all, the language is there as an intermediate between the developer and the hardware, and anything that allows better communication between the developer and the hardware, should be considered a plus... Which brings us to our next point of attention.</p>
<h3>Who is saying that the approach you use here is cleaner/safer/better ?<br /></h3>
<p>Actually : nobody. That is something that you need to find out yourself. While some people might like to use the shown constuct, others might like the more verbose way of expressing things. Most of the time, these shortcuts are there as an alternative to the "common" way to do something. In most cases, the fact whether you like or dislike something is based on your background/knowledge/reference frame . <br />The fact that the alternative was built means that somebody had the intention of providing a better/safer/cleaner way of doing something. Whether you agree or disagree with this person is completely up to you... (Although I must admit that I certainly agree with this person). If you look at the dynamicobject feature (another heavy point of discussion), then you might see that this actually does something simular as the shortcut used here, so the language development team is actually doing the same.</p>
<p>Please note that it does not stop here; some people found the original c#/vb.net language to constraining, so they <a href="https://boo.codehaus.org/" target="_blank">developed their own</a>, including <a href="https://boo.codehaus.org/BooManifesto.pdf" target="_blank">a manifest</a>.</p>
<p>So, to conclude, if you think you can make your own life easier by using certain 'abusive' constructs : please do !!!</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
