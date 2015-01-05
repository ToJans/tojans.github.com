---
layout: post
title: ! 'w00t : Building a new app from the ground up : First specs and getting started'
---

This is one of the articles in our series; the parts are:<br />
<ol>
	<li><a href="http://www.corebvba.be/blog/post/w00t-Building-a-new-app-from-the-ground-up-methodology-technology-tools-used.aspx">Methodology, technology &amp; tools used</a></li>
	<li><a href="http://www.corebvba.be/blog/post/w00t-Building-a-new-app-from-the-ground-up-setting-up-the-environment.aspx">Setting up the environment</a></li>
	<li><a href="http://www.corebvba.be/blog/post/w00t-Building-a-new-app-from-the-ground-up-First-specs-and-getting-started.aspx">First specs and getting started</a></li>
	<li><a href="http://www.corebvba.be/blog/post/w00t-Building-a-new-app-from-the-ground-up-IOC-database-and-other-stuff3b-a-real-framework.aspx">IOC, database and other stuff; a real framework</a>&nbsp; <br />
	</li>
</ol>
<p>
&nbsp;Happy reading !<br />
</p>
<h2>
Automating specs&nbsp;
</h2>
<p>
Ok, this step took quite some time to figure out, but once you know how to do this this should be really simple.
</p>
<p>
1. Open the solution and go to the properties of the Specs project<br />
2. Go to the build events, and put the following text in the post-build event command line :
</p>
<pre>
del &quot;$(TargetDir)*.html&quot;
&quot;$(ProjectDir)..\..\tools\Machine.Specifications.ConsoleRunner.exe&quot; &quot;$(TargetPath)&quot; --html $(TargetDir) 
ren &quot;$(TargetDir)$(TargetName)*.html&quot; output.html
&quot;$(TargetDir)output.html&quot;
exit 0 
</pre>
<p>
This will make sure that everytime you do a build, the old Mspec html file&nbsp; gets deleted, mspec is ran, and the html is renamed to output.html and shown in your default browser.
</p>
<p>
Please do note that as long as you have the browser open, you build will not be considered finished, so you should close this window in order to continue developing.<br />
Another possibility would be to build the html file somewhere in your project path, and add it to the project, so you can load it in your project each time, and get a message if it has changed.
</p>
<p>
3. Add a reference to ..\lib\Machine.specifications.dll<br />
4. Remove the bogus class and start writing your specs.
</p>
<p>
Regarding this part there might be some discussions. I created a file called ProductSpecs.cs, which has the following content :
</p>
<pre>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Machine.Specifications;
namespace Specs
{
&nbsp;&nbsp;&nbsp; public class Product { };
&nbsp;&nbsp;&nbsp; public interface IRepository&lt;T&gt;
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IQueryable&lt;T&gt; Find {get;}
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool Add(T instance);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool Delete(T instance);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool Update(T instance);
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; public interface IUnitOfWork : IDisposable 
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void Commit();
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; public interface IProductRepository : IRepository&lt;Product&gt;
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ICollection&lt;Product&gt; GetFromXml(string xml);
&nbsp;&nbsp;&nbsp; };
&nbsp;&nbsp;&nbsp; public abstract class with_empty_productlist
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; protected static IProductRepository productrepo;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; protected static ICollection&lt;Product&gt; products;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Establish context = () =&gt; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; products = new List&lt;Product&gt;();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; public abstract class with_productlist : with_empty_productlist
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Establish context = () =&gt;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; products = new List&lt;Product&gt;();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; products.Add(new Product());
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; products.Add(new Product());
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; products.Add(new Product());
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };
&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; public class when_products_are_imported_from_external_xmlfile : with_productlist
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Because of = () =&gt; products = productrepo.GetFromXml(Properties.Resources.ExternalProductsXml);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It should_contain_xx_products;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It should_have_an_article_matching_xx;
&nbsp;&nbsp;&nbsp; }
}
</pre>
<p>
So as you might see I added some of my code to be in order to be able to start writing some code in my specs; the next thing I am going to do is write code to match these simple specs, and move the respective app code in a proper project of it&#39;s own. 
</p>
<p>
Once this is finished, I am going to extend my specs to match a bigger part of the scope... 
</p>
<p>
I&#39;ll keep you all posted !!
</p>
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
