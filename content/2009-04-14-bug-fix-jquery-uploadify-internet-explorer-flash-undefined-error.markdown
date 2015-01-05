---
layout: post
title: ! 'Bug fix : JQuery Uploadify / Internet explorer / Flash Undefined error'
---

<p>
I had the problem that the <a href="http://www.corebvba.be/blog/admin/Pages/www.uploadify.com">upload component</a> did not work with a client of mine on different versions of IE . 
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
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
