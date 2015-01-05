---
layout: post
date: "2009-10-01"
slug: "using-google-calendar-as-a-timetracker-for-your-customers-convert-import-export-ical-ics-google-calendar-to-text-csv-file"
title: Using google Calendar as a timetracker for your customers/ convert-import-export
  iCal /ics/google calendar to text/csv file
---

<p>
Since I use a single shared Google calendar for every customer I have, so all the customers can see when I worked on their projects, I needed an easy way to import each calendar into my invoice program.
</p>
<p>
I did it a few times manually in the beginning, but since this was too much of a hassle i decided to write a small program for it.
</p>
<p>
The program is very simple an reads files from the stdinput and outputs to stdout. I Use the <a href="http://www.ddaysoftware.com/Pages/Projects/DDay.iCal/" target="_blank" title="Open source iCal lib">DDay.iCal</a> library for this. 
</p>
<p>
This is the source for the program (pretty straightforward) : 
</p>
<pre>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ic = DDay.iCal;
namespace ICALToCSVPipe
{
&nbsp;&nbsp;&nbsp; class Program
&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static void Main(string[] args)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var c = ic.iCalendar.LoadFromStream(Console.OpenStandardInput());
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; foreach (ic.Components.Event occ in c.Events)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Console.WriteLine(&quot;{0:yyyy/MM/dd&nbsp; HH:mm} - {1:HH:mm} : {2:0.00} : {3}&quot;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ,occ.DTStart.Local 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ,occ.DTEnd.Local&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ,occ.Duration.Value.TotalHours 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ,occ.Summary);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; }
}
&nbsp;
</pre>
<p>
You can find the program in the attached zip.
</p>
<p>
In order to convert a calender, I use the following steps :
</p>
<ol>
	<li>Export the binaries to a folder on your hard drive, i.e. &quot;c:\tools&quot; for example<br />
	</li>
	<li>Login to Google Calendar</li>
	<li>Choose Settings/Calendars</li>
	<li>Click on &quot;Export&quot;, and extract the zip files to the same folder as the program, i.e. &quot;c:\tools&quot;<br />
	</li>
	<li>Open a command window ( click Start/Run - type &quot;cmd&quot; +&lt;Enter&gt;)</li>
	<li>Go to the program folder i.e. type &quot;cd c:\tools&quot; + &lt;Enter&gt;</li>
	<li>Type the following : ICALToCSVPipe.exe &lt; xxx@group.calendar.google.com.ics |sort&gt; calendar.txt . You do not need to type the full filenames, just type the first few letters of each filename and press the &lt;Tab&gt; until you hit the right filename<br />
	</li>
	<li>Now type Notepad &quot;calendar.txt&quot; in order to view the file</li>
</ol>
<p>
The resulting output should look like this :
</p>
<pre>
2009/09/01&nbsp; 10:30 - 11:15 : 0,75 : probleem ouwe hoeve - server traag
2009/09/01&nbsp; 11:45 - 12:00 : 0,25 : 
2009/09/01&nbsp; 12:45 - 13:15 : 0,50 : Versie 1.3.3461 versturen
2009/09/02&nbsp; 09:30 - 09:45 : 0,25 : tel jose protocol
2009/09/02&nbsp; 13:30 - 15:00 : 1,50 : Eigen/Gratis
2009/09/04&nbsp; 11:00 - 12:30 : 1,50 : Verwerken nieuwe settings van server
2009/09/04&nbsp; 13:15 - 13:45 : 0,50 : 
2009/09/04&nbsp; 14:00 - 16:00 : 2,00 : SharedTables/settings
2009/09/07&nbsp; 13:30 - 18:15 : 4,75 : v1.3.3462
2009/09/08&nbsp; 11:00 - 11:45 : 0,75 : Tel Jose todo
2009/09/08&nbsp; 13:00 - 18:00 : 5,00 : v1.3.3463 : Aanpassen van XML parse routines en implementeren van getreceiptinfo cache
2009/09/10&nbsp; 11:30 - 12:00 : 0,50 : overlopen volgende punten
2009/09/10&nbsp; 14:00 - 16:45 : 2,75 : 
2009/09/15&nbsp; 17:00 - 17:30 : 0,50 : Testdata ouwe hoeve
2009/09/21&nbsp; 09:00 - 12:00 : 3,00 : v1.3.3464
2009/09/23&nbsp; 09:00 - 12:00 : 3,00 : debug packets
2009/09/23&nbsp; 12:30 - 13:30 : 1,00 : v1.3.3465
2009/09/23&nbsp; 15:30 - 18:30 : 3,00 : tel jose getreceiptinfo
2009/09/25&nbsp; 10:00 - 12:00 : 2,00 : 1.3.3465
2009/09/25&nbsp; 14:00 - 15:00 : 1,00 : 1.3.3465
2009/09/25&nbsp; 16:00 - 17:30 : 1,50 : 1.3.3465
2009/09/25&nbsp; 20:00 - 22:00 : 2,00 : 1.3.3465
2009/09/29&nbsp; 15:00 - 17:30 : 2,50 : bakwijzen aangepast...
2009/10/01&nbsp; 09:15 - 10:45 : 1,50 : 
2009/10/01&nbsp; 11:00 - 12:00 : 1,00 : 
2009/10/01&nbsp; 12:30 - 16:30 : 4,00 : 
2009/10/01&nbsp; 17:00 - 17:45 : 0,75 : Oplevering 1.3466
</pre>
<p>
&nbsp;
</p>
<p>
That&#39;s all folks !!! Enjoy !!
</p>
<p>
<a href="http://www.corebvba.be/blog/file.axd?file=2009%2f10%2fIcalToCSVPipe.zip">IcalToCSVPipe.zip (108,58 kb)</a>
</p>
