---
layout: post
title: Winning the game with CQRS/event sourcing and BDD
---

<h1>Yes !! I did it !!!<br /></h1>
<p>I have been making a few attempts to combine BDD with CQRS/event sourcing, since they seem to make a perfect fit.</p>
<p>After mailing to the DDD/CQRS newsgroup for a few times, I finally managed to make something presentable... this is the BDD part for the domain :</p>
<p>
<script src="http://gist.github.com/560498.js?file=Integration.txt"></script>
</p>
<p>And this is the resulting output after running the console runner</p>
<p>
<script src="http://gist.github.com/560498.js?file=output.txt"></script>
</p>
<p></p>
<p>This is the context, notice how setting up the interpreter usually only takes a single line (i.e. register an event, execute a command, or check something)</p>
<p>
<script src="http://gist.github.com/560498.js?file=BDDAppContext.cs"></script>
</p>
<p>And this is the implementation of the domain class</p>
<p>
<script src="http://gist.github.com/560498.js?file=PositiveNumber.cs"></script>
</p>
<p>And it's domain handler</p>
<p>
<script src="http://gist.github.com/560498.js?file=PositiveNumberHandler.cs"></script>
</p>
<p>As wel as a view updater (in reality this view store would be queried be a winform or webform directly)</p>
<p>
<script src="http://gist.github.com/560498.js?file=SomeReadModelUpdater.cs"></script>
</p>
<p>Please do note that the current Event Store and Aggregate store are not persisted; IRL you would have to persist the event store (forward write-only), and probably some snapshots from your aggregate root as well (maybe using a bigtable); this should be easy to add, I might do this in a later phase....</p>
<p>You can find the full sourcecode in this zip:</p>
<p><a href="http://www.corebvba.be/blog/file.axd?file=2010%2f9%2fSimpleCQRS2.zip">SimpleCQRS2.zip (76,94 kb)</a></p>
<h3>Update !!</h3>
<p>I uploaded the sourcecode to github : <a href="http://github.com/ToJans/CQRSNode" target="_blank">http://github.com/ToJans/CQRSNode</a></p>
<p>I also added (currently synchronous) a node.js -like implementation...</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
