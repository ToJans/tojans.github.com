---
layout: post
title: Using AOP / PostSharp to implement a function cache
---

<p>
I&nbsp;just posted <a href="http://www.codeproject.com/KB/cs/ps-custom-attributes-2.aspx?msg=2349925#xx2349925xx">this comment</a> on codeproject : 
</p>
<p>
I just discovered this a few hours ago, and I allready wrote a small but very helpfull attribute : a attribute to cache constant but timeconsuming function calls.<br />
If you have a function that takes a lot of time to generate, but the result set is actually the same each time for a certain parameter set, you simply need to define it as follows :<br />
(code is written in VB since we&#39;re using vb @ work here)<br />
<code><br />
Module Module1<br />
&nbsp;&nbsp;Sub Main()<br />
&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(&quot;calling Div2 for i = 1&quot;, DoDiv2(1))<br />
&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(&quot;calling Div2 for i = 2&quot;, DoDiv2(2))<br />
&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(&quot;calling Div2 for i = 1&quot;, DoDiv2(1))<br />
&nbsp;&nbsp;&nbsp;&nbsp;Console.ReadLine()<br />
&nbsp;&nbsp; End Sub<br />
<br />
<br />
&nbsp;&nbsp;&lt;Cacheable()&gt; _<br />
&nbsp;&nbsp;Function DoDiv2(ByVal i As Integer) As Double<br />
&nbsp;&nbsp;&nbsp;&nbsp; Console.WriteLine(&quot;running Dodiv2 for &quot; + i.ToString())<br />
&nbsp;&nbsp;&nbsp;&nbsp; Return i / 2<br />
&nbsp;&nbsp;End Function<br />
End Module<br />
</code><br />
<br />
If you run this code, you will see that the function only gets executed once for parameter value 1; the second time it just searches the cached dictionary. This avoids having the same code all over the project caching calculated values !!! It is a huge timesaver and makes you code much more maintainable...<br />
<br />
The attribute itself was written like this :<br />
<code>Imports ps = PostSharp.Laos<br />
<br />
&lt;Serializable()&gt; _<br />
&lt;System.AttributeUsage(AttributeTargets.Method, Inherited:=True, AllowMultiple:=False)&gt; _<br />
Public Class CacheableAttribute<br />
&nbsp;&nbsp;Inherits ps.OnMethodInvocationAspect<br />
<br />
&nbsp;&nbsp;Shared x As New Hashtable<br />
<br />
&nbsp;&nbsp;Public Overrides Sub OnInvocation(ByVal pEventArgs As PostSharp.Laos.MethodInvocationEventArgs)<br />
&nbsp;&nbsp;&nbsp;&nbsp;Dim o() As Object = pEventArgs.GetArguments()<br />
&nbsp;&nbsp;&nbsp;&nbsp;Dim i As Integer = 0, obj As Object<br />
&nbsp;&nbsp;&nbsp;&nbsp;For Each obj In o<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;i += obj.GetHashCode()<br />
&nbsp;&nbsp;&nbsp;&nbsp;Next<br />
&nbsp;&nbsp;&nbsp;&nbsp;If Not x.Contains(i) Then<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;x(i) = pEventArgs.Delegate.DynamicInvoke(o)<br />
&nbsp;&nbsp;&nbsp;&nbsp;End If<br />
&nbsp;&nbsp;&nbsp;&nbsp;pEventArgs.ReturnValue = x(i)<br />
&nbsp;&nbsp;End Sub<br />
End Class</code><br />
<br />
And this in such a short time period. Thanks a lot !!! <br />
BTW(Youve got my 5 on both articles) 
</p>
<p>
&nbsp;
</p>
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
