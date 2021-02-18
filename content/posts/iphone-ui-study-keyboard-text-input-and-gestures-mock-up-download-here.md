---
layout: post
date: "2007-07-04"
slug: "iphone-ui-study-keyboard-text-input-and-gestures-mock-up-download-here"
title: 'IPhone UI study : keyboard text input and gestures mock up - download here'
---

<p>
<strong>Updated !!!<br />
</strong><strong>Somebody in&nbsp;stated in a&nbsp;comment&nbsp;he got an exception. I finally found the cause of it, and updated the application. Download the new version below, and be sure to refresh your browser cache</strong> 
</p>
<p>
While looking at a few you tube videos about the iPhone, especially regarding the keyboard/text input, I was thinking : hey, why wouldn&#39;t&nbsp;I try to replicate the iPhone UI behavior ?&nbsp;I don&#39;t think it&nbsp;&nbsp;should be that hard ... 
</p>
<p>
Being able to use your fingers on a PDA instead of a stylus would improve the usability of handhelds a lot. 
</p>
<p>
So yesterday I started developing, and after a few hours I had basic gesture recognition, and I got a few ideas on how to do the keyboard mapping. 
</p>
<p>
Finally this is the result : 
</p>
<p>
<img src="/blog/content/binary/IphoneMockup.GIF" border="0" alt="" width="28" height="30" /> 
</p>
<p>
The demo mainly consists of two parts : 
</p>
<p>
The gestures : 
</p>
<ul>
	<li>Draw a gesture in the designated area. </li>
	<li>Define a name in the text box and press the &#39;Add...&#39; button to add a gesture to the list </li>
	<li>Every time you draw a gesture the closest match to the registered gestions will be visible under &#39;Last recognized gesture&#39;</li>
</ul>
<p>
The text input : 
</p>
<ul>
	<li>Click on the buttons to form a word as quick as you can.&nbsp;For most larger words you do not need a lot of precision while typing. </li>
	<li>When the selected word in the list box is OK press &lt;Space&gt; or &lt;Enter&gt; </li>
	<li>In the example above I wanted to&nbsp;type the word <strong>&quot;STARTED&quot;</strong>, but i missed a few buttons. Still, the algorithm can figure out that&nbsp;while&nbsp;I typed&nbsp;<strong>&quot;QTATTEX&quot;</strong> I actually meant started. </li>
	<li>Click once on the list box with suggestions to select the next item in the list. </li>
	<li>If you want to select the literal text (bottom left), just click on it. The literal will be added to your text. </li>
	<li>Press &lt;CLR&gt; to re-enter a word.</li>
</ul>
<p>
You can download the demo here : 
</p>
<p>
<a href="https://www.corebvba.be/blog/content/binary/IphoneMockup1.zip">IphoneMockup1.zip (399,67 KB)</a>&nbsp;<br />
<br />
<u>New version on 2007/7/5 !!&nbsp;<br />
</u>- fixed the Unhandled exception when a gesture exists of a single point click. 
</p>
<p>
This demo runs on windows/.NET 2.0, and the supported language is English only atm.<br />
If I manage to find a pocketpc I will try to port it to the compact framework. 
</p>
<p>
Please let me know what you think of this application by posting a comment. 
</p>
