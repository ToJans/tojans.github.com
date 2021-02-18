---
layout: post
date: "2006-03-06"
slug: "howto-avoid-concurrency-issues-on-a-database"
title: 'HOWTO : avoid concurrency issues on a database'
---

<P>While some people will try to explain just exactly what kind of database locking types exist, I am a big fan of the more pragmatic approach : how to avoid concurrency issues.</P>
<H4>1. Keep a history of your data, or use versioning on your table.</H4>
<P>If you are using a value that gets updated by another transaction within your own transaction, chances are you are supposed to keep a history of the row versions.</P>
<P><STRONG>Edit : how to actually do this<BR></STRONG>Add a datetime field to your table called "ValidUntil", and set it to maxdate default. <BR>In your datalayer, on update/delete, make a row copy, set "ValidUntil" of the original row to the current date, and "ValidUntil" of the new row to maxdate. Don't use a null value instead of maxdate, since it might have some performance impact on some databases regarding index usage etc...</P>
<H4>2. Work with a staging and a production environment</H4>
<P>Use a database for temporary storage, and use a queue to deploy your staging stuff to the production database. Using a queue, you are sure that no transactions are interfering with each other, since you can allow only 1 job at the time using the queue.</P>
<H4>3. If there might be some row -or level locking, bring the database down</H4>
<P>Users - at least I do - find it annoying&nbsp;being busy with something, and having to abort it (because of database locks, or some other stuff)</P>
<P>I personally prefer to see a message&nbsp;like this :</P><PRE>&nbsp;the database is currently down for maintenance, please&nbsp;try again&nbsp;within .. minutes.</PRE>
<P>instead of having to restart my&nbsp;job all over again.</P>
<H4>4. Get latest version of volatile data </H4>
<P>.. using a view on the available data. Things like current stock etc should be calculated on the fly while being requested.<BR>If you are having performance issues, try using a materialized view....</P>
<H4>5. Review your code/model</H4>
<P>Chances are your model is not exactly correct. Check point #1</P>
<H4>Conclusion</H4>
<P>Being <STRIKE>an</STRIKE> <EM>the only</EM> Oracle DBA&nbsp;at our national television station, I tend to have a lot of knowledge considering databases. While the difference in database lock types might make an interesting speech, the main issue here is trying to avoid them using the tips mentioned above...</P><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
