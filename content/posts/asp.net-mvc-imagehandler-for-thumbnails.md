---
layout: post
date: "2009-01-26"
slug: "asp.net-mvc-imagehandler-for-thumbnails"
title: ASP.NET MVC ImageHandler for thumbnails
---

<span style="font-size: 10pt; color: #003300; font-family: Verdana">As some of you might know, I am a really big fan of community-driven technologies. I also like to contribute myself in order to exchange new ideas and meet new people with common interests.</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">Since I am quite new to ASP.NET MVC, I was thinking I would submit my first contribution : handling all your images through a custom actionresult/controller.<br />
This allows me to do several things : </span>
<ul>
	<li>uniform access to images</li>
	<li>possibility for custom types (this example ALWAYs renders as PNG)</li>
	<li>generation of thumbnails.</li>
</ul>
<p>
<span style="font-size: 10pt; color: #003300; font-family: Verdana">Let&#39;s start with the code for the ActionResult (initially inspired by/copy-pasted&nbsp;from <a href="https://blog.maartenballiauw.be/post/2008/05/ASPNET-MVC-custom-ActionResult"><font color="#800080">this</font></a>&nbsp;, but since the new RC it is my own code):</span> 
</p>
<span style="font-size: 10pt; color: #003300; font-family: Verdana"><font size="2" color="#0000ff"><font size="2" color="#0000ff"></font></font></span><span style="font-size: 10pt; color: #003300; font-family: Verdana"><font size="2" color="#0000ff"><font size="2" color="#0000ff"><font size="2" color="#0000ff"><font size="2" color="#0000ff">
<p>
using<font size="2"><font color="#000000"> System.IO;<br />
</font></font>using<font size="2"><font color="#000000"> System.Web.Mvc;<br />
</font></font><font size="2" color="#0000ff"><font size="2" color="#0000ff">using</font></font><font size="2"><font color="#000000"> System.Drawing;<br />
<font size="2" color="#0000ff"><font size="2" color="#0000ff">using</font></font><font size="2"> System.Drawing.Imaging;</font><br />
<br />
</font></font><font size="2" color="#0000ff"><font size="2" color="#0000ff">namespace</font></font><font size="2"><font color="#000000"> Be.Corebvba.MVC<br />
</font>{<br />
&nbsp; </font><font size="2" color="#0000ff"><font size="2" color="#0000ff">public</font></font><font size="2"> </font><font size="2" color="#0000ff"><font size="2" color="#0000ff">class</font></font><font size="2"> </font><font size="2" color="#2b91af"><font size="2" color="#2b91af">ImageResult</font></font><font size="2"> : </font><font size="2" color="#2b91af"><font size="2" color="#2b91af">FileStreamResult</font></font><font size="2"> <br />
&nbsp; {</font> <br />
&nbsp;&nbsp;&nbsp; <font size="2" color="#0000ff"><font size="2" color="#0000ff">public</font></font><font size="2"> ImageResult(</font><font size="2" color="#2b91af"><font size="2" color="#2b91af">Image</font></font><font size="2"> input):</font><font size="2" color="#0000ff"><font size="2" color="#0000ff">this</font></font><font size="2">(input,input.Width,input.Height)</font><font size="2"> { } </font>
</p>
</font></font></font></font><font size="2" color="#0000ff"><font size="2" color="#0000ff">&nbsp;&nbsp;&nbsp; public</font></font><font size="2"> ImageResult(</font><font size="2" color="#2b91af"><font size="2" color="#2b91af">Image</font></font><font size="2"> input, </font><font size="2" color="#0000ff"><font size="2" color="#0000ff">int</font></font><font size="2"> width,</font><font size="2" color="#0000ff"><font size="2" color="#0000ff">int</font></font><font size="2"> height) : <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><font size="2"></font><font size="2" color="#0000ff"><font size="2" color="#0000ff">base</font></font><font size="2">(<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GetMemoryStream(input,width,height,</font><font size="2" color="#2b91af"><font size="2" color="#2b91af">ImageFormat</font></font><font size="2">.Png),<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><font size="2" color="#a31515"><font size="2" color="#a31515">&quot;image/png&quot;</font></font><font size="2">)</font><font size="2">&nbsp;<br />
&nbsp;&nbsp;&nbsp;{ } <br />
<br />
&nbsp;&nbsp;&nbsp; </font><font size="2" color="#0000ff"><font size="2" color="#0000ff">static</font></font><font size="2"> </font><font size="2" color="#2b91af"><font size="2" color="#2b91af">MemoryStream</font></font><font size="2"> GetMemoryStream(</font><font size="2" color="#2b91af"><font size="2" color="#2b91af">Image</font></font><font size="2"> input,</font><font size="2" color="#0000ff"><font size="2" color="#0000ff">int</font></font><font size="2"> width,</font><font size="2" color="#0000ff"><font size="2" color="#0000ff">int</font></font><font size="2"> height,</font><font size="2" color="#2b91af"><font size="2" color="#2b91af">ImageFormat</font></font><font size="2"> fmt)</font><font size="2"> <br />
&nbsp;&nbsp;&nbsp; { <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="2" color="#008000"><font size="2" color="#008000">// maintain aspect ratio</font></font> <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><font size="2"></font><font size="2" color="#0000ff"><font size="2" color="#0000ff">if</font></font><font size="2"> (input.Width &gt; input.Height)</font><font size="2"> <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; height = input.Height * width / input.Width;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2" color="#0000ff"><font size="2" color="#0000ff">else</font></font> <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><font size="2">width = input.Width * height / input.Height; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><font size="2" color="#0000ff"><font size="2" color="#0000ff">var</font></font><font size="2"> bmp = </font><font size="2" color="#0000ff"><font size="2" color="#0000ff">new</font></font><font size="2"> </font><font size="2" color="#2b91af"><font size="2" color="#2b91af">Bitmap</font></font><font size="2">(input, width, height);</font><font size="2"> <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="2" color="#0000ff"><font size="2" color="#0000ff">var</font></font><font size="2"> ms = </font><font size="2" color="#0000ff"><font size="2" color="#0000ff">new</font></font><font size="2"> </font><font size="2" color="#2b91af"><font size="2" color="#2b91af">MemoryStream</font></font><font size="2">();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bmp.Save(ms, </font></font><font size="2" color="#2b91af"><font size="2" color="#2b91af">ImageFormat</font></font><font size="2">.Png);</font><font size="2"> <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ms.Position = 0; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><font size="2" color="#0000ff"><font size="2" color="#0000ff">return</font></font><font size="2"> ms;</font><font size="2"> <br />
&nbsp;&nbsp;&nbsp;&nbsp; } <br />
&nbsp;&nbsp; } <br />
} 
<p>
<span style="font-size: 10pt; color: #003300; font-family: Verdana"></span>
</p>
</font></span><span style="font-size: 10pt; color: #003300; font-family: Verdana">The code&nbsp;for the controller is pretty straighforward as well :<br />
<br />
</span><span style="font-size: 10pt; color: blue; font-family: Verdana">public</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> </span><span style="font-size: 10pt; color: #2b91af; font-family: Verdana">ActionResult</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> ThumbImage(</span><span style="font-size: 10pt; color: blue; font-family: Verdana">int</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> id,</span><span style="font-size: 10pt; color: blue; font-family: Verdana">int</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> width,</span><span style="font-size: 10pt; color: blue; font-family: Verdana">int</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> height)<br />
{<br />
&nbsp;&nbsp; </span><span style="font-size: 10pt; color: blue; font-family: Verdana">var</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> d = _rDocument.GetById(id);<br />
&nbsp;&nbsp; </span><span style="font-size: 10pt; color: #2b91af; font-family: Verdana">Image</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> i=</span><span style="font-size: 10pt; color: blue; font-family: Verdana">null</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">;<br />
&nbsp;&nbsp; </span><span style="font-size: 10pt; color: blue; font-family: Verdana">try<br />
&nbsp;&nbsp; </span><span style="font-size: 10pt; color: #003300; font-family: Verdana">{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i = </span><span style="font-size: 10pt; color: #2b91af; font-family: Verdana">Image</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">.FromFile(d.PhysicalFilename);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: 10pt; color: blue; font-family: Verdana">return</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> </span><span style="font-size: 10pt; color: blue; font-family: Verdana">new</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> Be.Corebvba.MVC.</span><span style="font-size: 10pt; color: #2b91af; font-family: Verdana">ImageResult</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">(i, width, height);<br />
&nbsp;&nbsp; }<br />
&nbsp;&nbsp; </span><span style="font-size: 10pt; color: blue; font-family: Verdana">catch</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> (</span><span style="font-size: 10pt; color: #2b91af; font-family: Verdana">Exception</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> ex)<br />
&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i = </span><span style="font-size: 10pt; color: blue; font-family: Verdana">new</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> </span><span style="font-size: 10pt; color: #2b91af; font-family: Verdana">Bitmap</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">(1, 1);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: 10pt; color: blue; font-family: Verdana">return</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> </span><span style="font-size: 10pt; color: blue; font-family: Verdana">new</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> Be.Corebvba.MVC.</span><span style="font-size: 10pt; color: #2b91af; font-family: Verdana">ImageResult</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">(i,1,1);<br />
&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp; </span><span style="font-size: 10pt; color: blue; font-family: Verdana">finally<br />
&nbsp;&nbsp; </span><span style="font-size: 10pt; color: #003300; font-family: Verdana">{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-size: 10pt; color: blue; font-family: Verdana">if</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> (i != </span><span style="font-size: 10pt; color: blue; font-family: Verdana">null</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">) i.Dispose();<br />
&nbsp;&nbsp; }<br />
}<br />
<br />
</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">This does need some better errorhandling, but I suppose you get the idea... (The _rDocument is a pointer to a Document repository which stores physical files. If you access your images from a database, you could simply use Image.FromStream instead of an Image.FromFile .</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">In my document i reference the image as follows, et voila, automatic thumbnails&nbsp;:<br />
<br />
</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">&lt;% </span><span style="font-size: 10pt; color: blue; font-family: Verdana">var</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> imgurl = Url.Action(</span><span style="font-size: 10pt; color: #a31515; font-family: Verdana">&quot;ThumbImage&quot;</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">, </span><span style="font-size: 10pt; color: #a31515; font-family: Verdana">&quot;Documents&quot;</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">, </span><span style="font-size: 10pt; color: blue; font-family: Verdana">new</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> { id = d.ID,width=100,height=100 }); %&gt;<br />
</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&lt;</span><span style="font-size: 10pt; color: #a31515; font-family: Verdana">img</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">src</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=&quot;</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">&lt;%=imgurl %&gt;</span><span style="font-size: 10pt; color: blue; font-family: Verdana">&quot;</span><span style="font-size: 10pt; color: #003300; font-family: Verdana"> </span><span style="font-size: 10pt; color: red; font-family: Verdana">style</span><span style="font-size: 10pt; color: blue; font-family: Verdana">=&quot;</span><span style="font-size: 10pt; color: red; font-family: Verdana">float</span><span style="font-size: 10pt; color: #003300; font-family: Verdana">:</span><span style="font-size: 10pt; color: blue; font-family: Verdana">left&quot;/&gt;</span><font face="Times New Roman" size="3">&nbsp;</font> 
