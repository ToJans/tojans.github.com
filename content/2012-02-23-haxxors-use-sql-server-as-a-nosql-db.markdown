---
layout: post
title: ! 'HAxxors: Use SQL Server as a NOSql DB'
---

<h3>Introduction</h3>
<p>I was in an environment where I only had SQL Server available, but I really wanted a key-value store, so what did I do:</p>
<h3>Use SQL Server as a Key-Value store - Major Haxxors</h3>
<p>In order to be a proper key-valuestore, one would need to add the ability to do searching etc, but as this was only a quick hack where I did not require the search, I did not implement it.</p>
<p>In case I would have implemented a search, I probably would have used something like <a href="https://github.com/elasticsearch/elasticsearch" target="_blank">Elastic Search</a>.</p>
<p></p>
<p>
<script src="https://gist.github.com/1892554.js?file=KeyValueStore.cs"></script>
</p>
<h3>Conclusion</h3>
<p>While this approach is probably not advisable, it helped my to resolve my issue in a very short time. The biggest effort was in getting the upsert command correct. Do not hold me responsible if you use this in a production environment and it blows up on you!!</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
