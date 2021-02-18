---
layout: post
date: "2010-05-20"
slug: "building-an-mvvm-framework-for-both-.net-and-.net-cf"
title: Building an MVVM framework for both .Net and .Net CF
---

<h3>Introduction</h3>
<p>As you might allready know, I am maintaining a .Net CF application for one of my customers. Unfortunately, the design of the app is a total disaster, and maintaining it is actually a living hell. Fortunately however, my client decided to order a complete rewrite, which I started today. This post will not contain the sourcecode (as it is a proprietary app), but rather explain the guts of the underlying architecture and some info about the design decisions used.</p>
<p>Maybe I will release some of the reusable components in the future under open source, but I am not quite sure yet...</p>
<p>&nbsp;</p>
<h3>Yet another framework ?</h3>
<p>Actually, yes !! My main concern about this app framework is keeping it lightweight, flexible, ultraportable and easy to use. By ultraportable I mean that the app should both run on the default .Net, as well as on the Compact Framework, <strong>without recompilation</strong>.</p>
<p>Since no framework known to me meets my criteria, I decided to get started on yet another framework.</p>
<p>The main design decisions are heavily based on my previous experiences with <a href="http://github.com/tojans/mvcextensions" target="_blank">MvcExtensions</a>, my other framework, as well as a very inspiring and well-know lecture by <a href="http://devlicio.us/blogs/rob_eisenberg/default.aspx" target="_blank">Rob Eisenberg</a>: <a href="http://live.visitmix.com/MIX10/Sessions/EX15" target="_blank">"Build your own MVVM framework"</a>.</p>
<p></p>
<h3>Service tools<br /></h3>
<p>I have written and implemented the following interfaces which help me in developping the app.</p>
<p>A simple IOC container interface that looks like this</p>
<p><div class="code">
<br /><span class="kwrd">public</span> <span class="kwrd">interface</span> IIOC<br />{<br />&nbsp; T Resolve&lt;T&gt;();<br />&nbsp; T Resolve&lt;T&gt;(<span class="kwrd">string</span> name);<br />&nbsp; <span class="kwrd">object</span> ResolveObject(<span class="kwrd">string</span> TypeName);<br /> &nbsp; <span class="kwrd">object</span> ResolveObject(<span class="kwrd">string</span> name,<span class="kwrd">string</span> TypeName);<br /> }<br /></div><br /><br />And to register something into the container I have the following methods:</p>
<p><div class="code">
<br /> &nbsp; T Register&lt;T&gt;(T instance);<br /> &nbsp; T Register&lt;T&gt;(<span class="kwrd">string</span> name,T instance);<br />&nbsp; T Register&lt;T&gt;(Func&lt;IIOC,T&gt; factory);<br /> &nbsp; T Register&lt;T&gt;(<span class="kwrd">string</span> name,Func&lt;IIOC,T&gt; factory);<br /> </div></p>
<p>Next to this I also implemented a lightweight AutoMapper, which I use for just about everything:</p>
<p><div class="code">
<br /><span class="kwrd">public</span> <span class="kwrd">interface</span> IMapper<br />{<br />&nbsp; <span class="kwrd">public</span> <span class="kwrd">void</span> Map(<span class="kwrd">object</span> source,<span class="kwrd">object</span> destination);<br />}<br /></div><br /><br />And again, the implementation allows me to register some mappings using the following function:<br /><div class="code">
<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">void</span> Register&lt;TSource,TDestination&gt;(Action&lt;TSource,TDestination,IMapper&gt; map);<br /></div></p>
<p>Next to this I also created a class called ActionResult (looks familiar, doesn't it ;) ).</p>
<p><div class="code">
<br />{<br />&nbsp; <span class="kwrd">public</span> <span class="kwrd">object</span> Viewmodel {get;set;}<br />&nbsp; <span class="kwrd">public</span> ActionLink Redirect {get;set;}<br />&nbsp; <span class="kwrd">public</span> <span class="kwrd">bool</span> Terminate {get;set;}<br />}<br /><br /></div></p>
<p>Allthough I have to say that I still have to implement the ActionLink class.</p>
<h3>Glueing everything together</h3>
<p>Everything you have read so far might seem awfully familiar to some people, which is a good thing imho. But having these tools available is still not the same as having an app framework, or is it ?</p>
<p>Actually, it is almost; my main focus is in the convention-based Model-View-ViewModel approach, which allows me to have controller actions like this:</p>
<p><div class="code">
<br /><span class="kwrd">public</span> <span class="kwrd">class</span> MainController<br />{<br /><br />&nbsp;&nbsp; IMapper sMap;<br />&nbsp;&nbsp; IOrderService sOrder;<br />&nbsp;&nbsp; IViewModelResolver sVMResolver<br /><br />&nbsp;&nbsp; <span class="kwrd">public</span> MainController(IMapper sMap, IOrderService sOrder,IViewModelResolver sVMResolver)<br />&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">this</span>.sMap = sMap;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">this</span>.sOrder = sOrder:<br />&nbsp;&nbsp; }<br /><br />&nbsp;&nbsp; <span class="kwrd">public</span> ActionResult Index()<br />&nbsp;&nbsp; {<br />&nbsp; &nbsp; &nbsp; var vm = sVMResolver.Resolve&lt;VMIndex&gt;();<br />&nbsp; &nbsp; &nbsp; sMap.Map(sOrder.GetOrders(),vm);<br />&nbsp; &nbsp; &nbsp; <span class="kwrd">return</span> <span class="kwrd">new</span> ActionResult() { Viewmodel=vm }; &nbsp;&nbsp; <br />&nbsp;&nbsp; }<br />}<br /></div></p>
<p>Which should also look very familiar !!!</p>
<h3>.... in a single form</h3>
<p>Now, we have an ActionResult which contains a model, how do we know which form to show ??? It is quite simple : I use a convention. All my Viewmodels start with the letters "VM", and all my views (winforms usercontrols) end with the word "View".</p>
<p>I use a veiwmodel-first approach, i.e. based on my viewmodel, I choose which view to show. This looks like the best approach to me...</p>
<p>I have one Form named MainForm, which contains the following property:</p>
<p><div class="code">
<br /><span class="kwrd">object</span> _Viewmodel;<br /><br /><span class="kwrd">public</span> <span class="kwrd">object</span> Viewmodel<br />{<br />&nbsp; get<br />&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">return</span> _Viewmodel;<br />&nbsp; }<br />&nbsp; set<br /> &nbsp; {<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">if</span> (_Viewmodel == <span class="kwrd">value</span>)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">return</span>;<br />&nbsp; &nbsp;&nbsp; _Viewmodel = <span class="kwrd">value</span>;&nbsp;&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; var t = <span class="kwrd">this</span>.Namespace+<span class="str">"."</span>+_Viewmodel.GetType().Name.Substring(3)+<span class="str">"View"</span>;<br />&nbsp;&nbsp;&nbsp; var vw = IOC.ResolveObject(t) <span class="kwrd">as</span> UserControl;&nbsp; <br />&nbsp;&nbsp;&nbsp; <span class="kwrd">this</span>.SuspendLayout();<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">this</span>.Controls.Clear();<br />&nbsp;&nbsp;&nbsp; sMapper.Map(_Viewmodel,vw);<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">this</span>.Controls.Add(vw);<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">foreach</span> (var prop <span class="kwrd">in</span> _Viewmodel.GetType().GetProperties())<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var ctrl = vw.Controls.Where(x=&gt;x.Name==prop.Name).FirstOrDefault();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">if</span> (ctrl==<span class="kwrd">null</span>) <span class="kwrd">continue</span>;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sMapper.Map(prop.GetValue(_Viewmodel,<span class="kwrd">null</span>),ctrl));<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">foreach</span> (var meth <span class="kwrd">in</span> _Viewmodel.GetType().GetMethods().Where(x=&gt;x.Name.StartsWith(<span class="str">"On"</span>))<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // <span class="kwrd">do</span> something similar <span class="kwrd">for</span> the methods; bind them to the corresponding actionlinks<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">this</span>.ResumeLayout();<br />&nbsp; }<br /> }<br /></div></p>
<p>And then my main loop will look something like this (not implemented yet):</p>
<p><div class="code">
<br /><span class="kwrd">void</span> Run()<br />{<br />&nbsp;&nbsp;&nbsp; var frm = <span class="kwrd">new</span> MainForm();<br />&nbsp;&nbsp;&nbsp; var ar = <span class="kwrd">new</span> ActionResult() {Redirect=<span class="kwrd">new</span> Redirect&lt;MainController&gt;(x=&gt;x.Index())};<br />&nbsp;&nbsp;&nbsp; <span class="kwrd">while</span> (!ar.Terminate)<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">if</span> (ar.Redirect!=<span class="kwrd">null</span>)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ar = InvokeActionLink(ar.Redirect);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="kwrd">else</span>&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; frm.Model = ar.Model;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ar = WaitForActionResult(frm);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />}<br /></div></p>
<h3>Conclusion</h3>
<p>While the framework is not yet complete, this is the way I am going to implement the whole thing... If you have any suggestions or comments please do let me know what you think !!!</p><div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>