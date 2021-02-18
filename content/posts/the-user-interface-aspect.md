---
layout: post
date: "2004-11-30"
slug: "the-user-interface-aspect"
title: The user interface aspect
---

<p>
Her is an excerpt from my former blog regarding user interface aspects... It&#39;s interesting to see how my opinion evolved from this kind of thinking to CROAM
</p>
<p>
previous web logs can be found @ <a href="https://corebvba.blogspot.com/">blogspot</a>
</p>
<p>
&nbsp;
</p>
<p>
---&gt;&lt;8----------------------
</p>
<p>
A user-interface is one of the points that makes or breaks your program when users start to work with it. Millions of euros are being invested into programs that never get used, since the users find it un-intuitive.
</p>
<p>
&nbsp;Most ICT people tend to think in abstract concepts like objects and relations due to their education, while most users think in terms of a process. In each business you can identify several business processes.
</p>
<p>
&nbsp;Let&#39;s take an order for example: 
</p>
<ul>
	<li>The <u>company</u> receives a <strong>customer</strong>&#39;s <strong>order</strong> for several <strong>items</strong>. </li>
	<li>The <u>company</u> arranges a <strong>delivery</strong> for the <strong>order</strong>. </li>
	<li><u>At the end of the month</u> the an <strong>Invoice</strong> from the former <strong>Delivery</strong> is being sent to the <strong>Customer</strong>. </li>
	<li>The <u>company</u> receives a <strong>payment notice</strong> for the <strong>order</strong>. </li>
</ul>
<p>
Of course this is not a complete process, the customer could cancel the order, or the delivery could fail, he could refuse to pay, or only pay a part of the invoice, ... 
</p>
<p>
Most programs offer a view on the words in <strong>BOLD</strong>, called objects . While you can input all different steps noted above in such a view, it&#39;s hard to keep an overview of what you were doing, especially if it&#39;s been a few weeks since you last touched it. You have to examine his orders/invoices If you remember you still need to do something... 
</p>
<p>
In order to solve this problem we need to look at it from a different point of view. People think in processes and their phase it&#39;s in. 
</p>
<p>
In this case we have the following situation: 
</p>
<ul>
	<li>3 initiators : Customer / Company / End of the month </li>
	<li>4 steps : order / delivery / invoicing / payment </li>
	<li>all of these steps could have different states : Pending / Busy / Finished / Canceled </li>
</ul>
<p>
(note this is a simple example, and we could have several other initiators, steps and states for invoices) 
</p>
<p>
In an ideal situation, the Company would not be working with customers,orders,invoices, items, deliveries and payments directly, but with processes and their state. That would imply having a wizard for each process, that guides you towards the next step in this process, depending on the initiator and the previous phase/state . That&#39;s where the user-interface comes in. What people really need is a wizard-like form to guide them to the next step.... Please note that most of the time it is not profitable from a return-on-investment point of view for a program to have all the processes directly accessible from a wizard. People should still be able to browse data using the object-interface, but more info regarding this subject will be in my next blog entry. This article was actually written as a post-reflection to our first version of CUDI (the core universal database). We will now solve the issues noted in this document, and apply them to our second version.
</p>
