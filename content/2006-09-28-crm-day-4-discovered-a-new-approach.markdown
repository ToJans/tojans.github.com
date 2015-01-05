---
layout: post
title: ! 'CRM day 4 : Discovered a new approach'
---

Yesterday I had some things to do, so I could not really implement the main classes.<br />
<br />
Today, I am happy not to have started, since I have discovered Subsonic. (Screencast at http://www.wekeroad.com/actionpackintro.html ).<br />
This is a very nice ASP.Net prototyping framework, that has all the necessary buzzword features implemented. Atlas/AJAX/...<br />
Later this day I will implement my basic data model, and try to extend the generation classes to implement the ActAs.. functionalities...<br />
<br />
Basicly the generation will work like this : if the table contains the fields BaseTableName and BaseId, it will autogenerate some specific code.<br />
<br />
For example, this should be possible :<br />
Table Comment(id,name,text,basetablename,baseid,createdby,createdon,modifiedby,modifiedon)<br />
Products.Comment<br />
<br />
<br />
<p>
&nbsp;
</p>
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
