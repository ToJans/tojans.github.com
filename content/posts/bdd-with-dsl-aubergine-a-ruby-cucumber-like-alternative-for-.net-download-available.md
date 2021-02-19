---
layout: post
date: "2009-11-06"
slug: "bdd-with-dsl-aubergine-a-ruby-cucumber-like-alternative-for-.net-download-available"
title: 'BDD with DSL: Aubergine, a ruby/cucumber like alternative for .NET -  download
  available'
---

<h2>Update</h2>
<p style="padding-left: 30px;">Again a lot has changed : look <a href="/posts/Aubergine-Net-BDD-support-for-namedtyped-parameters-2b-RECURSIVE-DSL-2b-bugfix/">here</a></p>
<p style="padding-left: 30px;">&nbsp;</p>
<p style="padding-left: 30px;">&nbsp;</p>
<h2>Introduction</h2>
<p>In this article you can download the very first alpha version of Aubergine; a BDD /DSL framework for .Net, initially based on Machine.Specifications, but later on heavily inspired by Cucumber. It is AFAIK the very first Cucumber like environment in .NET available, and you will see that it is very easy to use. Due to it's inspirator (Cucumber, I have decided to use the name Aubergine - I have no idea if they are actually related or not <img title="Undecided" src="https://www.corebvba.be/blog/editors/tiny_mce3/plugins/emotions/img/smiley-undecided.gif" border="0" alt="Undecided" /> .</p>
<p>Please do note that it is an alpha version, so right now we only have a single testrunner that outputs to the console (i.e. no unit test integration yet). In the article I do include a postbuild step, which automatically makes my BDD tests run after each build, and displays the output in notepad, which is fine for me atm.</p>
<p>Anyway, enough with the talkin, Let's Get Busy !!!</p>
<p>&nbsp;</p>
<h3>Getting Started</h3>
<p>First you need to download the example project; it includes all the binaries needed to do your BDD development. You can find it here :</p>
<p><a href="https://www.corebvba.be/blog/file.axd?file=2009%2f11%2fBe.Corebvba.Aubergine.Examples.zip">Be.Corebvba.Aubergine.Examples.zip (16,43 kb)</a></p>
<p>Once you have the zip file, you can either explore the project, or walk through the following scenario to create your own test.</p>
<ol>
<li>Create a new .Net project in visual studio/any ide you use</li>
<li>Add a reference to Be.Corebvba.Aubergine.DLL (can be found in the zip under the "lib" folder</li>
</ol>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h3>Creating a story</h3>
<p>Add a class named "BrowserContext" to your project</p>
<p>Add a class named "Make_sure_my_website_gets_enough_visibility" , import the Be.Corebvba.Aubergine namespace, and derive your class from Story&lt;BrowserContext&gt;</p>
<p>Then you can start typeing your story; the final file should look like this :</p>
<p><div class="code">
<br /><span class="kwrd">using</span> System;<br /><span class="kwrd">using</span> System.Collections.Generic;<br /><span class="kwrd">using</span> System.Linq;<br /><span class="kwrd">using</span> System.Text;<br /><span class="kwrd">using</span> Be.Corebvba.Aubergine;<br /><br /><span class="kwrd">namespace</span> Example<br />{<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">class</span> Make_sure_my_website_gets_enough_visibility: Story&amp;lt;BrowserContext&amp;gt;<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; As_a website_owner;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I_want to_make_sure_that_I_get_enough_visibility;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So_that I_can_get_enough_traffic;<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Cols(<span class="str">"searchengine"</span>,<span class="str">"search_url"</span>,<span class="str">"keywords"</span>,<span class="str">"my_url"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Data(<span class="str">"google"</span>,<span class="str">"https://www.google.be/search?q="</span>,<span class="str">"core bvba tom janssens"</span>,<span class="str">"www.corebvba.be"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Data(<span class="str">"google"</span>,<span class="str">"https://www.google.be/search?q="</span>,<span class="str">"BDD .Net"</span>,<span class="str">"www.corebvba.be"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Data(<span class="str">"bing"</span>,<span class="str">"https://www.bing.com/search?q="</span>,<span class="str">"core bvba tom janssens"</span>,<span class="str">"www.corebvba.be"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">class</span> Search_results_for_keywords_on_searchengine_should_contain_my_url : Scenario<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Given current_url_is_search_url;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When searching_for_keywords;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Then result_should_contain_my_url;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp; <br />}<br /></div></p>
<p>&nbsp;</p>
<h3>Define the context class</h3>
<p>After having created a story with scenarios we need to define the context for these scenarios.</p>
<p>You add all your domain objects that need to be tested to the "BrowserContext" class</p>
<p>In this case it is quite simple :</p>
<p><div class="code">
<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">class</span> BrowserContext<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">string</span> Url { get; set; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">string</span> Result { get; set; }<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">private</span> WebClient wc = <span class="kwrd">new</span> WebClient();<br />&nbsp;&nbsp;&nbsp; }<br /></div> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>This should be enough to test, but wait, isn't there something missing ?</p>
<p>&nbsp;</p>
<h3>The context DSL</h3>
<p>Next up we need to define how to interpret the story. As I allready mentioned; this is heavily inspired by Ruby/Cucumber : regular expressions are used to find out how all scenario steps should be matched to a real function. While this maybe sounds complicated, it really isn't; this is the code :</p>
<p><div class="code">
<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">class</span> BrowserContext<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">string</span> Url { get; set; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">public</span> <span class="kwrd">string</span> Result { get; set; }<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">private</span> WebClient wc = <span class="kwrd">new</span> WebClient();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DSL(<span class="str">"current_url_is_(.*)"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">void</span> SetUrl(<span class="kwrd">string</span> url)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Url = url;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DSL(<span class="str">"searching_for_(.*)"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">void</span> SearchForKeyWords(<span class="kwrd">string</span> keywords)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Result = wc.DownloadString(Url + HttpUtility.UrlEncode(keywords));<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DSL(<span class="str">"result_should_contain_(.*)"</span>)]<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">void</span> ResultShouldContain(<span class="kwrd">string</span> myurl)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Result.Contains(myurl).ShouldEqual(<span class="kwrd">true</span>);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; }<br /></div><br /><br /><br />That's all there is to it; you are ready to run your tests now !!!</p>
<p>&nbsp;</p>
<h3>Running the specs</h3>
<p>Ok, since we do not want to run these tests manually each time, but at every build action, we need to add a postbuildstep.</p>
<p>In visual studio you can do it like this :</p>
<ol>
<li>Menu : Project/Properties</li>
<li>Tab build events</li>
<li>put the following text in the post-build-event commandline :</li>
</ol>
<p>&nbsp;</p>
<pre>"$(ProjectDir)\lib\Be.Corebvba.Aubergine.ConsoleRunner.exe" "$(TargetPath)" &gt; "$(TargetDir)output.txt"</pre>
<pre>"$(TargetDir)output.txt"</pre>
<pre>exit 0 </pre>
<p>&nbsp;</p>
<p>Now build your project, and the tests will be ran !! Your default texteditor will start, and it should contain this text :</p>
<pre>==STORY================================================================</pre>
<pre>Make_sure_my_website_gets_enough_visibility =&gt; OK</pre>
<pre>========================================================================</pre>
<pre>&nbsp;&nbsp; Search_results_for_core bvba tom janssens_on_google_should_contain_www.corebvba.be =&gt; OK</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Given current_url_is_https://www.google.be/search?q= =&gt; OK</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When searching_for_core bvba tom janssens =&gt; OK</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Then result_should_contain_www.corebvba.be =&gt; OK</pre>
<pre>&nbsp;&nbsp; Search_results_for_core bvba tom janssens_on_bing_should_contain_www.corebvba.be =&gt; OK</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Given current_url_is_https://www.bing.com/search?q= =&gt; OK</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When searching_for_core bvba tom janssens =&gt; OK</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Then result_should_contain_www.corebvba.be =&gt; OK</pre>
<pre>&nbsp;&nbsp; Search_results_for_BDD .Net_on_google_should_contain_www.corebvba.be =&gt; OK</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Given current_url_is_https://www.google.be/search?q= =&gt; OK</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When searching_for_BDD .Net =&gt; OK</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Then result_should_contain_www.corebvba.be =&gt; OK</pre>
<p>&nbsp;</p>
<h3>So how does this work ?</h3>
<p>It's actually quite easy once you have the hang of it; this is pseudocode :</p>
<p>&nbsp;</p>
<pre>&nbsp;&nbsp; foreach (var story in AllClassesDerivedFromTheAubergineStoryClass) <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; foreach(var scenario in AllPossibleScenariosFor(story))<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create a new context object<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; foreach (var possiblesteps in AllSteps (given,when,then) in story and scenario)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; find a regex DSL match for possiblesteps.name in the context, extract all the regex groups and add them as string parameters to the function you call<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; call the corresponding step function</pre>
<p>&nbsp;</p>
<p>If one of this steps should fail then the test fails and the reason is mentioned in the report.</p>
<p>If you expect a step to fail, then you should add a membervariable named "&amp;lt;steptype&amp;gt;Exception", and if a step of that type fails, the step is marked as successfull, but the Exceptionvariable will contain the exception thrown. You can see an example of this in the Example zip file.</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
