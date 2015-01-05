---
layout: post
title: To git or not to git - Source control done right / intro and quick tutorial
---

<h4>Introduction&nbsp;</h4>
<p>
<a href="http://en.wikipedia.org/wiki/Revision_control" target="_blank">Source control</a> has always been a really annoying issue for me, since it was either : 
</p>
<ul>
	<li>
	<div>
	Too complicated too manage 
	</div>
	</li>
	<li>
	<div>
	Too restricted 
	</div>
	</li>
	<li>
	<div>
	Too slow 
	</div>
	</li>
	<li>
	<div>
	Too much a hassle to setup 
	</div>
	</li>
	<li>
	<div>
	Badly integrated 
	</div>
	</li>
	<li>
	<div>
	One or more of the above 
	</div>
	</li>
</ul>
<p>
I have been working with <a href="http://subversion.tigris.org/" target="_blank">Subversion</a>/<a href="http://tortoisesvn.tigris.org/" target="_blank">TortoiseSVN </a>for a little while, but I was noticing that I really had to force myself into using the source control repository. A few times in the last month I noticed that I did not do enough commits, forcing me into re-implementing stuff again. I was also lacking a very good <a href="http://en.wikipedia.org/wiki/Diff" target="_blank">diff tool </a>to compare different versions 
</p>
<p>
I have been looking for different alternatives every now and then, but without much success, until recently... 
</p>
<h4>The holy grail : git</h4>
<p>
I found <a href="http://git-scm.com/" target="_blank">git</a>.<br />
Getting started with&nbsp;git has been a real pleasure. Setup/Commits/history checking is all really easy with git. As a proof of concept&nbsp;I will&nbsp;show you a small walkthrough in a Windows environment. 
</p>
<h5>1. Download (g)it</h5>
<p>
Download the windows version from here : <a href="http://code.google.com/p/msysgit/downloads/list">http://code.google.com/p/msysgit/downloads/list</a><br />
(I downloaded <a href="http://msysgit.googlecode.com/files/Git-1.6.2.2-preview20090408.exe" target="_blank">the latest preview</a>.)<br />
Use the default install. 
</p>
<h5>2. Create git repository</h5>
<p>
Start windows explorer; right click on the source folder and choose &quot;Git Bash here&quot;.<br />
You will then get a unix-like prompt. Now type 
</p>
<pre>
$ git init
$ git add .
$ git commit -m &quot;Initial checkin&quot;
$ exit
</pre>
<p>
That&#39;s it. You can now start modifying your code as you wish. 
</p>
<h5>3. Save/check in&nbsp;changes, a.k.a. commit&nbsp;</h5>
<p>
Start windows explorer; right click on the source folder and choose &quot;Git GUI here&quot;. A new app will start. 
</p>
<p>
On the left side you will see what changes are available : staged and unstaged changes. If you do not see any files here this means that you have not changed anything since the last commit. Go ahead and change something.<br />
You can leave this window open, and just press the &quot;Rescan&quot; button to refresh in order to look for changed files. 
</p>
<p>
You can click on any of the listed changes to see the details. If a change is sourcecode that has been changed you will see the lines that are removed in red, and the lines that are added in green. 
</p>
<p>
Only files that are listed in the &quot;Staged changes&quot; box will be commited on pressing commit.<br />
You can stage a file (make it committable) by clicking on it, and pressing CTRL-T (or commit/stage in the menu). 
</p>
<p>
If you have all your files that you want to commit in the&nbsp;&quot;Staged changes&quot; box, you just need to enter a short description i.e. &quot;* fixed bug abc&quot;, and press the &quot;Commit&quot; button. That&#39;s it, your changes are checked in. 
</p>
<p>
A small remark :<br />
I personally use the following description convention:<br />
- &quot;+&quot; if I add something (feature)<br />
- &quot;*&quot; if I change something (bugfix etc) <br />
- &quot;-&quot; if I remove something (redundant code) 
</p>
<p>
So&nbsp;the history&nbsp;will basicly look like this after three commits : 
</p>
<pre>
+ Webdav support implemented
* illegal exception when deleting a non-empty folder
- Removed Log4Net
</pre>
<h5>4. View commit log</h5>
<p>
If you want to view&nbsp;the commit log, you can do it like this : 
</p>
<p>
Start windows explorer; right click on the source folder and choose &quot;Git Bash here&quot;. Then type : 
</p>
<p>
$ git log 
</p>
<p>
You will get a long alphanumeric key and the description. An example : 
</p>
<pre>
commit 4f62ca99c026e0c7ee2bd2beb8f39f232c0d6072
Author: Tom Janssens &lt;Tom@xx&gt;Date:&nbsp;&nbsp; Wed May 6 11:04:55 2009 +0200
</pre>
<pre>
&nbsp;&nbsp;&nbsp; Installer fix
</pre>
<pre>
commit 6f8a7888b223d9aee7adbef105aca9a0adc8eb11
Author: Tom Janssens &lt;Tom@xx&gt;Date:&nbsp;&nbsp; Wed May 6 10:53:32 2009 +0200
</pre>
<pre>
&nbsp;&nbsp;&nbsp; Make sure necessary DLL&#39;s are deployed to the build folder
</pre>
<pre>
commit a289f8a70b961f83110c96a91e9ed97edb900909
Author: Tom Janssens &lt;Tom@xx&gt;Date:&nbsp;&nbsp; Wed May 6 10:28:53 2009 +0200
</pre>
<pre>
&nbsp;&nbsp;&nbsp; Inital checkin from http://xx.unfuddle.com/svn/xx_htm/tags/v1.3.0.3404/
</pre>
<p>
&nbsp;
</p>
<h5>5. Check out a version</h5>
<p>
If you want to check out a certain version, you you must know the commit code from the log (step 4). You can then check out a version by typing 
</p>
<p>
$ git&nbsp;checkout XXXXXXX 
</p>
<p>
Where &quot;XXXXXXX&quot; is the first few characters of the commit code in the log. Since this is not very user friendly, we can fix this by tagging : 
</p>
<h5>6. Tag a version</h5>
<p>
If you have a version that is to be publicly released you can tag it. Later on you can reference to this version with this tag. You can create a tag like this : 
</p>
<p>
Start windows explorer; right click on the source folder and choose &quot;Git Bash here&quot;. Then type : 
</p>
<p>
---&nbsp;create a tag : <br />
$ git tag v1.2.3.4&nbsp;<br />
--- delete a tag : <br />
$ git tag -r v1.2.3.4<br />
--- show differences between the current version and a tagged version (type &quot;:q&quot; to quit): <br />
$ git diff v1.2.3.4<br />
--- check out the tagged version (do not forget to commit your current changes first) : <br />
$ git checkout v1.2.3.4 .<br />
--- check out the last version<br />
$ git checkout .<br />
$ exit 
</p>
<h5>7.&nbsp;Branching and merging(advanced)</h5>
<p>
Basicly branching allows you to have different versions of the source simultaneously (for example specific code for a client).<br />
By default you start in a branch called &quot;master&quot;. 
</p>
<p>
To create a new branch called &quot;experimental&quot; we type the follwing in the git console: 
</p>
<p>
$ git&nbsp;branch experimental 
</p>
<p>
You can checkout code from different branches like this : 
</p>
<p>
$ git&nbsp;checkout experimental<br />
$ git&nbsp;checkout master 
</p>
<p>
If you want to merge you current branch (master) with code from another branch (experimental) you can do it like this:<br />
$ git&nbsp;checkout master<br />
$ git merge experimental 
</p>
<p>
If you want to&nbsp;undo this:<br />
$ git reset 
</p>
<h5>Update :</h5>
<p>
Appearantly it is not advised to do any work on the master branch, so you should always create a branch for everything you do. There is however a very helpfull command : &quot;stash&quot;.<br />
Suppose you are working on a branch, but would like to switch to another branch without commiting your changes, and getting back later to the original branch :<br />
$ git&nbsp;checkout experminental<br />
-- some changes, until someone wants you to adjust something on the master branch<br />
$ git stash<br />
$ git checkout master<br />
-- do your stuff<br />
$ git commit -m &quot;some stuff&quot;<br />
-- go back to the last state of the experimental branch, including non-commited files <br />
$ git&nbsp;checkout experminental<br />
-- apply the master changes to the experimental branch :<br />
$ git pull master<br />
<br />
</p>
<p>
There is a lot more to this, but this should get you started. 
</p>
<h5>8. Other tools</h5>
<p>
There are a lot of ins and outs in git that I do not know about, but these should cover the basics. To get help just type the following in the git console : 
</p>
<p>
$ git&nbsp;help 
</p>
<h4>In conclusion</h4>
<p>
While this was meant to be a really short introduction to git, it seems to be longer then intially planned. However, I am hoping that this article is helping people considering to switch to git, or looking for a simple source control system. 
</p>
<p>
For me, the answer to &quot;To git or not to git&quot;, is definately &quot;to git&quot; 
</p>
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
