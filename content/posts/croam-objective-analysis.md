---
date: "2004-11-30"
slug: "croam-objective-analysis"
title: "CROAM - objective analysis"
---

<p>
In my study for the &#39;perfect&#39; project analysis tool, I developed a new analysis model , I&#39;ll call <strong>CROAM </strong>from now (Core Recursive Objective Analysis Model).<br />
With this model, one should be able to analyze almost anything. The whole new idea of this model is the fact that it&#39;s a recursive model, it gets recursed by refining the objectives.<br />
This model can be used to map business processes, create project plans, ...
</p>
<p>
I&#39; ll explain this model with an imaginary company called &#39;Xmastree&#39;, a company that&nbsp;sells Christmas trees.
</p>
<p>
The graph for each objective in this model looks like this :
</p>
<p>
<img src="/images/archive/corebvba/Cram.gif" alt="" width="487" height="191" />
</p>
<p>
Example objectives:
</p>
<ol>
	<li><u>&nbsp;The&nbsp;CEO</u>&nbsp;wants <u>the&nbsp;management</u>&nbsp; to <strong>increase the profit</strong>, and let <u>the accounting division</u> inform <u>him (the manager)</u> about it. 
	<ol>
		<li><u>The Management</u>&nbsp;wants <u>the Marketing Division</u> to <strong>Increase Customer sales</strong>, and lets&nbsp;<u>a survey company</u>&nbsp;inform <u>them (the management)</u> 
		<ol>
			<li><u>The Marketing division</u>&nbsp;wants&nbsp;<u>the regional television</u> to <strong>publish a documentary about ecologic awareness within the company</strong> , and lets <u>the regional television </u>inform <u>the customers</u>. </li>
			<li><u>The Marketing division</u>&nbsp;wants&nbsp;<u>the&nbsp;national&nbsp;newspaper</u> to <strong>publish a marketing campaign</strong>, and lets <u>the&nbsp;newspaper </u>inform <u>the customers</u>. </li>
			<li><u>The Marketing division</u>&nbsp;wants <u>The Marketing division</u>&nbsp; to&nbsp;<strong>do a&nbsp;mailing to it&#39;s high potentials</strong>, and lets <u>the Marketing division</u> inform <u>the customers</u></li>
		</ol>
		</li>
		<li><u>The Management</u>&nbsp;wants the&nbsp;<u>HRM Division</u> to <strong>Streamline personnel costs</strong>, and lets the <u>accounting division</u> inform <u>them (the management)</u> 
		<ol>
			<li><u>The Hrm division</u>&nbsp;wants <u>the accounting division</u> to <strong>report all logistic costs by division</strong> and lets <u>the accounting division</u> inform <u>them(the hrm division)</u> </li>
			<li><u>The Hrm division</u> wants <u>The Hrm division</u> to&nbsp;<strong>apply logistic hrm savings</strong> and lets <u>The Hrm division</u> inform <u>the management.</u></li>
		</ol>
		</li>
		<li><u>The Management</u> asks the&nbsp;<u>ICT Division</u> to <strong>Optimize communication costs</strong>, and lets the <u>accounting division</u> inform <u>them (the management)</u> </li>
		<li><u>The Accounting division</u> wants <u>the accounting division</u> to <strong>report profit gains</strong>, and lets the <u>accounting division</u> inform <u>the CEO</u></li>
	</ol>
	</li>
</ol>
<p>
This gives an easy to define analysis method. Each step mentioned in the example above, contains a <u>Requester</u>, <u>a negotiator</u>, <strong>an objective</strong>,&nbsp;<u>a deliverer</u> and&nbsp;<u>an acceptor</u>.
</p>
<p>
The following step is to define when a certain objective can be put in a certain state.&nbsp; 
</p>
<p>
As an example, <strong>objective 1.2.2</strong> should be put in a <em><u>Refused</u></em> state when <strong>objective 1.2.1</strong> receives a <em><u>Decline</u></em> or <em><u>Refused</u></em> state. <strong>Objective 1.2.2 </strong>should be put in a <em><u>Request</u></em> state when <strong>objective 1.2.1</strong> receives an&nbsp;<em><u>Accept</u></em> state
</p>
<p>
Using this simple technique one should be able to describe all&nbsp; business processes of a company in a simple way.
</p>
<p>
The next step for me will be creating a program that implements work flows using this kind of analysis as a proof of concept. The final idea is to implement this in CUDI (my universal database framework).
</p>
