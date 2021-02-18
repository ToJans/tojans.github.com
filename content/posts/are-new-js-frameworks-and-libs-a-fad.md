+++
Description = ""
Tags = ["Development", "JavaScript","React","Vue","jQuery"]
date = "2015-10-28T11:42:18+01:00"
title = "Are new `.js` ui frameworks and - libs a fad?"
+++

Good question!

> TL-DR: Most are, except:
>
>  - [jQuery](https://jquery.com/)
>  - [React](https://facebook.github.io/react/)
>  - [vue.js](http://vuejs.org/)

## Frameworks - not for me!

In web UI, frameworks like [BackBone](http://backbonejs.org/), [Ember](http://emberjs.com/) and [Angular](https://angularjs.org/) might be all nice and stuff, but when you start using them to compose larger applications, things tend to break down quite easily with less experienced developers.

Developing large client-side applications requires the same modelling skillset as developing large server-side applications; the complexity is usually not located in the infrastructure, but in properly mapping boundaries and responsibilities within your solution space.

>**I tend to grow my architecture as my application progresses. Using frameworks you can get something up and running very fast, but they enforce you into a single way of doing things.**

As I am unable to predict the future, I have no guarantees that the framework I've picked will be able to provide the needs I require. If the needs are not fulfilled, I'll need to work around this respecting the framework's approach, or implement a plugin following the framework's conventions and respecting it's paradigms.

This requires lots of study and a deeper understanding of the framework you are using, so now you're spending time on learning the ins and outs of the framework, which will probably contain lots of features that are not required for your specific use case.

>**After a while you waste more time on the framework and it's quirks than on your solution domain.**

This is exactly the reason why I advise strongly against using frameworks for anything that is not completely known upfront.

Things like getting a http request and parsing it are unlikely to change during the life-cycle of your project, so there's not a lot of risk involved when you opt for a certain de-facto industry-standard webserver.

UI frameworks tend to be written for certain use cases, like grids etc, but once you get in to the more complex cases, It will come back to you with a vengeance.

> **Frameworks are all about "Don't call us, we'll call you", while libraries are about "I'll call you". It's about who is in control.**

What I've seen a lot, is that people start using these frameworks to get something up and running fast, without overthinking the architecture much. After a while, the cost of migrating becomes to high, so they end up using the framework as a top-level architecture.

> **Frameworks - "just say NO", unless you can keep it contained and/or requirements are frozen forever.**

## Libs - yes, but ...

I've been programming since I was seven years old. As I'm now nearing forty, I can tell you that I have seen quite a lot of fads passing by.

> **For example, I recall a moment where one of my product managers was dreaming about selecting personnel files from a cabinet in 3D as opposed to selecting it from a list on the screen, back when 3D was all shiny and stuff. Can you imagine that?!?!?**

I've been doing web front-end development more than ten years now. I've only learned two client-side UI libraries over this decade, and this week I'm considering to invest some time in a new one.

Here's the ramp up:

### jQuery

Well, I guess nobody can ignore the importance of [jQuery](https://jquery.com/). It allowed us to separate behavior from representation in a proper way. The key difference between jQuery and it's predecessors, are the way they allowed you to traverse your DOM: libraries like jQuery introduces us to declarative document traversal, so we went from (pseudo-code)

```
for each domEl in body.children
  if domEl.id == "some-list"
    for each domEl2 in domEl.children
      if domEl2.id == "some-item-id"
        domEl2.innerHTML = "Woohoo"
```

to

```
$("#somelist #someItemId").html("Woohoo")
```
So instead of specifying the computer how to traverse the DOM, we just tell him what we want, and the computer figures it out on his own, hence `declarative`.

However, whenever you changed some data in your app, you still had to manually update the DOM elements. It took a decade and a plethora of frameworks to get to the next revelation.

### React

When you use jQuery, most of your code ends up something like this:

```
<div id="some-div"></div>
<input id="some-text"/>

$("#someText").change( () => $("#some-div").html($("#some-text").val()));
```

This gets old really fast, especially when you have a lot of UI to update.

It also requires a lot of discipline to keep it well-structured. So can we somehow make this declarative as well?

Enter [React](https://facebook.github.io/react/)/jsx:

```
var SomeComponent = React.createClass({
  getInitialState: function() {
    return {someText:""}
  },
  handleChange: function() {
    this.setState({someText: this.refs.someText.value})
  },
  render: function() {
    return (
      <div>The text in the input box is {this.someText} </div>
      <input ref="some-text" onChange={this.handleChange}/>
    );
  }
});
ReactDOM.render(
  <SomeComponent />,
  document.getElementById('content')
);
```

I know this example is a lot larger than the previous one, but imagine you'd have to update 20 DOM elements. In react, all you do is set the state, the lib does everything else for you.

Another thing that's not really obvious when you first start, is that React is really - and I mean really - picky about which component owns which data. This enforces you to properly structure your application, and think about these boundaries that we consider so important.

Another thing to notice is that, while react only updates the DOM elements that require updating, it does this with an intermediate step using `VirtualDom`, so whenever an element in your view requires re-rendering, react renders the whole tree, diffs it with the old version, and than updates the DOM.

Next to this, you should also notice the whole `getInitialState` and the use of `setState`. Why can't I just declare the data on my component and modify it using regular JavaScript ops?

### The new kid on the block: Vue.js

Welcome to [vue.js](http://vuejs.org/). Vue.js is like React, but without the warts: it doesn't require VirtualDom, but just updates the relevant dom elements based on the changes of your state. It also doesn't require you to ugly warts like `setState`. Let me show you an example for this code in vue.js:

```
<div id="some-div">
    <div>The text in the input box is {{someText}}</div>
    <input v-model="someText" />
</div>
new Vue({
    el: '#some-div',
    data: {
        someText: ''
    },
})
```

So, the whole thing is declarative now. But there's more: every Vue instance is also a proxy for it's data, so you can both read and change data by using the default JavaScript `this.someText = "abc"`. If you make your instance global and set it in the JavaScript console, your view will still update. So no more ugly `setState`, `setInitialState` etc.

There's more: vue allows you to define computed properties on your data, and what's even better, is that it knows which computed properties it needs to recompute in order to stay up to date.

So it has all the benefits of react, but without the ugly `setState` or the overhead of the VirtualDom.

And, by the way, your data no longer needs to be owned by a component; you can now have data as the root, and pass it in to your components. So there is no longer the need for a flux/redux architecture if you are using a rather straightforward app.

Finally, vue.js puts the declarative back in the views. As react is basically javascript, you had to re-introduce things like if statements and for-loops in your jsx. This gets ugly really fast. Vue opted for attributes like `v-for` and `v-if`, which allow you to get rid of the ugly warts in your jsx files.

**UPDATE**: here's an example why declarative is better in templates:

<blockquote class="twitter-tweet" lang="nl"><p lang="en" dir="ltr"><a href="https://twitter.com/jen20">@jen20</a> here&#39;s an example: I need a loop, but I don&#39;t want to create a child component. also : closing brackets etc. <a href="https://t.co/CFhpO8N6Ug">pic.twitter.com/CFhpO8N6Ug</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/status/659364100795998208">28 oktober 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

## Finally, on learning libs and frameworks:

I tend to take month-long sabbaticals to learn new things; over the years I've studied F#, Erlang, Haskell, TDD, BDD, DDD, CQRS, ...

However, I tend to be picky in what I choose; every single thing had something that would somehow require me to change the way I think about things on a higher level.

On the opposite side: recently I learned about BackBone/Marionette so I could help on a project, but it wasn't exactly a stimulating experience as no new paradigms were introduced.

>**I try to invest my learning time in things that will actually make a difference**

Which is exactly why I think you should at least take a look at vue.js right now.

The added benefit over react is not that large that it will make me rewrite my react apps into vue apps, but I'll probably use it for new projects.

## PS: on ELM

For the ones asking: I did take a look to [ELM](http://elm-lang.org/), but for me the whole FRP things feels too alien from HTML. I'd rather implement my domain logic in a typed functional language, and use simple javascript for the representation.
