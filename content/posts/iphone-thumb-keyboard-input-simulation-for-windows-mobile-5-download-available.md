---
layout: post
date: "2007-07-10"
slug: "iphone-thumb-keyboard-input-simulation-for-windows-mobile-5-download-available"
title: iPhone thumb keyboard input simulation for windows mobile 5 / download available
---

<p>
I have been&nbsp;extending <a href="https://www.corebvba.be/blog/IPhone+UI+Study+Keyboard+Text+Input+And+Gestures+Mock+Up+Download+Here">my&nbsp;former iPhone UI input simulations</a> further, and migrated the intelligent thumb keyboard part to windows mobile 6 : 
</p>
<p>
&nbsp;<img src="/blog/content/binary/iphoneMockupWM6.GIF" border="0" alt="" width="28" height="30" /> 
</p>
<p>
Some examples of wrong keyboard input, while the expected result was still first match : 
</p>
<ul class="rml-list">
	<li>SURROGATE (input text&nbsp;: XUERMFSRE ) </li>
	<li>TWEAKER (input text : YSRALDR ) </li>
	<li>ABSOLUTE BEGINNER (input text : ZHDIMYTR JRHOKKER)</li>
</ul>
<p>
It does run on the emulator, but it seems to be a little slow. It would be interesting if YOU could test it yourself on a real windows mobile 5 device, and test the performance. Please download and test it yourself, and leave me a comment about it. 
</p>
<p>
Since it is only a prototype, I&nbsp;am of course open to suggestions. Some things on my todo list : 
</p>
<ul>
	<li>Support for caps/non-letters </li>
	<li>Convert it into a WM5 keyboard plugin </li>
	<li>make it skinnable </li>
	<li>support extra dictionaries </li>
	<li>allow the user to add words. </li>
	<li>SPEED &amp; memory usage improvements (currently uses about 12,7MB, no idea about the speed)</li>
</ul>
<p>
The windows version<a href="https://www.corebvba.be/blog/IPhone+UI+Study+Keyboard+Text+Input+And+Gestures+Mock+Up+Download+Here"> of the former program</a> has also been adapted and the gesture part has been improved : 
</p>
<p>
<img src="/blog/content/binary/iphoneMockupPC2.GIF" border="0" alt="" width="28" height="30" /> 
</p>
<p>
You can now define if a mouse gesture has to be located in a certain place, and if the size of the gesture is important by clicking on it and modifying the parameters. 
</p>
<p>
&nbsp;
</p>
<p>
<u><strong>Downloads:</strong></u> 
</p>
<p>
You can download the Windows Mobile 5 version here (just unzip and copy the exe to your device, and execute it from there): 
</p>
<p>
<strong>Download for windows mobile 5 :</strong>&nbsp;<a href="https://www.corebvba.be/blog/content/binary/coreInput.zip">coreInput.zip (253,25 KB)</a> 
</p>
<p>
The Windows Version can be found here (unzip &amp; run) 
</p>
<p>
<strong>Download for Windows&nbsp;PC :</strong> <a href="https://www.corebvba.be/blog/content/binary/IphoneMockup12.zip">IphoneMockup12.zip (258,87 KB)</a> 
</p>
<p>
You require .Net 2.0 runtimes on both of the platforms to run the app.<br />
If you want to you can also run the WM5 version from your pc too. 
</p>
<p>
&nbsp;
</p>
<p>
<u><strong>Some implementation details :</strong></u> 
</p>
<ul>
	<li>Knows +/- 75000 English words. </li>
	<li>Uses a self-developped DAWG-like structure to reduce memory usage and improve performance. </li>
	<li>Gesture system is still orientation dependent, but could be easily made ori&euml;ntation independent. </li>
	<li>Currently the source code is written preferring clarity over speed &amp; memory usage</li>
</ul>
<p>
&nbsp;
</p>
<p>
<u><strong>And finally :</strong></u> 
</p>
<p>
Please comment !! Give me your opinion, either good or bad !!!<br />
Also not that the windows mobile version might take a little while to load. 
</p>
<p>
&nbsp;
</p>
