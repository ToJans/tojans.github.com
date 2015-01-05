---
layout: post
date: "2012-01-15"
slug: "cqrs-for-the-lazy-ss"
title: CQRS for the lazy -ss
---

<h2>Introduction</h2>
<p>In one of my numerous attempts to create a neat approach to CQRS, this is yet another attempt to remove all the protocol that CQRS requires. I love bootstrapping new projects and experimenting with new approaches, and this is another step that improves efficiency. It is a natural evolution to one of my other CQRS playgrounds: <a href="https://github.com/ToJans/Scritchy" target="_blank">Scritchy</a>.</p>
<p>The conventional CQRS approach requires you to write&nbsp;command - and event classes, to wire up your commands and event handlers to the relevant AR's, saga's and viewmodel builders.<br />I removed some of the clutter in that process with Scritchy. <a href="https://github.com/ToJans/Scritchy/wiki/auto-wiring" target="_blank">Scritchy uses conventions to wire up the commands and events to the relevant components</a>. This makes CQRS a lot less verbose while still offers the same advantages.</p>
<h2>Scritchy v2 ?</h2>
<p>While this is a good attempt, it still requires you to write the dreaded event - and command classes.<a href="http://www.linkedin.com/profile/view?id=2995972&amp;trk=tab_pro#recommendations" target="_blank"> Having pushed some best practices/usages/libs to some enterprise teams in the past</a>, I noticed the following: any change that adds extra steps/work to the process makes acceptance harder by devs, as most people are usually trapped in a certain approach, and they do not see an advantage in having to write more code to do the same thing. If they do not need to write all the "protocol"/extra classes, you have removed yet another step that might slow down acceptance of the practice.</p>
<p>&nbsp;</p>
<p>The new approach I am about to tell you about in this blog post completely hides the messages from the dev, i.e. the dev can just use a conventional method call, and messages are created underneath.</p>
<p>&nbsp;</p>
<h2>Disclaimer</h2>
<p>This is a possible approach to the problem, but I tend to think that the majority of the CQRS evangelists and practitioners value explicitness over pragmatism. I love the explicitness and clarity of their examples and implementations, but in the real world most people start to think: "Wow, that is a lot of code to simply add an item to the stock; are they nuts ?".</p>
<p>Having experienced the fallacy of the explicitness in a startup attempt, my brain got tickled to find fast and neat approaches to a pretty established conventional path. I think this one is pretty close.</p>
<p>The full source is available over at <a href="https://github.com/ToJans/MinimalisticCQRS">GitHub</a>, and the demo app can be seen/tested<a href="http://minimalisticcqrs.apphb.com/"> over at appharbor</a>.</p>
<h2>Example</h2>
<p>So without further ado, here I will show you ALL THE CODE required to implement a complete CQRS app:</p>
<p></p>
<h3>The domain: Bank account</h3>
<p>Let us first start with some sequence diagrams to introduce you to the problem domain:</p>
<p><img style="width: 322px; height: 213px;" src="http://www.websequencediagrams.com/cgi-bin/cdraw?lz=bm90ZSBsZWZ0IG9mIEdVSToKICBSZWdpc3RlciBhbiBhY2NvdW50CmVuZCBub3RlCkdVSS0-QQAQBlVuaXF1ZW5lc3NWYWxpZGF0b3I6ADUIABwHID8KAF4Fb3ZlciAAHRoKIAAVCE51bWJlciB1AFYFID8AcAkgCm9wdCAAbAYKICAAeww6AIEpCQCBEQcKICBvcHQgQWxsb3dlZAogIABVCS0AKgsAgT4HAIFmCAAkBWVuZAplbmQKCg&amp;s=earth" alt="" /></p>
<p><img style="width: 172px; height: 152px;" src="http://www.websequencediagrams.com/cgi-bin/cdraw?lz=bm90ZSBsZWZ0IG9mIEdVSToKICBEZXBvc2l0IHNvbWUgY2FzaAplbmQgbm90ZQpHVUktPkFjY291bnQ6ACEIQ2FzaApvcHQgQWxsb3dlZAogIAAcBy0AIgtBbW91bnQAVQdlZAplbmQKCg&amp;s=earth" alt="" /></p>
<p><img style="width: 180px; height: 152px;" src="http://www.websequencediagrams.com/cgi-bin/cdraw?lz=bm90ZSBsZWZ0IG9mIEdVSToKICBXaXRoZHJhdyBzb21lIGNhc2gKZW5kIG5vdGUKR1VJLT5BY2NvdW50OgAhCUNhc2gKb3B0IEFsbG93ZWQKICAAHQctACMLQW1vdW50AFYIbgplbmQKCg&amp;s=earth" alt="" /></p>
<p><img style="width: 437px; height: 324px;" src="http://www.websequencediagrams.com/cgi-bin/cdraw?lz=bm90ZSBsZWZ0IG9mIEdVSToKICBUcmFuc2ZlciBhbiBhbW91bnQgZnJvbSBBIHRvIEIKZW5kIG5vdGUKR1VJLT5BY2MAHQVBOgAvCEEALgUKb3B0IFZhbGlkIGZvciBzb3VyY2UKICAAJwktADAMIAAvBldpdGhkcmF3bgATFgCBEQhTYWdhOgCBHglQcm9jZXNzZWRPblMAVw8AJQwAgSEKQjogAC0HAIFiCE9uVGFyZ2V0CiAgAIEpDnQADwgAgS8KQgCBLgtCAIExCERlcG9zaXRlZAAaEUdVSQCBIQpDb21wbGUAIQZlbHNlAIJhCmludgBmDyAAXhgAgXAWRmFpbGVkAIE-CwCBZh9BOiBDYW5jZWwAg2YIAIFYDQCDCRUAgU8WQQCBVBEAUgUAgV4GbmQKZW5kCg&amp;s=earth" alt="" /></p>
<h3>Domain:Account</h3>
<p>
<script src="https://gist.github.com/1615489.js?file=Domain%5CAccount.cs"></script>
</p>
<p>Nothing spectacular here; yes, I do realize it is a boring sample, but we need a well-known domain to explain it IMO; suggestions for an alternative domain are welcome!</p>
<h3>Domain:AccountTransferSaga</h3>
<p>
<script src="https://gist.github.com/1615489.js?file=Domain%5CAccountTransferSaga.cs"></script>
</p>
<p>Orchestrates the transfer between 2 accounts</p>
<h3>Domain:AccountUniquenessSaga</h3>
<p>
<script src="https://gist.github.com/1615489.js?file=Domain%5CAccountUniquenessSaga.cs"></script>
</p>
<p>Verifies uniqueness of the account; I do realize on rare cases there might be an error here (when using async processing one might have eventual consistency), but I consider the effort in fixing the error by hand less then the cost to implement it on the domain.</p>
<p>The code above is all that is needed for the domain, i.e. no events or commands etc... isn't that neat ?</p>
<h3>Hubs</h3>
<p>In order to show you what else is needed, I added all the server-side code as well, so you have an idea how much code you need to implement a complete app</p>
<p>
<script src="https://gist.github.com/1615489.js?file=Hubs%5CCommandHub.cs"></script>
<script src="https://gist.github.com/1615489.js?file=Hubs%5CQueryHub.cs"></script>
</p>
<h2>Conclusion</h2>
<p>This is an approach to CQRS that removes the need to write message classes; it uses a combination of serializing method invocation on a dynamic together with conventions to build a system where messages are completely hidden from the user. Talk about removing infrastructure from the code!&nbsp;</p>
<p>I assume there will be a lot of opponents to this approach, as this gives room for typos etc. However, I do believe that this approach combined with TDD/BDD could be for CQRS what rails was for MVC : a pragmatic approach that allows you to just write code at blistering speed without a lot of added protocol.</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
