---
layout: post
date: "2013-07-31"
slug: "build-a-simple-chart-website-in-a-few-minutes-with-elixir"
title: "Build a simple chart website in a few minutes with Elixir"
comments: true
categories: 
---

As I am currently thinking about setting up a social platform for Elliot Wave analysis, I decided to use Elixir as my new platform, to see if it would be doable.

This is the result of an hour of hacking (mostly figuring out how to libs work):

![This post will walk you through getting this up and running in a few minutes.](http://i.snag.gy/G8EhB.jpg)

<!-- more -->

## Prerequistes

I have previously written an extensive blog post on how to install the prerequisites on Windows [here](http://tojans.me/blog/2013/06/09/installing-and-compiling-elixir-and-the-dynamo-web-framework-on-windows/). Please follow this guide.

Once you followed this, we are ready to get started on our web app.

## Setting up the project 

Go to the dynamo path from your installation, and type 
```
mix dynamo ../ew
```

This will create your project in the folder `..\ew`; go to that folder and fire up your favorite editor.

## Getting some stock quotes

As we are going to need some prices, we need to get that information from the internet somewhere. Luckily, Yahoo has a hassle-free service that provides exactly those, and there is an Elixir library available use this service.

To use it we will need to add it to the dependencies; open up the `mix.exs` file in the root of you project, go to the bottom of the file, and add `,{ :yahoo_finance,"0.1.0",git: "https://github.com/baldmountain/yahoo_finance"}` to the deps. Also, add `, :inets` to the `applications: [:cowboy, : dynamo]`; this `inets` application needs to be started in order to be able to download from http. 

After these changes, your file should look like this:
```
defmodule Ew.Mixfile do
  use Mix.Project

  def project do
    [ app: :ew,
      version: "0.0.1",
      dynamos: [Ew.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/ew/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo, :inets],
      mod: { Ew, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" },
      { :yahoo_finance,"0.1.0",git: "https://github.com/baldmountain/yahoo_finance"} ]
  end
end
```

Now we will have to get and compile the dependencies, so open up a command window and type the following:

```
mix deps.get
```

You will see a lot of output; it should fetch the dependencies and compile them.

## So much for dependencies, let's build a site !

It makes sense to define a layout, so we do not have to repeat ourselves. create a folder `web\templates\layouts` and add a file called `main.html.eex`; this should be the content:
```
<html>
	<head>
		<title>
			<%= content_for(:title)  || "Ellibotwave" %>
		</title>
	</head>
	<body>
		<h1><%= content_for(:title) || "Ellibotwave" %></h1>
		<%= content_for(:template) %>
	</body>
</html>
```
I assume this is pretty self explaining, is it not? The `<%= content_for(:title)  || "Ellibotwave" %>` renders the title if it was provided, and otherwise it defaults to `Ellibotwave`.

The `<%= content_for(:template) %>` renders the main content.

## Next we will handle the entry page.

Create a folder `web\templates\commands`, and add a file called `pick_a_symbol.eex`; this should be the content:
```
<form action="/" method="post">
	<fieldset>
		<label>Symbol</label>
  	<input name="symbol" list="symbols" autofocus="autofocus" required="required" />
  	<datalist id="symbols">
  		<option value="AAPL"/>
  		<option value="LEDS"/>
  		<option value="USO"/>
  		<option value="DJIA"/>
  	</datalist>
	</fieldset>
	<input type="submit" name="Get chart"/>
</form>
```

Once again, this is not exactly rocket science.

Open up `web\templates\index.html`, and change it to this:
```
<h3>Welcome</h3>

This is an experimental site about Elliot waves. Please select a NASDAQ symbol.

<%= render("commands/pick_a_symbol") %>

```

I assume everyone understands what this means. Now we need to do one more thing: set the layout file. for this we open up the file `web\routers\application_router.ex` and replace the `prepare` function. Your file should look like this:

```
defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn = conn.assign(:layout, "main")
    conn.fetch(:params)
  end

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "index.html"
  end
end
```

Some clarification here: as we are working in a functional language, our data is immutable, so we assign the version of `conn` with the extra `:layout` parameter to conn again.

# Let's test !!!

When you did everything correcly, you can now go to the command line again, and type the following two commands:
```
mix compile
mix server
``` 

Then you should surf to [http://localhost:4000](http://localhost:4000) and you should see the following output:
![Woohoo](http://i.snag.gy/bOA9k.jpg)

However, when you pick a symbol - `AAPL` for example - and `submit the form, you will get the following error back:

![Uh-Ooh!!! Trouble in paradise !!!](http://i.snag.gy/tbJux.jpg)

But, that makes sense, as we do not have a handler yet for the `post` to `/`, only a `get` verb handler is currently implemented. So let's add that too !

## The postman always rings twice

Or maybe he doesn't, but who cares; let's create a new handler that fetches the quotes for a certain stock; add the following 2 functions underneat the `get "/" do ... end` function in the file `web\routers\application_router.ex`:

```
  post "/" do
    quotes = YahooFinance.get_historical_quotes(conn.params[:symbol],365) 
      |> Enum.reverse() 
      |> quotes_to_json()
    conn = conn.assign(:quotes,quotes)
    conn = conn.assign(:symbol,conn.params[:symbol])
    render conn,"views/chart.html"
  end

  defp quotes_to_json(quotes) do 
    Enum.map_join quotes,",\n",fn x-> 
      "['#{x.date}',#{x.low},#{x.open},#{x.close},#{x.high}]" 
    end
  end 
```

Some remarks here: first we get the daily quotes for the symbol during the last 365 days using the library we included in the dependencies, then we take the output of that, and we reverse it. We use the pipe operator for that (`|>`). For example `abc(1) |> b (2)` really means this:

```
temp1 = abc(1)
temp2 = b(temp1,2)
```

This allows for some very coincise code.

The `Enum.map_join` takes all the quotes, formats them to JSON using string interpolation, and then joins them together, so `quotes` is actually a json representation that we will use in our view to render the data.

As you can see, we also render a view called `views/chart.html`, so we need to create a `web\templates\views` folder and add the file `chart.html.eex`:

```
<%= render("commands/pick_a_symbol") %>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
  google.load('visualization', '1', {packages: ['corechart']});
</script>
<script type="text/javascript">
  function drawVisualization() {
    var data = google.visualization.arrayToDataTable([
       // ['Mon', 20, 28, 38, 45],
       // ['Tue', 25, 30, 45, 50]
        <%= @quotes %>
      ]
      // Treat first row as data as well.
    , true);

    var options = {   
      legend:'none'
    };

    var chart = new google.visualization.CandlestickChart(document.getElementById('chart'));
    chart.draw(data, options);
  }

  google.setOnLoadCallback(drawVisualization);
</script>

<div id="chart" style="width:90%;height:30em" />
```

This is really just a dirty hack, but it works, so I am pleased with it.

Fire up a command window, and once again verify whether everything works:

```
mix compile
mix server
```
Note that I added a title this time as well, so we know what we are seeing.

That's it, you should see the following result (I took `USO` this time):

![Might be in the 4th wave currently?](http://i.snag.gy/jhvDo.jpg)

## For the lazy

If you do not feel like doing all this work, and would simply like to fiddle around a bit with the source, here it is: [https://github.com/ToJans/ew](https://github.com/ToJans/ew).

# Conclusion

Well, it was pretty easy to setup, most of the time went into getting to know the libraries and work around the limitations. Setting up an app with dynamo seems ceraintly doable, and I will see if I can setup an instance on my VPS for demo purposes (I would add caching to reduce network load and speed it up a bit).

There are a few caveats however: because dynamo is still in early alpha, some things just do not work correctly, or all of a sudden they stop working after upgrading your dependencies, so please consider this before you tackle your next big thing with dynamo.
