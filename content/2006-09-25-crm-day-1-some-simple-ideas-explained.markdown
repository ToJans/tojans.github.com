---
layout: post
title: ! 'CRM day 1 : Some simple ideas explained'
---

<p>
Today I will not actually program any stuff, but i will layout some basic stuff on <strike>paper </strike>this blog.
</p>
<h4>First draft :</h4>
<p>
I will start from the default object properties :
</p>
<p>
DefaultObjectProps :
</p>
<ul>
	<li>id : unique identifier </li>
	<li>description : text description (for dropdownlists etc) </li>
	<li>created : date of creation </li>
	<li>created by : user </li>
	<li>modified : date of last modification </li>
	<li>modified by : user</li>
</ul>
<p>
Then the default act_as_props
</p>
<p>
DefaultActAsProps &lt; DefaultObjectProps
</p>
<ul>
	<li>Parent (id, type)</li>
</ul>
<p>
ActAsSecured &lt; DefaultActAsProps
</p>
<ul>
	<li>OwnerUser : user </li>
	<li>OwnerGroup : group </li>
	<li>UserRights,GroupRights,AnonymousRights : CRUD bools </li>
	<li>implements : 
	<ul>
		<li>bool Allow Read (type,int id) </li>
		<li>bool Allow Write (type,int id) </li>
		<li>bool Allow Create (type,int id) </li>
		<li>bool Allow Update (type,int id)</li>
	</ul>
	</li>
</ul>
<p>
ActAsTree &lt; DefaultActAsProps
</p>
<p>
ActAsPageable &lt; DefaultActAsProps
</p>
<p>
ActAsSortable &lt; DefaultActAsProps
</p>
<p>
ActAsFilterable &lt; DefaultActAsProps
</p>
<p>
ActAsTaggable &lt; DefaultActAsProps
</p>
<p>
ActAsSchedule &lt; DefaultActAsProps
</p>
<p>
ActAsCommentable &lt; DefaultActAsProps
</p>
<p>
ActAsRule &lt; DefaultActAsProps
</p>
<p>
ActAsFileContainer &lt; DefaultActAsProps
</p>
<p>
An object instance can be represented in two ways
</p>
<ul>
	<li>PresentAsRow : Object row view </li>
	<li>PresentAsForm : Object Form view</li>
</ul>
<p>
These rowpresenters will be&nbsp;used in a form. The default form view will be modified by the act-as modules
</p>
<p>
For example :
</p>
<ul>
	<li>If an object implements ActAsTree, the&nbsp;grid&nbsp;can be modified into a treeview </li>
	<li>If an object implements ActAsTaggable, each&nbsp;object can be tagged </li>
	<li>If an object implements ActAsSchedule, the objects can be shown in a calendar view </li>
	<li>...&nbsp;</li>
</ul>
<p>
I hope you get the idea from these examples...
</p>
<p>
That is it for today... See you again tomorrow...
</p>
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
