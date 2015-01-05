---
layout: post
title: Safe method invoker in c#
---

<p>
Today I was reading <a href="http://www.codeproject.com/useritems/SafeMethodCaller.asp">an article on codeproject by Mark Clifton about using a safe invoker for a method</a>. 
</p>
<p>
While the idea was quite good, I think the implementation was a bit bloated, so<a href="http://www.codeproject.com/useritems/SafeMethodCaller.asp?msg=2101585#xx2101585xx"> I posted a comment with my own implementation</a>. 
</p>
<p>
This was the implementation I posted: 
</p>
<pre>
<font size="2"><font size="2" color="#0000ff">class</font><font size="2"> </font><font size="2" color="#008080">SafeMethodInvoker</font></font><font size="2"></font><font size="2">
<p>
{<font size="2" color="#0000ff">  public</font><font size="2"> </font><font size="2" color="#0000ff">delegate</font><font size="2"> </font><font size="2" color="#0000ff">void</font><font size="2"> </font><font size="2" color="#008080">ExcDlgt</font><font size="2">(</font><font size="2" color="#008080">Exception</font><font size="2"> e);</font><font size="2"></font><font size="2" color="#0000ff">public</font><font size="2"> </font><font size="2" color="#0000ff">delegate</font><font size="2"> </font><font size="2" color="#0000ff">void</font><font size="2"> </font><font size="2" color="#008080">voidDlgt</font><font size="2">();</font><font size="2">
<p>
<font size="2" color="#0000ff">  public</font><font size="2"> </font><font size="2" color="#0000ff">delegate</font><font size="2"> </font><font size="2" color="#0000ff">bool</font><font size="2"> </font><font size="2" color="#008080">boolDlgt</font><font size="2">();</font>
</p>
</font>
</p>
</font><font size="2">
<p>
<font size="2" color="#0000ff">   public</font><font size="2"> </font><font size="2" color="#0000ff">static</font><font size="2"> </font><font size="2" color="#0000ff">void</font><font size="2"> Run(</font><font size="2" color="#008080">boolDlgt</font><font size="2"> del, </font><font size="2" color="#0000ff">int</font><font size="2"> TimeOutMs,</font>
</p>
</font><font size="2" color="#008080">     ExcDlgt</font><font size="2"> Critical,</font><font size="2" color="#008080">voidDlgt</font><font size="2"> Failure,</font><font size="2" color="#008080">voidDlgt</font><font size="2"> Timeout )</font><font size="2">
<p>
   {
</p>
</font><font size="2" color="#008080">     Thread</font><font size="2"> t = </font><font size="2" color="#0000ff">new</font><font size="2"> </font><font size="2" color="#008080">Thread</font><font size="2">(</font><font size="2" color="#0000ff">delegate</font><font size="2">() </font><font size="2">{ </font><font size="2" color="#0000ff">try</font><font size="2"> { </font><font size="2" color="#0000ff">if</font><font size="2"> (!del()) Failure(); } </font><font size="2" color="#0000ff">catch</font><font size="2"> (</font><font size="2" color="#008080">Exception</font><font size="2"> e) { Critical(e); } } );</font><font size="2">
<p>
     t.Start();
</p>
</font><font size="2" color="#0000ff">     if</font><font size="2"> (!t.Join(TimeOutMs)) Timeout(); </font><font size="2">
<p>
   }
</p>
<p>
 }
</p>
<p>
}
</p>
<p>
Way shorter as you might see 
</p>
</font>
</pre>
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
