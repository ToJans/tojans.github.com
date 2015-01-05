---
layout: post
title: Develop a CRM-app prototype in one (yes ONE) week
---

After developing several base implementations of a CRM package I have decided to re implement the full app from top to bottom.<br />
So what is the big deal about it ?<br />
<br />
<img src="/blog/admin/Pages/content/binary/deadline.jpg" border="0" alt="" width="28" height="30" />&nbsp;&nbsp; <strong><br />
<br />
I have only a week left to develop a fully functional prototype.<br />
<br />
</strong>
<h4>Why ?</h4>I am currently developing a CRM framework for one of my customers (private banking).<br />
While the current framework is working pretty decent, I am very unhappy with the current implementation (fifth already).<br />
Every developer has experienced at least once that building an app from the ground up can be pretty cumbersome, since adding functionalities changes/extends the framework gradually, and some adaptations are pretty ugly to implement in your framework.<br />
<h4>Why do you blog about it, and why would I bother ?</h4>For me : some constructive criticism might give me the extra boost I might need.<br />
For you&nbsp; : you might see me totally miss my deadline, and mock with me.<br />
<h4>How will you be able to do this ?</h4>The whole idea around this short time frame is based around the following aspects :<br />
<ul>
	<li>Since we have documented all company terminology/procedures/assets etc in a wiki, I will not need to contact my customer for further info. </li>
	<li>Developing several extensive prototypes (5) gives you a main idea how to do it. </li>
	<li>I need a really flexible framework that I can sell to other clients as well, so adaptation for other customers will be easy.<br />
	</li>
	<li>I work better under pressure :p .<br />
	</li>
	<li>Since the initial scope is quite small, technical difficulties are rather obsolete. The big challenge will be in the generalizations etc...</li>
</ul>
<h4>What is the scope ?</h4>Being able to manage contact(group)s/resources/products/activities/campaigns, using security policies etc..<br />
Email/reporting/integration will be considered later....<br />
<h4>What is the target platform ?</h4>SQL Server &amp; ASP.Net 2.0 / C# using Atlas<br />
<br />
<h4>3.2.1 Go !!!!<br />
</h4>I have already been working on this for quite a while, but decided to let go the current implementation.<br />
The basic idea is to start from nothing.<br />
<br />
I have had my own &quot;Eureka&quot; moment while driving to one of my customers.<br />
It is actually based upon the act_as_...-modules from RubyOnRails.<br />
<br />
The whole idea is using some kind of loosely coupled objects &amp; tables to extend the base functionality from the core objects.<br />
Some possible implementations :<br />
<ul>
	<li>ActAsCommentable : by invoking this module the users will be able to add comments to the base object </li>
	<li>ActAsTaggable : this module will make a base-object taggable. Hierarchies should be possible in a vocabulary<br />
	</li>
	<li>ActAsSecured : will (dis)allow CRUD operations </li>
	<li>ActAsDefaultForm : will create a basic browsable/editable table using some kind of template. </li>
	<li>ActAsList : will modify a certain field to be represented by a field from another table. </li>
	<li>ActAsLoggable : self-explanatory<br />
	</li>
	<li>...</li>
</ul>
This list will probably extend over time... Some people might recognize this stuff as AOP ...<br />
<br />
Well, that should be it for the first post. Now I&#39;m off to home, and later this evening I will start with the implementation.<br />
<br />
Wish me Luck !!!!<br />
<br />
<br />
<br />
<br />
<br />
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
