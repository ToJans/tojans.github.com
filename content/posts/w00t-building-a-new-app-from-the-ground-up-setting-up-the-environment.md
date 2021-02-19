---
layout: post
date: "2009-10-19"
slug: "w00t-building-a-new-app-from-the-ground-up-setting-up-the-environment"
title: 'w00t : Building a new app from the ground up : setting up the environment'
---

This is one of the articles in our series; the parts are:<br />
<ol>
	<li><a href="/posts/w00t-Building-a-new-app-from-the-ground-up-methodology-technology-tools-used/">Methodology, technology &amp; tools used</a></li>
	<li><a href="/posts/w00t-Building-a-new-app-from-the-ground-up-setting-up-the-environment/">Setting up the environment</a></li>
	<li><a href="/posts/w00t-Building-a-new-app-from-the-ground-up-First-specs-and-getting-started/">First specs and getting started</a></li>
	<li><a href="/posts/w00t-Building-a-new-app-from-the-ground-up-IOC-database-and-other-stuff3b-a-real-framework/">IOC, database and other stuff; a real framework</a>&nbsp; <br />
	</li>
</ol>
<p>
&nbsp;Happy reading !<br />
</p>
<p>
Ok, here are the steps to setup the development environment for my new project :
</p>
<h2>Prerequisites<br />
</h2>
<p>
&nbsp;
</p>
<ul>
	<li><a href="https://code.google.com/p/msysgit/" target="_blank">MSysGit</a></li>
	<li>Visual Studio pro or express - <a href="https://www.microsoft.com/express/download/#webInstall" target="_blank">web developer &amp; c#</a>&nbsp;</li>
	<li><a href="https://www.microsoft.com/downloads/details.aspx?familyid=D3F06BB9-5F5F-4F46-91E9-813B3FCE2DB1&amp;displaylang=en" target="_blank">Asp.net MVC 2 preview 2</a> <br />
	</li>
</ul>
<h2>The steps</h2>
<p>
1. Create a project folder <br />
2. Start Git bash on this folder (right click in windows explorer)<br />
3. Get MSpec : type in git bash : 
</p>
<pre>
git clone git://github.com/machine/machine.specifications.git
</pre>
<p>
4. Get Subsonic : type in git bash :
</p>
<pre>
git clone git://github.com/subsonic/SubSonic-3.0.git 
</pre>
<p>
5. Search for Subsonic.Core.csproj and build it<br />
6. Search for Machine.specifications.sln and build it<br />
7. Make a folder Tools in the project folder<br />
8. Make a folder Lib in the project folder<br />
9. Make a folder Source in the project folder<br />
10. In the folder Tools create a file named &quot;CopyDependenciesAndTools.cmd&quot; with the following content:
</p>
<pre>
@echo off
echo.
echo&nbsp;&nbsp; Copying all tools &amp; dependencies
echo.
copy ..\machine.Specifications\Build\Release\*.dll
copy ..\machine.Specifications\Build\Release\*.exe
copy ..\machine.Specifications\Build\Release\*.dll ..\lib\*.*
copy ..\machine.Specifications\Build\Release\*.dll ..\lib\*.*
copy ..\subsonic-3.0\lib\*.dll ..\lib\*.*
copy ..\subsonic-3.0\subsonic.core\bin\release\*.dll ..\lib\*.*
pause
</pre>
<p>
11. Execute this cmd-file<br />
12. Make another cmd file in the tools-folder : &quot;CleanUp.cmd&quot; with the following content:
</p>
<pre>
@Echo off
echo.
echo&nbsp;&nbsp; Cleaning up
echo.
dir /ad /b /s ..\bin &gt; folderstodelete.txt
dir /ad /b /s ..\obj &gt;&gt; folderstodelete.txt
dir /ad /b /s ..\build &gt;&gt; folderstodelete.txt
for /f %%i in (folderstodelete.txt) do rd %%i /s /q
pause
</pre>
<p>
13. Execute it<br />
14. Start up Visual studio and create a new ASP.NET MVC 2 application in the src folder (make sure the checkbox create directory for this solution is off)<br />
15. Once the project is created choose File/New project / Windows/Class library, name it &quot;Specs&quot;, and make sure you choose the option &quot;Add to solution&quot;<br />
16. Save and close visual studio<br />
17. Execute &quot;Tools\CleanUp.Cmd&quot;
</p>
<pre>
15. Go back to the Git Bash and type (line by line, do not copy and paste this in one block):
</pre>
<pre>
git init
</pre>
<pre>
git add .
</pre>
<pre>
git commit -m &quot;+ Initial commit&quot;
</pre>
<p>
<br />
That&#39;s all there is to&nbsp; it; our initial setup. In the next post we&#39;ll get started writing specs !!
</p>
