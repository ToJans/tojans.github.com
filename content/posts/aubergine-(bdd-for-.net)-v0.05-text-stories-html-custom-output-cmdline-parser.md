---
layout: post
date: "2009-11-12"
slug: "aubergine-(bdd-for-.net)-v0.05-text-stories-html-custom-output-cmdline-parser"
title: 'Aubergine (BDD for .net) v0.05 : text stories/html & custom output/cmdline
  parser'
---

<p>Again a new release !!</p>
<p>* The stories are now written in text-format; unrecognized beginning of lines are skipped/not processes; example data should begin with/be seperated by "|".<br />* Commandline parser implemented with help</p>
<h2>Edit 3 : v0.06 arrived</h2>
<p><a href="http://www.corebvba.be/blog/post/Aubergine-%28BDD-for-net%29-v006-support-for-parameter-tables-in-givenwhenthen.aspx">More info here !!</a></p>
<p>&nbsp;</p>
<pre>C:\Projecten\Be.Corebvba.Aubergine\Be.Corebvba.Aubergine.Examples\Lib&amp;gt;ConsoleRunner.exe /h<br />Aubergine Console Runner - Core bvba - Tom Janssens 2009<br /><br />Usage :<br /><br />        ConsoleRunner [wildcard or filename for story file][...] [parameters]<br /><br />Where parameters can be one of the following :<br /><br />         -html<br />                Output to html unordered lists<br /><br />         -fmthdr,-formatheader  XXXX<br />                Header to put before starting the children output; example "&amp;lt;ul&amp;gt;"<br /><br />         -fmt,-formatter  XXXX<br />                Named storyformatter; example "&amp;lt;li&amp;gt;{Type} {Description} &amp;lt;a href='#' title='{StatusInfo}'&amp;gt;{StatusText}&amp;lt;/a<br />&amp;gt;&amp;lt;/li&amp;gt;"<br /><br />         -fmtftr,-formatfooter  XXXX<br />                Footer to put after ending the children output; example "&amp;lt;/ul&amp;gt;"<br /><br />         -h,-?,-help<br />                Show the syntax of the commandline parameters<br /></pre>
<p>An example story :</p>
<p><div class="code">
<br />Context&nbsp;&nbsp;&nbsp; Be.Corebvba.Aubergine.Examples.Website.Contexts.BrowserContext<br />ContextDLL Be.Corebvba.Aubergine.Examples.DLL<br /><br />Story Make sure my website gets enough visibility<br />&nbsp;&nbsp;&nbsp; As a website owner<br />&nbsp;&nbsp;&nbsp; I want to make sure that I get enough visibility<br />&nbsp;&nbsp;&nbsp; So that I can get enough traffic<br /><br />&nbsp;&nbsp;&nbsp; Scenario Search results <span class="kwrd">for</span> keywords on searchengine should contain my url<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Given the current url <span class="kwrd">is</span> search url<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When searching <span class="kwrd">for</span> keywords<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Then the result should contain my url<br />&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +--------------+--------------------------------+------------------+-----------------+<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | searchengine | search url&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | keywords&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | my url&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +--------------+--------------------------------+------------------+-----------------+<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | google&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | http://www.google.be/search?q= | BDD .Net&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | www.corebvba.be |<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | bing&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | http://www.bing.com/search?q=&nbsp; | core bvba tom&nbsp;&nbsp;&nbsp; | www.corebvba.be |<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | bing&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | http://www.bing.com/search?q=&nbsp; | Quantum physics&nbsp; | www.corebvba.be |<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | faulty link&nbsp; | http://www.googleaaa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | core bvba tom&nbsp;&nbsp;&nbsp; | www.corebvba.be |<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +--------------+--------------------------------+------------------+-----------------+<br /></div></p>
<p>The code is still the same :</p>
<p><div class="code">
<br /><span class="kwrd">using</span> System;<br /><span class="kwrd">using</span> System.Collections.Generic;<br /><span class="kwrd">using</span> System.Linq;<br /><span class="kwrd">using</span> System.Text;<br /><span class="kwrd">using</span> System.Net;<br /><span class="kwrd">using</span> System.Web;<br /><span class="kwrd">using</span> Be.Corebvba.Aubergine.Model;<br /><br /><span class="kwrd">namespace</span> Be.Corebvba.Aubergine.Examples.Website.Contexts<br />{<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">class</span> BrowserContext<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">string</span> Url { get; set; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">string</span> Result { get; set; }<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">private</span> WebClient wc = <span class="kwrd">new</span> WebClient();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DSL(<span class="str">"the current url is (?&amp;lt;url&amp;gt;.*)"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">void</span> SetUrl(<span class="kwrd">string</span> url)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Url = url;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DSL(<span class="str">"searching for (?&amp;lt;keywords&amp;gt;.*)"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">void</span> SearchForKeyWords(<span class="kwrd">string</span> keywords)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Result = wc.DownloadString(Url + HttpUtility.UrlEncode(keywords));<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DSL(<span class="str">"the result should contain (?&amp;lt;myurl&amp;gt;.*)"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">bool</span> ResultShouldContain(<span class="kwrd">string</span> myurl)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">return</span> (Result??<span class="str">""</span>).Contains(myurl);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />}<br /></div></p>
<p>And this is the resulting output (please try to hover over the implementation error of the "When" step with your mouse !!</p>
<h3>Edit : apparently my blog engine team messes up the list layout !!! It are nested list items (although you can not see it here).<br /></h3>
<p>Processing file(s) : Website\Stories\*.txt</p>
<ul>
<li>&nbsp;      
<ul>
<li>&nbsp;      
<ul>
<li>Story Make sure my website gets enough visibility <a href="#">IMPLEMENTATION ERROR</a> 
<ul>
<li>Scenario Search results for BDD .Net on google should contain  www.corebvba.be <a href="#">OK</a> 
<ul>
<li>Given the current url is http://www.google.be/search?q= <a href="#">OK</a> </li>
<li>When searching for BDD .Net <a href="#">OK</a> </li>
<li>Then the result should contain www.corebvba.be <a href="#">OK</a> </li>
</ul>
</li>
<li>Scenario Search results for core bvba tom on bing should contain  www.corebvba.be <a href="#">OK</a> 
<ul>
<li>Given the current url is http://www.bing.com/search?q= <a href="#">OK</a> </li>
<li>When searching for core bvba tom <a href="#">OK</a> </li>
<li>Then the result should contain www.corebvba.be <a href="#">OK</a> </li>
</ul>
</li>
<li>Scenario Search results for Quantum physics on bing should contain  www.corebvba.be <a href="#">NOK</a> 
<ul>
<li>Given the current url is http://www.bing.com/search?q= <a href="#">OK</a> </li>
<li>When searching for Quantum physics <a href="#">OK</a> </li>
<li>Then the result should contain www.corebvba.be <a href="#">NOK</a> </li>
</ul>
</li>
<li>Scenario Search results for core bvba tom on faulty link should contain  www.corebvba.be <a href="#">IMPLEMENTATION ERROR</a> 
<ul>
<li>Given the current url is http://www.googleaaa <a href="#">OK</a> </li>
<li>When searching for core bvba tom <a title="ArgumentException:URI formats are not supported." href="#">IMPLEMENTATION  ERROR</a> </li>
<li>Then the result should contain www.corebvba.be <a href="#">NOK</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
Processing file :  C:\Projecten\Be.Corebvba.Aubergine\Be.Corebvba.Aubergine.Examples\bin\Release\Website\Stories\Make_sure_my_Website_gets_enough_traffic.txt 
</ul>
<p>This is the postbuildstep now :</p>
<p><div class="code">
<br /><span class="str">"$(ProjectDir)\lib\ConsoleRunner.exe"</span> Accounts\Stories\*.txt Website\Stories\*.txt -html &gt; <span class="str">"$(TargetDir)output.html"</span><br /><span class="str">"$(TargetDir)output.html"</span><br />exit 0<br /></div></p>
<p>Include all the stories/txt-file in your project with the option of "copy to output directory" = "always" on each file...</p>
<p>More details/a codeproject article update will follow later...</p>
<p><a href="http://www.corebvba.be/blog/file.axd?file=2009%2f11%2fAuberginev0.05.zip">Auberginev0.05.zip (24,86 kb)</a></p>
<h3>Edit 2 : Apparently the reference is wrong (rereference Be.corebvba.aubergine.dll under the lib folder)<br /></h3>
<p>&nbsp;</p>
<p>Enjoy !!</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
