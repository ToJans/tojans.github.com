---
layout: post
title: Howto+why using a prototype & bdd for a project estimate + personal rant
---

<h3>Introduction</h3>
<p>As you might or might not now, estimating the budget for a project can be very hard sometimes. In order to get started on a project we first need a real estimate of what the client will need, and the client should know what I am going to deliver to him/her.<br />What I personally learned from the past is that one can never be fine-grained enough, since there will always be mismatches somewhere.</p>
<p>We can however try to offer the client something that he/she can both understand and work with, next to a description of what everything should do (from a business point of view).</p>
<p>How can we do this, while investing as little work as possible ?</p>
<p>&nbsp;</p>
<h3>Unfortunately one can not correctly estimate projects without doing some work</h3>
<p>As straightforward as this might seem, most people do not seem to be able to grasp this ( do not be ashamed; I have been guilty as well ).</p>
<p>In order to give a correct estimate, you have to INVEST a decent amount of TIME.</p>
<p></p>
<h3>How can we make sure that we have as little mismatches as possible ?</h3>
<p>You can do this by making sure the estimate is complete; a short list of possible deliverables:</p>
<ul>
<li>User manual</li>
<li>Technical reference manual</li>
<li>Quickstart guide</li>
<li>Sourcecode</li>
<li>Educating the endusers</li>
<li>A scope definition for the software</li>
<li>A feature definition within the software scope</li>
</ul>
<p>Building this list is usually really easy, except for the last 2 parts:</p>
<h3><br /></h3>
<h3>Scope and feature definition for the software</h3>
<p>This commonly known cartoon is unfortunately true in most cases (click to go the original one) :</p>
<p><a href="http://www.projectcartoon.com/cartoon/3"><img src="http://www.projectcartoon.com/images/project.jpg" alt="Project planning cartoon" /></a></p>
<p>Defining the scope of the software is usually hard work, and most of the time the expectations of the client do not match the planned implementations of the developer. How can we avoid this pitfall ???</p>
<p>This is quite easy, but it does require some work: you build a prototype/wireframe of the application, and show this to the client, asking if everything he wants is in there. This requires quite some time, but usually your quote will be selected because they can see how much time you invested in it, and it shows just how professional you approach your work.</p>
<p>Next to this you should start on some high level BDD stories describing the behaviour of the problem domain and the application. This means writing stories from a domain perspective (i.e. no computers involved) as well as from an app perspective if necessary.</p>
<p>&nbsp;</p>
<h3>But how do I do this technically ?</h3>
<p>Well, that is completely up to yourself. In order to get you started I can show you how I do it :</p>
<p>For the prototyping I currently use a combination of HTML/jQuery/jQuery UI and a jQuery plugin called polypage.</p>
<p>You can see a screenshot here:</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2009%2f12%2fmarkomo_prototype.png" alt="" /></p>
<p>I am using jQuery UI for <a href="http://docs.jquery.com/UI/Tabs" target="_blank">tabs</a> and an <a href="http://docs.jquery.com/UI/Accordion" target="_blank">accordion </a>to define different possible steps of a screen. Next to this I use <a href="http://code.new-bamboo.co.uk/polypage/" target="_blank">polypage </a>to switch different states (you can click on the "logged in" link on the left top in orde to switch between a user that is logged in, and one that is not logged in.)</p>
<p>You can look at the sample here : <a href="http://www.corebvba.be/demos/prototype/index.html">http://www.corebvba.be/demos/prototype/index.html</a> . Please note that this is pure HTML/Javascript, so there is no serverside involved here... So if you save the html/css and script sources you have everything I have... It might also be interesting to know that there is only a single HTML file: index.html. All the necessary code is in there.</p>
<p>Next to this I describe my domain features using BDD/the ubiquitous language. This will later be fed back into the program tests using BDD. For a good introduction on BDD I should redirect you to <a title="Introducing BDD" href="http://dannorth.net/introducing-bdd" target="_blank">Dan North</a>.</p>
<p>Describing the domain functionality is needed in order to make sure that you can also estimate your resource usage for everything that happens behind the scenes (which will probably be the biggest part in enterprise projects).</p>
<p>It goes without saying that I do use <a href="http://wiki.github.com/ToJans/Aubergine" target="_blank">my very own BDD framework</a> as a BDD implementation framework later on.</p>
<p>&nbsp;</p>
<h3>In conclusion</h3>
<p>If you use both HTML wireframes/prototypes together with BDD to describe the problem domain, you usually can grasp wath the project is about, and you should be able to give some good estimates on the budget for a project. Another advantage of this technique is that your quote does show how much time you already invested in their project, and how professional you are about it. This will probabaly give you a commercial advantage over other quotes, since most of them will probably not be as detailed as this one.</p>
<p>I do bill some of my work from this phase back to the client if I do get the project, but usually this is not a problem, since the client can see the value of doing this.</p>
<p>&nbsp;</p>
<h3>A warning/personal rant<br /></h3>
<p>I also realize that this approach is not always possible, since some clients are not willing to invest enough time in order to give you enough information. Based on my previous experience with this kind of situation I can only advise you one thing: turn around and run away from it as fast as you can, especially in combination with fixed-price projects !! These kind of clients will never know what the final scope and features of the application will be, so you will have to do dozens of rewrites because they do not know the domain or scope themselves, and implement all kinds of extra functionalities that were never mentioned in the initial scope!!! It implies waterfall development, but in the worst possible way !!!</p>
<p>A few typical taglines by which you can smell problems before beginning on the project:</p>
<ul>
<li>"Oh that is something we do not know yet, but it shouldn't be that hard."</li>
<li>Stakeholders having discussions over domain problems</li>
<li>"It should be something like site XXX". FINAL STOP. (no further details provided)</li>
<li>"We need to interface some external apps... we'll see which ones later on"</li>
<li>"How much data.. oh we do not know yet"</li>
</ul>
<p>A few typical lines by which you can notice you are in trouble while working on a project:</p>
<ul>
<li>"When I say I want to upload files in internet explorer, I do mean any file, even it is larger then 200MB"</li>
<li>"What ? Your CSS layout does not support Internet explorer 4 ? Fix it asap"</li>
<li>"Uploading the file repository is slow; I don't care that I upload 2GB of data over a DSL line; it is slow, you should fix it"</li>
<li>"Oh, but we do need both implicit and explicit fine-grained security, in such a way that we do not know yet ourselves. Just implement something, and we'll let you know if it is ok"</li>
<li>"Yes can you do this ? How much time does it take ? 10 days ?" =&gt; 20 days later: "Ok, we want it by next week..."</li>
<li>"Oh, we decided to use the app for all our customers instead of just ourselves... Why doesn't your app support the load of umphteen times the original amount of users/data ?"</li>
<li>"BTW I forgot to tell you, we need custom theming for every customer group, and we should be able to do it ourselves... No, we do not want to edit aspx/css files, just make an editor, ok ?"</li>
<li>And finally : "What do you mean, another invoice ? We are not paying since your original quote stated xxx" after investing y times the work estimated in the original quote... "Yeah, we'll see you in court, which means you can wait another year for your money (if you are lucky)"</li>
</ul>
<p>As hilarious as this list may seem, these are all things that I have experienced in real life... So please take my advice and run away as fast as you can from such clients...</p>
<p>PS: for really professional people not willing to invest too much time in a project quote, I can always advise <a href="http://estimategoat.com/" target="_blank">this site</a>.</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
