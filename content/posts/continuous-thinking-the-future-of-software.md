---
layout: post
date: "2010-12-15"
slug: "continuous-thinking-the-future-of-software"
title: 'Continuous thinking: The future of software'
---

<h3>Introduction</h3>
<p>In this small article I am going to ventilate my recent thoughts on the evolutions and the future of software (both platform and development methodology). This is my first attempt for such an article, so please do not take it too serious. Maybe within 5 to 10 years time, one will be able to read this article and have a big laugh, but then again, I am hoping to get at least a few predictions right.</p>
<h3>Application architecture</h3>
<p>I think the next big thing leveraging software and it's development will be HTML5. The basic architecture would be like this:</p>
<ul>
<li>the client will be a task-based GUI running on the HTML5 platform; HTML5 will be supported on most peripherals.</li>
<li>the GUI will be able to generate explicit commands (poco class instances) and query view data L/WS* (=local and/or from one or more webservices)</li>
<li>these commands will be handled L/WS*</li>
<li>when the command is executed, the changes will be propagated explicitly through events (=poco class instances), or change the view data directly</li>
<li>these events will be processed L/WS* and will update the respective view data L/WS*</li>
<li>viewdata can be generated and persisted locally and/or on the server, and syncing is a mather of syncing commands and events</li>
<li>commands, events and view data will probably be published through some kind of ATOM/ODATA-like interface (or persisted locally)</li>
<li>due to more and more microdata formats and standards, webservices will become interchangeable (think address lists for example)</li>
<li>All devices will get a webservice interface (think phones/peripherals in general), usually with a full REST implementation</li>
</ul>
<h3>Consequences<br /></h3>
<p>This would imply that a well written app (in HTML5) would be able to:</p>
<ul>
<li>query/consolidate microdata or other standardized formats locally and from multiple sources</li>
<li>disconnected apps could easily be synchronized</li>
<li>app components should be reusable, apps should be composed of multiple HTML5 components</li>
<li>it could work in both offline and online mode</li>
<li>it should support multiple media/input methods</li>
<li>apps should work on a plethora of platforms without to much effort</li>
</ul>
<h3>The environment/tools</h3>
<p>In order to make this possible I expect the following</p>
<ul>
<li>the development language of choice will probably need to be the same for both the webservice and the client-side. This does not need to be javascript; it can be an other language translated to javascript for the HTML5 side (think Coffeescript for example)</li>
<li>commands, events and the handlers should be first-class members of the language of choice, or at least offer a framework that makes it easy to use this.</li>
<li>there will be a registry which would contain the mappings to resources (either local or on one of more webservices) - this registry might be a webservice in itself, for example a webservice of registry for all your personal multimedia resources</li>
<li>sharing data between different platforms would become universal (think movies/music for example)</li>
<li>caching/syncing data should be as simple as calling a single function</li>
<li>replication/failover is a piece of cake to setup</li>
<li>CQRS/BDD will be hot</li>
<li>monitoring the infrastructure is easy</li>
<li>everything will become continuous: continuous integration through a buildserver, continuous testing (think autotest.Net for example), continuous deployment, continuous monitoring</li>
<li>authentication will also be done through webservices or through current http/SSL/OID/... implementations</li>
<li>some kind of universal search which goes through all resources in the registry should be possible</li>
</ul>
<h3>Finally</h3>
<p>I think in the end we will get an application that sends commands to a bus, which is either handling things locally and/or on one or more webservices. The app will also be able to either query the local data or some webservice for view data.</p>
<p>The registry of webservices will make it possible to plugin your own stuff without much hassle, and caching/backup/failover/monitoring should all become a non-issue.</p>
<p>A few possible problems come to mind here, which might be excuses why my predictions could be false:</p>
<ul>
<li>migrating/integrating legacy systems</li>
<li>software/Services ownership and -protection</li>
<li>CQRS/BDD acceptance might be hard for some devs</li>
<li>implementations differences of HTML5</li>
<li>REST webservices might be replaced by something faster/with less overhead (protobuf comes to my mind for example)</li>
</ul>
<p>In the end, what it all comes down to, is finding a balance between simplicity, flexibility, complexity availability and concurrency.</p>
<p>&nbsp;</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
