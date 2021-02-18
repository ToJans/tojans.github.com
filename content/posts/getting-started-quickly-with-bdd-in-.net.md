---
layout: post
date: "2010-08-11"
slug: "getting-started-quickly-with-bdd-in-.net"
title: Getting started quickly with BDD in .Net
---

<h3>Introduction</h3>
<p>This article will give you a brief introduction on how to get started with BDD (Behaviour driven development). It is <a href="http://www.corebvba.be/blog/page/Getting-started-with-BDD-%28behavior-driven-development%29-in-Net.aspx">my second attempt</a> for such an article.</p>
<p>I will show you the complete workflow on how to write an app using BDD in .Net.</p>
<h3>Background</h3>
<p>Small note: if you want to know why you should use BDD, I would like to refer you to another one of my articles: <a href="http://www.corebvba.be/blog/post/The-advantage-of-using-BDD-over-TDD.aspx">The advantage of using BDD over TDD</a></p>
<p>Today I finally managed to upgrade my Aubergine BDD framework to v0.1.</p>
<p>This is now starting to get really usable (I've been dogfooding it for a while now).</p>
<p>This release contains the following changes:</p>
<ul>
<li>Very basic support for NUnit</li>
<li>Build script using JeremySkinner's Phantom build engine</li>
<li>Properly named namespaces/dll's (i.e. no more Be.Corebvba.*)</li>
</ul>
<p>In this spirit I decided to write a small tutorial on how to do BDD development in .Net, so maybe some people might find some use for this !!</p>
<p></p>
<h3>Requirements</h3>
<p>In the spirit of OSS development, I am going to show you how to develop an application using BDD together with SharpDevelop, an OSS IDE for .Net. You are offcourse free tu use any other IDE (i.e. Visual Studio, Monodevelop, ...)</p>
<h4>Sharpdevelop <br /></h4>
<p>If you want to continue this tutorial using SharpDevelop, you can download it here (I used 3.2):</p>
<p><a href="http://www.icsharpcode.net/opensource/sd/download/#SharpDevelop3x" target="_blank">http://www.icsharpcode.net/opensource/sd/download/#SharpDevelop3x</a></p>
<p>In other IDE's the steps will probably be more or less the same, except that your screenshots will probably not match.</p>
<h4>Aubergine<br /></h4>
<p>Next to this you also need my Aubergine BDD framework. You can download it here:</p>
<p><a href="http://github.com/ToJans/Aubergine/zipball/master" target="_blank">http://github.com/ToJans/Aubergine/zipball/master</a></p>
<p>If you want to, you can also take a quick peek at the source here:</p>
<p><a href="http://github.com/ToJans/Aubergine" target="_blank">http://github.com/ToJans/Aubergine</a></p>
<p>&nbsp;</p>
<h3>Getting started</h3>
<p>Create a new empty solution in sharpdevelop, name it MyFirstBDD</p>
<p>&nbsp;</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2010%2f8%2f1.GIF" alt="" /></p>
<p>Right click on the solution, and add a new project</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2010%2f8%2f2.GIF" alt="" /></p>
<p>Choose class library, and name it MyFirstBDD.Tests</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2010%2f8%2f3.GIF" alt="" /></p>
<h3>Define your specs</h3>
<p>This is a very simple example, but IRL you will have multiple txt-files with multiple stories and scenarios describing as much functionality as possible</p>
<p>Right-Click on the MyFirstBDD.Tests, and choose add a new file. For the file-type, select empty file, but name it specs.txt, and add the following content:</p>
<p><div class="code">
</p>
<p>Define my own library<br />&nbsp;<span class="kwrd">using</span> MyFirstBDD.Tests.MyOwnLibrary<br />&nbsp; from MyFirstBDD.Tests.DLL<br /><br />Story Manage my books<br />&nbsp;Is about my own library<br />&nbsp;<br />As an owner of books<br />I want be able to search <span class="kwrd">for</span> a keyword or part of the author/name of the book <span class="kwrd">in</span> my current books<br />So that I can avoid buying the same book multiple times.<br /><br />Given I have the following books<br />+---+---------------------------------------+------------------------+--------------------+<br />| Nr| Title&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Author&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Keywords&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br />+---+---------------------------------------+------------------------+--------------------+<br />| 1 | Einsteins Schleier&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Anton Zeilinger&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Quantum physics&nbsp;&nbsp;&nbsp; |<br />| 2 | De kunst van het overtuigen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Hans Christian Altmann | Business,NLP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br />| 3 | Harry Potter and the <span class="kwrd">return</span> of Peewee | Joske Vermeulen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Fun, Eglantier&nbsp;&nbsp;&nbsp;&nbsp; |<br />| 4 | Teititatutei&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Joske Vermeulen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Geen fun, Eglantier|<br />| 5 | Een twee drie&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Joske Vermeulen&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | fun, Eglantier&nbsp;&nbsp;&nbsp;&nbsp; |<br />+---+---------------------------------------+------------------------+--------------------+<br />&nbsp; <br />Scenario search <span class="kwrd">for</span> a single matching word <br />&nbsp; When I search <span class="kwrd">for</span> <span class="str">"een"</span><br />&nbsp; Then it should show 1 book<br />&nbsp; And it should not <span class="kwrd">return</span> book nr 4<br /><br />Scenario search <span class="kwrd">for</span> a single matching word with a wildcard<br />&nbsp; When I search <span class="kwrd">for</span> <span class="str">"*een"</span><br />&nbsp; Then it should <span class="kwrd">return</span> 2 books<br />&nbsp; And it should <span class="kwrd">return</span> a book with the title <span class="str">"Teititatutei"</span><br /></div></p>
<p>This defines what we want our app to do.</p>
<h3>Define your BDD context<br /></h3>
<p>Now the we know what we want, we will&nbsp; write our spec executors. These are simple implementations which will not compile yet (since we do not have a program yet).</p>
<p>These will help you to think about your interfaces you will expose from your program.</p>
<p>We identify all possible Given/When/Then steps, and make sure we gave some code for it, and also define the necessary interfaces:</p>
<p><div class="code">
<br /><span class="kwrd">using</span> System;<br /><span class="kwrd">using</span> System.Collections.Generic;<br /><span class="kwrd">using</span> Aubergine.Model;<br /><span class="kwrd">using</span> System.Linq;<br /><br /><span class="kwrd">namespace</span> MyFirstBDD.Tests<br />{<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">class</span> Book<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">int</span> Id {get;set;}<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">string</span> Title {get;set;}<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">string</span> Author {get;set;}<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> IEnumerable&lt;<span class="kwrd">string</span>&gt; Keywords {get;set;}<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">interface</span> ILibrary<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; IEnumerable&lt;Book&gt; AllBooks {set;}<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; IEnumerable&lt;Book&gt; Search(<span class="kwrd">string</span> searchstring);<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">class</span> MyOwnLibrary<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ILibrary Lib=<span class="kwrd">null</span>;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; IEnumerable&lt;Book&gt; FoundBooks=<span class="kwrd">null</span>;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;[DSL]<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<span class="kwrd">void</span> i_have_the_following_books(<span class="kwrd">int</span>[] nr,<span class="kwrd">string</span>[] title,<span class="kwrd">string</span>[] author,<span class="kwrd">string</span>[] keywords)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;{<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;IList&lt;Book&gt; l = <span class="kwrd">new</span> List&lt;Book&gt;();<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<span class="kwrd">for</span> (<span class="kwrd">int</span> i=0;i&lt;nr.Length;i++)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;{<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;l.Add(<span class="kwrd">new</span> Book() { <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Id=nr[i],<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Title = title[i],<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Author = author[i],<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Keywords = keywords[i].Split(<span class="str">','</span>)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; });<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Lib.AllBooks = l;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;}<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;[DSL(<span class="str">"I search for \"(?&lt;what&gt;.+)\""</span>)]<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<span class="kwrd">void</span> Search(<span class="kwrd">string</span> what)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;{<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;FoundBooks = Lib.Search(what).ToArray();<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;}<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;[DSL(<span class="str">"it should (?&lt;not&gt;not )?(return|show) (?&lt;amount&gt;\\d+) book(s?)"</span>)]<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<span class="kwrd">bool</span> Returnamount(<span class="kwrd">string</span> not,<span class="kwrd">int</span> amount)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;{<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<span class="kwrd">return</span> (FoundBooks.Count() == amount) ^ !<span class="kwrd">string</span>.IsNullOrEmpty(not);<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;}<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;[DSL(<span class="str">"it should (?&lt;not&gt;not )?(return|show) a book with the title \"(?&lt;title&gt;.+)\""</span>)]<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<span class="kwrd">bool</span> ShouldReturnBook(<span class="kwrd">string</span> not,<span class="kwrd">string</span> title)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;{<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<span class="kwrd">return</span> FoundBooks.Any(x=&gt;x.Title == title)&nbsp; ^ !<span class="kwrd">string</span>.IsNullOrEmpty(not);<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;}<br /><br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;[DSL(<span class="str">"it should (?&lt;not&gt;not )?(return|show) book nr (?&lt;nr&gt;\\d+)"</span>)]<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<span class="kwrd">bool</span> ShouldReturnBook(<span class="kwrd">string</span> not,<span class="kwrd">int</span> nr)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;{<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<span class="kwrd">return</span> FoundBooks.Any(x=&gt;x.Id == nr) ^ !<span class="kwrd">string</span>.IsNullOrEmpty(not);<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;}<br /> &nbsp;&nbsp; }<br />}<br /></div></p>
<p>Once finished, extract the book class, and move it to the main project (MyFirstBDD), under the model namespace. After doing this, you also extract and move the ILibrary interface to it's proper location (i.e. project MyFirstBDD, namespace Service)</p>
<h3>Unit testing</h3>
<p>Once you have done this, we need to setup unit testing; this is currently some kind of a hack, and it works as follows:</p>
<p>Add a class named Fixture to your test project and use the following code:</p>
<p><div class="code">
<br /><span class="kwrd">using</span> System;<br /><span class="kwrd">using</span> System.Collections.Generic;<br /><span class="kwrd">using</span> System.IO;<br /><span class="kwrd">using</span> NUnit.Framework;<br /><br /><span class="kwrd">namespace</span> MyFirstBDD.Tests<br />{<br />&nbsp;&nbsp;&nbsp; [TestFixture]<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">class</span> Fixture : Aubergine.NUnitBDD.Fixture <br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">override</span> IEnumerable&lt;<span class="kwrd">string</span>&gt; SpecFiles<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; get {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">yield</span> <span class="kwrd">return</span> Path.Combine(Directory.GetCurrentDirectory(),<span class="str">"specs.txt"</span>);<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> Fixture()<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />}<br /></div></p>
<p>Also make sure you change the properties to copy "always" and build action "content". Also add a reference to the needed libs (both aubergine and project references)</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2010%2f8%2f4.GIF" alt="" /></p>
<p>Change your project type for myFirstBDD from "console project" to "Class library" in the properties and everything should compile !!</p>
<p>Right click on the fixture class definition in the source code, and you should see the context option "Unit test" available</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2010%2f8%2f5.GIF" alt="" /></p>
<p>&nbsp;</p>
<p>If you do run the tests, it will say no tests are ran yet, but we'll fix that soon...</p>
<h3>Implement the application</h3>
<p>Up next is the implementation of the application; since this is only an example, I will simply implement the necessary stuff as simple as possible:</p>
<p><div class="code">
<br /><span class="kwrd">using</span> System;<br /><span class="kwrd">using</span> System.Collections.Generic;<br /><span class="kwrd">using</span> System.Linq;<br /><span class="kwrd">using</span> MyFirstBDD.Model;<br /><span class="kwrd">using</span> System.Text.RegularExpressions;<br /><br /><span class="kwrd">namespace</span> MyFirstBDD.Service.Impl<br />{<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">class</span> Library : ILibrary<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> Library()<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> IEnumerable&lt;Book&gt; AllBooks { set; <span class="kwrd">protected</span> get;}<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> IEnumerable&lt;Book&gt; Search(<span class="kwrd">string</span> searchstring)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; var re = <span class="kwrd">new</span> Regex(<span class="str">@"\s"</span>+Regex<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .Escape(searchstring)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .Replace(Regex.Escape(<span class="str">"*"</span>),<span class="str">"(.*)"</span>)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .Replace(Regex.Escape(<span class="str">"?"</span>),<span class="str">"."</span>)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +<span class="str">@"\s"</span>);<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">foreach</span>(var b <span class="kwrd">in</span> AllBooks)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; var kw = <span class="kwrd">string</span>.Join(<span class="str">" "</span>,b.Keywords.ToArray());<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; var arr = <span class="str">" "</span>+b.Author+<span class="str">" "</span>+kw+<span class="str">" "</span> + b.Title+<span class="str">" "</span>;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">if</span> (re.IsMatch(arr))<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">yield</span> <span class="kwrd">return</span> b;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br /></div></p>
<h3>Now setup your test fixture</h3>
<p>Make sure your test code now uses this code. In this case we only have a single dependency, and we use it directly. a typical real-life example would have multiple dependencies, and use probably some mocks/stubs instead of the real service, in order to test only the part you are interested in...</p>
<p><div class="code">
<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">class</span> MyOwnLibrary<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> MyOwnLibrary()<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br /><strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ILibrary Lib=<span class="kwrd">new</span> Service.Impl.Library();</strong><br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; IEnumerable&lt;Book&gt; FoundBooks=<span class="kwrd">null</span>;<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; [DSL]<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <span class="kwrd">void</span> i_have_the_following_books(<span class="kwrd">int</span>[] nr,<span class="kwrd">string</span>[] title,<span class="kwrd">string</span>[] author,<span class="kwrd">string</span>[] keywords)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp; ...<br /></div></p>
<h3>And execute your testcode (with coverage percentage if you want too)</h3>
<p>Right click on the fixture class definition, unit test, unit test with coverage...</p>
<p>If everything went well, you should see the following (similar) output:</p>
<p><img src="http://www.corebvba.be/blog/image.axd?picture=2010%2f8%2f6.GIF" alt="" /></p>
<p>&nbsp;</p>
<p>So you can see everything passed, and we have got a whopping 100% code coverage !!! (not hard in this case, but hey :-) )</p>
<p>We can now start on our UI, but that is a whole different story (Weak event messagebroker comes to mind for example)</p>
<h3>In conclusion</h3>
<p>While this is by no means a complete guide on BDD development, this should be enough to get you started.</p>
<p>If you like this, or have some remarks, please do let me know !!!</p>
<p>For any other articles on BDD on this blog, you can follow this link: <a href="http://www.corebvba.be/blog/?tag=/bdd">corebvba - BDD</a></p>
<p>&nbsp;</p>
<h3>Wait, what about a ready-built solution ?</h3>
<p>Here you go:</p>
<p><a href="http://www.corebvba.be/blog/file.axd?file=2010%2f8%2fMyFirstBDD.zip">MyFirstBDD.zip (72,79 kb)</a></p>
<p>Enjoy !</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>