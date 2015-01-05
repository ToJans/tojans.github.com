---
layout: post
date: "2014-06-24"
slug: "oo-vs-fp"
title: "OO vs FP"
comments: true
categories: 
---
Today I was having a discussion on twitter, and after re-reading my timeline and seeing [this tweet](https://twitter.com/demisbellot/status/481388035050070016), I decided to blog about it.

## This is the gist of it

<table>
 <thead>
  <tr>
  <th></th>
  <th>Encapsulation</th>
  <th>Abstraction</th>
 </thead>
 <tr>
  <td>OO</td>
  <td>Required</td>
  <td>To be avoided</td>
 </tr>
 <tr>
  <td>FP</td>
  <td>To be avoided</td>
  <td>Required</td>
 </tr>
</table>

## A small explanation

### Encapsulation vs abstraction

Demis' tweet explains it perfectly:

<blockquote class="twitter-tweet" data-conversation="none" lang="nl"><p><a href="https://twitter.com/ashic">@ashic</a> <a href="https://twitter.com/ToJans">@ToJans</a> <a href="https://twitter.com/abdullin">@abdullin</a> <a href="https://twitter.com/NeilRobbins">@NeilRobbins</a> information hiding is encapsulation, creating layers is abstraction</p>&mdash; Demis Bellot (@demisbellot) <a href="https://twitter.com/demisbellot/statuses/481388035050070016">24 juni 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### OO thrives on encapsulation: 

 - Behaviour is captured in systems, hiding the concrete types and data.
 - System interactions use purpose-built integration points/contracts (i.e. `public` and/or `interfaces`). 
 - Composition happens using explicit contracts, and usually requires an integration system/- class.

### FP thrives on abstraction

 - Behaviour is captured in functions that have a precise notion of the type/parameter's meaning.
 - System design is driven by this meaning and creating new types/meanings. 
 - As functions have a precise notion on this meaning, one can easily compose behaviour by chaining functions.
