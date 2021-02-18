---
layout: post
date: "2012-12-01"
slug: "simplified-feature-branching-source-control-done-right"
title: Simplified Feature Branching - Source control done right
---

<h2>Introduction</h2>
<p>As one does typically develop features in parallel, and some features can not be released while others can, a lot of software teams seem to have problems with their source control.</p>
<p>In this post I will describe <strong>Simplified Feature Branching</strong> usable with git or any other <a href="https://en.wikipedia.org/wiki/Distributed_revision_control">DVCS</a>.</p>
<p>This model is not rocket science, and is a further simplification of <a href="https://dymitruk.com/blog/2012/02/05/branch-per-feature/">Adam Dymitruk's post on feature branching</a>.</p>
<p>It assumes you use proper release cycles and versioning during the <a href="https://en.wikipedia.org/wiki/Systems_Development_Life_Cycle">software development lifecycle</a>.</p>
<p>Whenever I mention "feature" in this post, I actually mean "feature" or "bugfix", but I am a lazy b*d.</p>
<h2>The main idea: simplification</h2>
<blockquote>
<p>Make everything as simple as possible, but not simpler - <em>Albert Einstein</em></p>
</blockquote>
<p>Whenever things start to get complicated, we should attempt to simplify them by breaking it up into smaller parts. This is exactly what <strong>Simplified Feature Branching</strong> does. We make the distinction between branching and integration.</p>
<p></p>
<h2>Feature (and bugfix) branches</h2>
<p>In large development teams we typically have the problem that several things are developed in parallel, and need to be integrated afterwards. What we will do is separate these two concepts.</p>
<p>We will forget about integration for now, and will just create a branch for every new feature or bugfix we perform. We will give the branch a proper name (usually that will be some kind of an ID we get from a tracking tool).</p>
<p>The Development repository would look like this:</p>
<ul>
<li>Development          
<ul>
<li>master          
<ul>
<li>[Bugfix] *</li>
<li>[Feature] *</li>
</ul>
</li>
</ul>
</li>
</ul>
<p>For example:</p>
<ul>
<li>Development          
<ul>
<li>master          
<ul>
<li>Bug-sales-123123</li>
<li>Bug-marketing-5454</li>
<li>Feature-sales-444</li>
<li>...</li>
</ul>
</li>
</ul>
</li>
</ul>
<p>All branches would be children of Development/master. Exceptions are not allowed, unless you really, really need it and know what you are doing.</p>
<p>This is exactly the same as <a href="https://dymitruk.com/blog/2012/02/05/branch-per-feature/">Adam's model</a>.</p>
<h2>Integration branches</h2>
<p>Integration branches are the branches where we integrate the different features in a new branch. A typical workflow during development would look like this:</p>
<pre><code>git fetch 
git checkout development/master -B Bugfix-1231 
...
git checkout development/master -B Feature-5454
...
</code></pre>
<p>Once we are satisfied with this integration, we typically deploy this dev branch to the shared development environment.</p>
<p><strong>Never alter development/master!!</strong></p>
<p>Important to note here, is that the whole process described here is targeting the development process, not release management, and this is exactly where the simplification starts.</p>
<p>Integration branches are just temporary placeholders. Think about it! Integration branches should be dropped and recreated once a release is finalized!!!</p>
<p>I would even suggest you to make this explicit by having a distinct repository for the release integration. As one typically goes through a process where multiple clients might have requested different features, I would opt for the following approach:</p>
<ul>
<li>Repo: development          
<ul>
<li>master          
<ul>
<li>[Bugfix] *</li>
<li>[Feature] *</li>
</ul>
</li>
</ul>
</li>
<li>Repo: releases          
<ul>
<li>master          
<ul>
<li>staging</li>
<li>QA/[customer] *</li>
</ul>
</li>
</ul>
</li>
</ul>
<p>Here is the simplification: integration branches are just temporary things, which can be dropped and recreated as you want. Let's say you want to setup a QA environment for a certain customer in the releases repo:</p>
<pre><code>git fetch
git checkout development/master -B QA/JohnTitor
git checkout development/Bugfix-1231 -B Bugfix-1231
git rebase QA/JohnTitor
git checkout QA/JohnTitor
git merge Bugfix-1231
git checkout development/Feature-5454 -B Feature-5454
git rebase QA/JohnTitor 
git checkout QA/JohnTitor
git merge Bugfix-1231
git push release QA/JohnTitor -f
</code></pre>
<p>This will allow you to have proper branches per customer QA environments and a staging environment (for the final release), while having an acceptable merge tree. IF you want a single commit per feature branch (which makes it easy to revert a feature if necessary), it is advisable to run a interactive rebase in order to make sure every feature is a single commit.&nbsp;</p>
<p>Once a the version on the staging environment has been approved by all the customers, we do the following:</p>
<pre><code>git checkout master
git merge staging
git tag v1.2.3
</code></pre>
<p>As all changes are now integrated in the master, we can drop all the feature branches.</p>
<pre><code>git branch -D Bugfix-1231
git branch -D Feature-5454
git branch -D ...
</code></pre>
<p>So all your releases are on the main branch. Once a release is done, you open up git on the development repository, and type the following:</p>
<pre><code>git checkout master
git pull --rebase releases
</code></pre>
<p>And voila, your development repository is up to date!!!</p>
<h2>And an added bonus</h2>
<p>One does not have to have a single development repository, for example one could have one per development team/country/division/... (In my current project we will use a separate repository for outsourced work for example). This approach would also integrate very nicely with code reviews and other CI-related things.</p>
<p>By creating this <strong>simplified feature branching</strong> model, one clearly separates responsibilities using multiple repositories, and make sure the whole integration process is centralized and separated from development.</p>
<p>Happy <strong>simplified feature branching</strong> everyone!!</p>
<p>PS: do not forget to enable <a href="https://git-scm.com/2010/03/08/rerere.html">git rerere</a> when merging git branches; this might save you a lot of time... In fact Adam even suggests sharing your merge cache folder...</p>
