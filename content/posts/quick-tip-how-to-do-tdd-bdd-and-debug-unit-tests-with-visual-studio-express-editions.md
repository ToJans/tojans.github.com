---
layout: post
date: "2011-10-25"
slug: "quick-tip-how-to-do-tdd-bdd-and-debug-unit-tests-with-visual-studio-express-editions"
title: 'Quick tip: How to do TDD/BDD and debug unit tests with Visual Studio Express
  editions'
---

<h3>Introduction</h3>
<p>This article will show you how you can do TDD/BDD with Visual Studio Express editions. While most people say it is not possible, it is actually pretty easy.</p>
<h3>Prerequisites</h3>
<ul>
<li><a href="https://www.microsoft.com/express" target="_blank">A Visual Studio Express edition</a></li>
<li><a href="https://github.com/continuoustests/AutoTest.Net/downloads" target="_blank">AutoTest.Net</a></li>
<li><a href="https://nuget.codeplex.com/releases" target="_blank">Nuget</a></li>
</ul>
<h3>How do you do it ?</h3>
<p></p>
<div><ol>
<li>Open your project in Visual Studio Express</li>
<li>Add a new class project, name it [Project].Specs</li>
<li>Add a reference to the testlib you want to use with Nuget (Right click on the project references and choose "Manage Nuget Packages") - I use MSpec a lot.</li>
<li>Start AutoTest.Net, after you configured it for the testlib (adjust AutoTest.config file for the correct testrunner)</li>
<li>Start writing your specs</li>
<li>Every time you save a file, your project is compiled and your tests are ran</li>
</ol>
<div>That is all you need; pretty simple actually, is it not ?</div>
</div>
<div>There is also the possibility to have notifications and stuff like that, but I currently do not use them.</div>
<h3>But wait, what if I need to debug a test ?</h3>
<p><span style="font-size: 10px; font-weight: normal;">As I sometimes only do integration tests, I need the ability to debug these tests. But there is no option to do this in the Express editions, or is there ?</span></p>
<div>Well, this took me a bit longer to find out, but once you know how to do this it is pretty easy:</div>
<ol>
<li>Right click on your spec project, and choose "Unload project"</li>
<li>Right click the unloaded project and choose "edit [xxx].Specs.csproj", you will see an XML</li>
<li>Find the matching PropertyGroup for your configuration (usually&nbsp;&lt;PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' "&gt; )?</li>
<li>Add the following child items in the property group (I used mspec as an example here):<br />
<pre>&lt;PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' "&gt;
      ....
      &lt;StartAction&gt;Program&lt;/StartAction&gt;
      &lt;StartProgram&gt;C:\Users\Public\Documents\OudePc\Projecten\Org.NerdBeers\src\Org.NerdBeers\packages\Machine.Specifications.0.4.24.0\tools\mspec-x86-clr4.exe&lt;/StartProgram&gt;
      &lt;StartArguments&gt;Org.Nerdbeers.specs.dll&lt;/StartArguments&gt;
      &lt;StartWorkingDirectory&gt;C:\Users\Public\Documents\OudePc\Projecten\Org.NerdBeers\src\Org.NerdBeers\Org.NerdBeers.Specs\bin\Debug&lt;/StartWorkingDirectory&gt;
&lt;/PropertyGroup&gt;</pre>
</li>
<li>Save and close the .csproj file</li>
<li>Right click on the project and reload it</li>
<li>Set a breakpoint in the test you want to debug</li>
<li>Right click again on the project, and..... </li>
<li>... you can now choose "Debug this project" &nbsp;!!!</li>
</ol>
<h3>Final words</h3>
<p><span style="font-size: 10px; font-weight: normal;">While this approach takes a few minutes to setup, it is definetely not that hard to do. In fact, I just copy the test exes and settings over from another project whenever I need to do it a second time on the same machine. At least this approach will allow you to do proper TDD/BDD with the Express editions of Visual Studio.</span></p>
<p>&nbsp;</p><div style="text-align:right"><a class="addthis_button" href="https://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="https://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
