---
layout: post
title: ! 'Continuous thinking: Essay: Ease and simplicity in software architecture'
---

<h1>Introduction</h1>
<blockquote>
<p>&ldquo;Almost all quality improvement comes via simplification of design, manufacturing... layout, processes, and procedures.&rdquo; - <a href="http://en.wikipedia.org/wiki/Tom_Peters" target="_blank">Tom Peters</a></p>
</blockquote>
<p>As I was tinkering around with <a href="http://www.erlang.org/" target="_blank">Erlang</a>/<a href="http://learnyousomeerlang.com/what-is-otp" target="_blank">OTP</a> and <a href="https://github.com/ToJans/Big" target="_blank">some other stuff</a>, I suddenly experienced yet another <a href="http://en.wikipedia.org/wiki/Aha-Erlebnis" target="_blank">"aha-erlebnis"</a>: there is a huge difference between something that is <strong>simple</strong> and something that is <strong>easy</strong>, but a lot of people tend to miss this rather important distinction.</p>
<p></p>
<h1>What do you mean?</h1>
<p>When I told people I was considering writing a blog post about the difference between <strong>simple</strong> and <strong>easy</strong>; <a href="http://verraes.net/" target="_blank">Mathias Verraes</a> pointed me to a presentation on InfoQ named <a href="http://www.infoq.com/presentations/Simple-Made-Easy" target="_blank">"Simple Made Easy"</a> by <a href="https://twitter.com/richhickey" target="_blank">the creator of Clojure</a>.</p>
<blockquote class="twitter-tweet">
<p>@<a href="https://twitter.com/tojans">tojans</a> Inspiration: <a title="http://www.infoq.com/presentations/Simple-Made-Easy" href="http://t.co/Tiu0NvzJ">infoq.com/presentations/&hellip;</a> by @<a href="https://twitter.com/richhickey">richhickey</a></p>
&mdash; Mathias Verraes (@mathiasverraes) <a href="https://twitter.com/mathiasverraes/status/263200589503164417">October 30, 2012</a></blockquote>
<p>
<script src="//platform.twitter.com/widgets.js"></script>
</p>
<p>This is a great video, and I suggest you to take a look at it.&nbsp;As I can not include infoQ videos on this page, I will embed another video by the same speaker about the same subject.(But to be honest, I think the one on infoQ is better.)</p>
<p>
<object width="640" height="360">
<param name="movie" value="http://www.youtube.com/v/rI8tNMsozo0?version=3&amp;hl=nl_NL" />
<param name="allowFullScreen" value="true" />
<param name="allowscriptaccess" value="always" /><embed type="application/x-shockwave-flash" width="640" height="360" src="http://www.youtube.com/v/rI8tNMsozo0?version=3&amp;hl=nl_NL" allowfullscreen="true" allowscriptaccess="always"></embed>
</object>
</p>
<h1>So how is this related to software architecture?</h1>
<p>There is a very well known concept called <a href="http://en.wikipedia.org/wiki/Second-system_effect" target="_blank">the 2nd system effect</a> which basically describes a typical evolution of application development:</p>
<h2>System 1: "I do not have a clue yet"</h2>
<p>You develop a system, without really knowing all the requirements, so you spike a <a href="http://en.wikipedia.org/wiki/Minimum_viable_product" target="_blank">minimal viable product/prototype</a>, which is really <strong>simple</strong> and deploy it.</p>
<p>The users start using it, and start asking for extra features.</p>
<p>As you start implementing these features, you notice that your current software architecture is lacking a bit, but the <strong>easy</strong> way is to add yet another condition, another prerequisite, include another loop/code to your existing code until it turns into a big ball of mud; it loses the <strong>simplicity</strong> and becomes more <strong>complex</strong>. (<a href="http://en.wikipedia.org/wiki/Black_swan_theory" target="_blank">The black swan theory</a> has a big part in this.)</p>
<blockquote>
<p>Implementation 1: maintaining existing and implementing new/extra business features gets <strong>harder</strong> and <strong>more complex</strong> on every single step.</p>
</blockquote>
<h2>System 2: "Let's make sure we can use it for everything"</h2>
<p>Knowing what you did wrong in system 1, you provide an over the top architecture, which makes it <strong>easy</strong> to add numerous extensions and adjustements.</p>
<p>However, the extension points and adjustements are adding an extra layer of abstraction, and thus make your code more <strong>complex</strong>. The business implementation is <strong>simple</strong>, but the extensibility is <strong>complex</strong>.</p>
<blockquote>
<p>Implementation 2: Maintaining existing and implementing new/extra business features is <strong>easy</strong>, but the whole extensibility thing adds a lot of <strong>complexity</strong>.</p>
</blockquote>
<p>This code is usually a <a href="http://www.urbandictionary.com/define.php?term=PITA" target="_blank">PITA</a> when you are trying to figure out what happened or are trying to debug the code.</p>
<p>For the record: I actually suffered from this as well doing a project for a customer of mine, so I will take this occasion to apologize for my mistake: sorry Arnold!</p>
<h2>System 3: "Let's cut the crap"</h2>
<p>Finally, one gets to version 3: we understand the necessities and evolution of the project, and are able to build a <strong>simple</strong> system which only abstracts the things that mather, so it avoids <strong>complexity</strong> whenever possible.</p>
<blockquote>
<p>Implementation 3: Maintaining existing and implementing new/extra business features is <strong>easy</strong> and <strong>simple</strong></p>
</blockquote>
<h1>Theory is nice, but how about practice?</h1>
<p>In my personal experience, the best way to avoid this, is by not making assumptions in the beginning, as one is typically not able to predict the future - unless your last name is <a href="http://en.wikipedia.org/wiki/Ray_Kurzweil" target="_blank">Kurzweill</a> or <a href="http://en.wikipedia.org/wiki/John_Titor" target="_blank">Titor</a>, but that is another discussion - and refactoring code as you notice some smells.</p>
<p>Here are some typical smells:</p>
<ul>
<li>intertangling code, a lot of dependencies</li>
<li>code going several levels deep</li>
<li>copy/paste coding</li>
<li>building for something one might need in the future</li>
<li>Too generic abstractions</li>
<li>...</li>
</ul>
<p>If you want to refactor code, you need to have some confidence that your application requirements are still met after refactoring, which leads us to the following tool: <a href="http://en.wikipedia.org/wiki/Behavior-driven_development" target="_blank">Behaviour Driven Development(BDD)</a></p>
<p>By using BDD one can find some black swans by exploring the specs with BAs before actually implementing them, and make sure the expected outcomes are still achieved after refactoring.</p>
<p>There is a lot more to BDD then this, but this post is already long enough.</p>
<h1>Conclusion</h1>
<p>Well, I was in dubio whether I would write this post or not, but writing it all down somehow made me more confident about what to look for when implementing a system: do not create a <a href="http://en.wikipedia.org/wiki/Big_Design_Up_Front" target="_blank">BDUF</a>, but have small incremental changes to your system. Only implement arhitectural patterns when you actually need them, not a minute later or sooner.</p>
<p>I would like to end this post with another one of my favorite quotes</p>
<blockquote>
<p>"Make everything as simple as possible, but not simpler" - <a href="http://en.wikipedia.org/wiki/Albert_Einstein" target="_blank">A. Einstein</a></p>
</blockquote>