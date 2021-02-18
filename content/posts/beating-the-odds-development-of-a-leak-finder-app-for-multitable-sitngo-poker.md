---
layout: post
date: "2010-08-24"
slug: "beating-the-odds-development-of-a-leak-finder-app-for-multitable-sitngo-poker"
title: Beating the odds - development of a leak finder app for multitable SitNGo Poker
---

<h1>Introduction</h1>
<p>I have been playing poker for quite some time, most of the time just for fun and a few eurocents... I especially love playing MultiTable SitNGo's (i.e. small tournaments which start when a certain amount of players has registered).<br />I am quite successfull playing this kind of games at lowstakes, at least I usually manage to get into the top 5% around halfway the tournament. But then the following usually happens (fictiuous situation):</p>
<p>- I get a premium hand (AKs for example) and raise 2-3 BB...<br />- I get called by a bigstack on the (BB)<br />- Flop, low card rainbow<br />- Bigstack checks<br />- I raise 2/3 pot<br />- Bigstack calls<br />- Turn: K<br />- Bigstack checks<br />- I raise POT<br />- Bigstack calls<br />- Some lowcard falls<br />- Bigstack goes all-in<br />- I call (I know I shouldn't, but I'm pot-commited)<br />- bigstack show something like 2-7os, but hits a double pair, where he hit the 2 on the flop, and the 7 on the river.<br />- I get busted out of the tournament (usually just before the bubble)</p>
<h1>It's a leak !!!</h1>
<p>Yes, now that I am reading it, I know what I should do: fold after the all-in.<br />I also should not have raised after the flop, maybe just a check-call if the investment is not to big.<br />I know I can't go all-in directly, since it's a bigstack that calls anything with rags (i.e. donk). He usually only folds on the river if he hits nothing at all (and maybe after value betting first)....<br /><br />In the long term/purely based on statistics, I would probably beat him with AK. The problem is that in this phase of the tourney, in a comfortable position, I should play a whole other post-flop game, since staying in the tournament is simply more valuable then gaining a few chips<br />However, most of the time this happens just before the bubble, and I played a whole game just to get busted before the bubble...</p>
<p>And this happens to me a lot !!</p>
<p>So what should I do ?? Fold if the bigstack plays ?? Maybe I should, maybe I shouldn't.... but this got me thinking....</p>
<h1>Fix the leak !!!<br /></h1>
<p>What if I could write an app that analyses these things, and gives me (based on statistics) the best possible solution for this situation..</p>
<p>I know these allready do exist, but since I am a developer and I love playing poker (even though I am really bad at it), I am going to write my own app for this... And while doing so, I will also blog about it, in order to get the discussion going and find the best possible solution for the problem.</p>
<p></p>
<h1>Where to start ?</h1>
<p>Since this is a whole new ballgame for me, I will probably need to delve deeply into statistics, fuzzy logic, some neural networking, and probably some datamining tools as well...<br />I will blog about this every now and then, and also add a link to my task list:</p>
<h1>Tasklist</h1>
<ul>
<li>Write the initial specs for the app</li>
<li>Get a huge MTT SNG hand history for training purposes</li>
<li>Find out how the winners got ITM</li>
<li>Build some kind of system which matches the ITM players as much as possible using genetics</li>
<li>Refine, refine, refine...</li>
<li>Can I create a marketable product out of it ? How about open sourcing it ?? Which platform should I target (i.e. mobile, web, PC, ...)</li>
<li>Do something which will result in "World Piece&trade;"</li>
</ul>
<h1>Finally</h1>
<p>This is supposed to be the first post of a long series, and since it is a hobby project, I have no idea whether and when I will finish it...</p>
<p>I hope you enjoy it while it lasts !!!</p>
<p>&nbsp;</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
