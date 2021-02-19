---
layout: post
date: "2010-09-28"
slug: "my-cqrs-cookbook"
title: 'My #CQRS cookbook'
Tags: ["Development", "DDD"]
---

<p>Here is my personal take on how I interpret all things CQRS...</p>
<h2>Commercial impact: why use CQRS ?<br /></h2>
<p>CQRS enforces you to apply strict boundaries to your app in a consistent way. <br />These boundaries convert your single application into 3 separate parts, only coupled by commands, events and queries.<br />By using CQRS you convert your single app into 3 apps who can be built in parallel.</p>
<p>So basically, when you do have enough resources, the approach can decrease your time to implement something by a factor of 2.5 (estimate, 3 times - 0.5 for the common interfaces - commands, events and queries).</p>
<p>Since all the parts require a different kind of development knowledge, it is easier to assign parts to developers based on their expertise/domain knowlege etc.</p>
<p>It also implies that your app is composed of smaller - and thus more maintainable- units.</p>
<p>CQRS also enables distributed applications as well (i.e. higly scalable cloud apps)</p>
<p>For a software shop, CQRS can be a huge commercial advantage...</p>
<p>(On a technical side note CQRS also makes integration testing super simple, due to it's boundaries)</p>
<p>&nbsp;</p>
<h2>Explaining CQRS and MVC: the simplest explanation possible (AFAIK)<br /></h2>
<p>(For reasons of simplicity, sagas are not mentioned here)</p>
<p>This is how MVC works with CQRS</p>
<ul>
<li>UI invokes a function on the controller</li>
<li>A  controller function can either:          
<ul>
<li>Query a viewmodel and send it to the UI</li>
<li>Run a command using the following sequence<br />
<ul>
<li>Build a command</li>
<li>Push the command to the bus and verify whether it was a valid command</li>
<li>Redirect to another controller function (which is chosen based on the validity of the command)</li>
</ul>
</li>
</ul>
</li>
</ul>
<p>This is how the bus works</p>
<ul>
<li>The bus receives and validates a command before accepting it</li>
<li>The bus delegates a valid command to a command handler</li>
<li>The command handler converts the valid command in to a function call on an aggregate root</li>
<li>The function call on the aggregate root can send events (state changes in the domain)</li>
<li>The aggregate roots consume the published events (i.e. changes are applied to the respective domain entities)</li>
<li>The event handlers consume the published events (i.e. changes are applied to the respective viewmodels)</li>
</ul>
<p></p>
<h2>Definitions<br /></h2>
<h3>Command</h3>
<p>A Command represents a request to change the domain state.</p>
<p>A Command is consumed once by a Command Handler.</p>
<p>Command names should always be in the imperative (i.e. CancelOrder )</p>
<h3>(Domain) event</h3>
<p>An event represents a state change in the domain.</p>
<p>Events are handled by AR's, Sagas and Event Handlers</p>
<p>Event names should always be in the past tense (i.e. OrderCanceled )</p>
<h3>Aggregate root (AR)<br /></h3>
<p>DDD definition +</p>
<p>An AR contains public functions which can publish Events. (these events happen in a single transactional boundary - think unit of work)</p>
<p>An AR can also consume Events which are about itself.</p>
<h3>Saga</h3>
<p>A saga consolidates Event information accross AR boundaries.</p>
<p>A saga can raise Commands based on the consolidated events or a time event.</p>
<p>A saga is considered a temporal object (i.e. limited lifetime)</p>
<h3>Command Handler</h3>
<p>A command handler converts a command into a function call on an AR by:</p>
<ul>
<li> Converting the command's parameters into the target function's parameters, sometimes using the viewmodel to convert and/or extend the command parameters into parameters understandable by the AR.</li>
<li>Calling the function on the AR.</li>
<li>The function will emit zero or more events</li>
</ul>
<h3>Event handler</h3>
<p>An event handler applies the state changes to it's respective target (i.e. a viewmodel or an AR)</p>
<h3>Viewmodel<br /></h3>
<p>A view model is a representation of the UI data using a first normal form datamodel</p>
<h1>How to handle business logic which crosses multiple AR boundaries ?<br /></h1>
<p>If you need to process some logic which crosses multiple AR boundaries, you can either create a new AR which references those AR's, or create a Saga which consolidates events about these ARs.</p>
<p>To know which one to create, you need to know your domain expert's opinion on the transition process. If the domain expert only cares about the endresult, you should use a saga. If your domain expert needs to be exposed to the transformation process in itself, then you should use an AR.</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
