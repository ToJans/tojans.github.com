---
layout: post
date: "2006-09-28"
slug: "crm-day-4-discovered-a-new-approach"
title: 'CRM day 4 : Discovered a new approach'
---

Yesterday I had some things to do, so I could not really implement the main classes.<br />
<br />
Today, I am happy not to have started, since I have discovered Subsonic. (Screencast at https://www.wekeroad.com/actionpackintro.html ).<br />
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
