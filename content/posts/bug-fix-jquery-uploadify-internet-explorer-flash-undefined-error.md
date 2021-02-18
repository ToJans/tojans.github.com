---
layout: post
date: "2009-04-14"
slug: "bug-fix-jquery-uploadify-internet-explorer-flash-undefined-error"
title: 'Bug fix : JQuery Uploadify / Internet explorer / Flash Undefined error'
---

<p>
I had the problem that the <a href="https://www.corebvba.be/blog/admin/Pages/www.uploadify.com">upload component</a> did not work with a client of mine on different versions of IE . 
</p>
<p>
This is appearantly due to the way flash works with dynamic flash components located within form tags in internet explorer.<br />
The fix is really easy, but it was really nasty to find the cause... 
</p>
<p>
If your code looks like this : 
</p>
<p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <code>$(&quot;#FileToUpload&quot;).fileUpload({&nbsp;&nbsp; ...&nbsp;&nbsp;&nbsp; });&nbsp;</code>
</p>
<p>
<code></code><code>&nbsp;&lt;form&gt;&nbsp; &lt;input type=&quot;file&quot; id=&quot;FileToUpload&quot;/&gt;&lt;/form&gt; <br />
<br />
</code>just add a new line after &#39;uploadifying&#39; the element : <code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
<br />
FileToUploadUploader=document.getElementById(&quot;FileToUploadUploader&quot;); <br />
<br />
</code>So you define a javascript global var with the name of your element+&quot;Uploader&quot;, and assign the element to it.... 
</p>
<p>
That&#39;s all there is to it... 
</p>
<p>
&nbsp;
</p>
