---
layout: post
date: "2014-03-10"
slug: "what-i-learned-from-3-years-of-cqrs-and-fp"
title: "What I learned from 3 years of CQRS and FP"
comments: true
categories: 
---

I am currently setting up part of a BC for a customer, and it took me some refactoring after having not done any serious .Net for a few years, 
but I got there in the end; here is how I structured my current software project in .Net.

<blockquote class="twitter-tweet" lang="nl"><p>Upcoming blog post: &quot;What I learned from 3 years of CQRS and FP&quot; <a href="http://t.co/MsfoInALtM">pic.twitter.com/MsfoInALtM</a></p>&mdash; Tom Janssens (@ToJans) <a href="https://twitter.com/ToJans/statuses/443087149148041216">10 maart 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I think it is a reasonable base, easy to extend; some remarks:

- I use test-after, having readable scenarios that run directly on controllers, using the fake infrastructure; I verify both models, 
view names and redirects.
- `IOther*`-interfaces implement services, but are expressed in the ubiquitous language, so f.e.:
	- Wrong: `EmailService.SendEmail`
	- Right: `Notifier.SendInvitation` (you don't wan't things like mail composition in your domain code).
- `IInfo`-interface implements events and domain queries, f.e.:
	- Wrong: `UpdateAuthenticationId` or `GetItemLine(id).code`
	- Correct: `UserAuthenticationSucceeded` of `GetItemCode(id)`
- I don't expose messages to the domain model. After all, messages are an implementation detail part of the transport layer. I learned this from `Erlang` 
where messages are first class members, but people still wrap the sending in a public interface.
- For now infrastructure tests are manually ( a staging environment needs to be provisioned later on; the change is low in these).
- The only thing I query from the domain model in the controllers is decision state (i.e. should it proceed with the registration or not, typically 
using enums).
- My `IInfo` events and queries used by the domain model modify the SQL server data directly.
- My `IViews` are only used to populate controller views.
- If I want to debug/run locally, I can replace all the non-relevant `Infrastructure` components with their `Infrastructure.Fakes` counter-parts in 
the container configuration.
- My `Infrastructure.Fakes` contain extra methods to verify f.e. whether an invocation has happened, and I use a distinct naming convention to make this
obvious, f.e. `was_invitation_sent`.

## Conclusion

So, that's it: the way I currently implemented several .Net sites for a bounded context. Tomorrow I am having a review with one of my peers, so I'm 
expecting it to be an interesting discussion - looking forward to it - !

I hope this makes any sense at all, and if you have further questions: shoot!

Cheers,

T.
