$files = "2010%2f1%2fIMAG0006.jpg 
2011%2f12%2fmatisse.jpg
2011%2f12%2fquinten_.jpg
2011%2f12%2fkamp.jpg
2011%2f12%2fliesbeth.jpg
2011%2f11%2fCQRS10YO.png
2011%2f12%2fhex.png
2010%2f12%2fman_with_Book.jpg
2010%2f12%2fconnect.jpg
2010%2f12%2fmyth.jpg
2010%2f12%2fwin.jpg
2011%2f3%2fOpenIssues.png
2011%2f3%2fClosedIssues.png
2011%2f3%2fIssueAddPinMap.png
2012%2f9%2fvoedselzandloper.jpg
2012%2f9%2fUSDA_Food_Pyramid_92.gif
2012%2f9%2f500px-MyPyramidFood.svg.png
2012%2f9%2fpaleo_17_days.jpg
2012%2f9%2fWatAls1-2beNB.jpg.h380.jpg.568.jpg
2010%2f1%2fEinsteinSpeedOfLight.png
2010%2f1%2fSpeedOfLightTop.png
2010%2f1%2fRelativeSpeed.png
2012%2f7%2f289961_4367556274189_2095702751_o.jpg
2013%2f5%2ferlcamp.png
2013%2f5%2fstart.png
2013%2f5%2fHelloWorld.png
2013%2f5%2fHelloWorldWeb.png
2013%2f3%2fSchermafbeelding+(2).png
2013%2f3%2finvoicing.png
2010%2f8%2f1.GIF
2010%2f8%2f2.GIF
2010%2f8%2f3.GIF
2010%2f8%2f4.GIF
2010%2f8%2f5.GIF
2010%2f8%2f6.GIF
2009%2f12%2fmarkomo_prototype.png
2013%2f5%2fBrabanthal.jpg
2013%2f6%2felixir-logo.png
2013%2f6%2fmingw.png
2013%2f6%2fprerequisites.png
2013%2f6%2fdyn-get-deps.png
2013%2f6%2fdyn-compile.png
2013%2f6%2fdynamo-works.png
2013%2f6%2fblah-works.png
2013%2f6%2fblah-runs.png
2012%2f4%2fpaycento.png
2012%2f4%2fPieterPitchingPaycento.jpg
2012%2f9%2ferlang-error.png
2012%2f9%2ferlang-folder.png
2012%2f9%2ferlang-error2.png
2012%2f9%2fgit-finally.png
2012%2f9%2fnitro-pull.png
2012%2f9%2fnitro-fail.png
2012%2f9%2fnitro-rebar-ok.png
2012%2f9%2fnitro-compilation-fail.png
2012%2f9%2fdebugging-escript.png
2012%2f9%2fnitro-compiles.png
2012%2f9%2fnitro-compiles-or-not.png
2012%2f9%2ffinally.png
2013%2f3%2fCunningplan.jpg
2010%2f4%2fZeeDenHaag.jpg
2012%2f10%2fws+voituur.png
2012%2f10%2fws_paycentobooth.png
2012%2f10%2fG-Chord-Shape.gif
2012%2f3%2fvisug.jpg
2012%2f7%2fblommekes-site.png
2012%2f7%2fblommekes-stats-day1.png
2012%2f2%2fapphb.png
2012%2f8%2fSilver(Daily)20120828111738.png
2012%2f8%2fSilver(Hourly)20120828105956.png
2012%2f8%2fSilver(5+Minutes)20120828110318.png
2012%2f9%2fsilver+20120905+daily.png
2012%2f10%2fopportunity.png
2012%2f9%2fsilver.png
2012%2f5%2fpower.jpg".Split([Environment]::NewLine)

$targetFolder="output/"

$prefix="https://web.archive.org/web/20131220042054/http://corebvba.be/blog/image.axd?picture="

foreach($file in $files) {
    $container = ""
    $imageurl=""
    $container = Invoke-WebRequest ($prefix+$file)
    $imageurl = $container.ParsedHtml.getElementById("playback").src # iframe container
    #Invoke-WebRequest ($imageurl) -OutFile ($targetFolder+$file)
    $imageurl
}