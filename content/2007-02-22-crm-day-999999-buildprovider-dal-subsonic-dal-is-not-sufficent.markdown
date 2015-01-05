---
layout: post
title: CRM day 999999 - Buildprovider DAL - subsonic dal is not sufficent -
---

<p>
It&#39;s been really busy since my last post, but I can allready tell you that I did not make the deadline.<br />
<br />
Instead of using the SubSonic framework, I have been developping my own framework using buildproviders. The subsonic framework seemed to have a few things that were not really natural/flexible enough for me.<br />
My own project is still in development, but&nbsp;I can assure you that I currently only need to implement some finetuning and cleanups. Lack of time is the main issue here. 
</p>
<p>
Just a few hints : 
</p>
<ul>
	<li>The model is built dynamically &amp; based on the database structure and some default templates </li>
	<li>No mapping code required to start using the objects </li>
	<li>Inheritance is derived from the database model (some conventions need to be followed) </li>
	<li>The model supports intellisense </li>
	<li>DSL-like language with syntax-checking to create queries. </li>
	<li>The DAL only updates the fields that have changed, so no unnecessary updates </li>
	<li>The DAL supports updates and deletes using where clauses (like SQL) </li>
	<li>The DAL uses an SQL-Like syntax, see below !!!<br />
	</li>
</ul>
<p>
Just to give you another clue, here&#39;s a question I got from somebody online (in Dutch).<br />
(The explanation is also in Dutch, but since <strong>you can see the code (in bold)</strong> you can make your own mind up.)<br />
<br />
<span style="font-size: 8.5pt; font-family: Tahoma"><font color="#000000">&gt;Hallo Tom,<br />
&gt;<br />
&gt;Momenteel ben ik bezig met mijn afstudeerproject voor mijn studie&nbsp;&nbsp;<br />
&gt;Informatica (HBO NL).<br />
&gt;Het afstudeerproject gaat over het maken van een DSL in JRuby/Ruby, <br />
&gt;het&nbsp;&nbsp;zelfde onderwerp waar jij in 2005 een topic over opende bij <br />
&gt;tweakers.net.<br />
&gt;(http://gathering.tweakers.net/forum/list_messages/1047491///dsl%2Cruby)<br />
&gt;Ik vroeg mij af of je er nog verder mee bent gegaan en wat je <br />
&gt;ervaringen&nbsp;&nbsp;hierbij zijn.<br />
&gt;<br />
&gt;Alle suggesties, tips en hints zijn welkom.<br />
&gt;<br />
&gt;Ik hoop snel wat van je te horen.<br />
&gt;<br />
&gt;<br />
&gt;Met vriendelijke groet,<br />
&gt;<br />
&gt;Arjan Blom</font><br />
<br />
<font face="Verdana" size="2">And my response to it :</font></span> 
</p>
<span style="font-size: 8.5pt; font-family: Tahoma">
<div style="border-right: black 0.75pt solid; border-top: medium none; border-left: black 0.75pt solid; border-bottom: black 0.75pt solid; padding: 0in">
<span style="font-size: 9pt; font-family: Tahoma"><font color="#000000">Hey Arjan,</font></span><span style="font-size: 9pt; font-family: Tahoma"><font color="#000000">Sorry dat ik zo laat reply, maar mijn hotmail-adres controleer ik maar sporadisch eens.<br />
<br />
Uiteindelijk heb ik voor dat project een simpele DAL icm c# gebruikt, aangezien een DSL niet&nbsp;haalbaar was binnen het gestelde budget en de termijn.<br />
<br />
Momenteel ben ik voor een ander project de route van c# verder aan het volgen, maar het gaat eigenlijk niet echt meer om een DSL, eerder een soort van automatisch gegenereerde DAL/objectlayer .</font></span><span style="font-size: 9pt; font-family: Tahoma"><font color="#000000">Een voorbeeld :</font></span><font color="#000000"><span style="font-size: 9pt; font-family: 'Courier New'"><strong>List&lt;Person&gt; l = Model.Person.Fetch(Db.Person.Name.Like(&quot;Arj*&quot;).And(Db.Person.DateOfBirth &gt; #1/1/1980#));<br />
Console.WriteLine(l.Count);<br />
Person p = l[0];<br />
Console.WriteLine(p.Address.City.Name);<br />
p.Status = PersonStatus.Fetch(db.PersonStatus.Name=&quot;VIP&quot;);<br />
</strong><br />
</span><font face="Arial Unicode MS"><span style="font-size: 9pt; font-family: Geneva">Je kan makkelijk de functionaliteit van de classes uitbreiden, omdat ze partial &amp; afgeleid zijn :</span><span style="font-size: 9pt; font-family: Tahoma"></span></font></font><font color="#000000"><strong><span style="font-size: 9pt; font-family: 'Courier New'">class Model<br />
{<br />
&nbsp;&nbsp; public partial class Person : _Person<br />
&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public override void Save()<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (DateOfBirth == null) <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new Exception(&quot;Date of&nbsp;birth is not set&quot;);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; base.Save();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp; }<br />
}</span><span style="font-size: 9pt; font-family: Tahoma"></span></strong></font><span style="font-size: 9pt; font-family: Geneva"><font face="Arial Unicode MS" color="#000000">En dan :&nbsp;</font></span><span style="font-size: 9pt; font-family: 'Courier New'"><br />
<br />
<font color="#000000"><strong>p = new Person(); // bewaart automatisch de oude<br />
p.FirstName = &quot;Tom&quot;;<br />
p.LastName = &quot;Janssens&quot;;<br />
p.Save();&nbsp; // throws error : Date of birth not set<br />
</strong><br />
</font></span><span style="font-size: 9pt; font-family: Geneva"><font face="Arial Unicode MS" color="#000000">Het speciale aan dit model is dat het dynamisch gegenereerd wordt aan de hand van een database die volgens bepaalde regels opgebouwd is (dmv een buildprovider).<br />
Uit de structuur van de database wordt dan een reeks klassen afgeleid (met inheritance), en deze&nbsp;worden dan middels een DAL opgehaald, alhoewel je&nbsp;deze misschien&nbsp;ook&nbsp;wel een DSL&nbsp;zou kunnen noemen.<br />
<br />
Een voorbeeld : <br />
<br />
</font></span><span style="font-size: 9pt; font-family: 'Courier New'"><font color="#000000"><font color="#000000"><strong>Db.Select(db.Person.FirstName,db.Person.LastName,Invoice.LogicalId)<br />
&nbsp;&nbsp;.Tables(db.Person,db.Invoice)<br />
&nbsp; .Where(db.Person.Id == db.Invoice.PersonId)<br />
&nbsp;&nbsp;&nbsp;&nbsp;.And(db.Invoice.InvoiceDate &lt; DateTime.Now.AddYears(-1)<br />
&nbsp; .OrderBy(db.Invoice.InvoiceDate)<br />
&nbsp; .Execute(oledbconnection)<br />
</strong></font><br />
</font></span><font color="#000000"><font face="Arial Unicode MS"><span style="font-size: 9pt; font-family: Geneva">Zoals je ziet benadert dit eerder de sql-syntax dan de c#syntax, terwijl dit wel nog voldoet aan de conventies van c#.<br />
<br />
Ik vrees dus dat ik je neit echt verder zal kunnen helpen, maar wens je veel succes met je project.<br />
<br />
</span><span style="font-size: 9pt; font-family: Geneva">Mvg,</span><span style="font-size: 9pt; font-family: Tahoma"></span></font></font><span style="font-size: 9pt; font-family: Arial"><font color="#000000">Tom</font></span><span style="font-size: 9pt; font-family: 'Courier New'"></span> 
</div>
<p>
<br />
<font face="Verdana" size="2">Maybe (MAYBE) I&#39;ll release it on CodePlex if there are enough people asking the source... </font>:P 
</p>
</span>
<div style="text-align:right"><a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=xa-4aec37702e3161d4"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pub=xa-4aec37702e3161d4"></script></div>
