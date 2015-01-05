---
layout: post
date: "2007-06-20"
slug: "send-smtp-mail-with-an-image-included-a-small-but-interesting-code-fragment"
title: 'Send smtp mail with an image included : a small but interesting code fragment'
---

<p>
Back over at codeproject an interesting article has been posted : <a href="http://www.codeproject.com/useritems/Seding_Mail.asp">how to send mail over smtp including an attached image</a>.
</p>
<p>
This is the code :
</p>
<p>
//create the mail message<br />
MailMessage mail = new MailMessage();
</p>
<p>
//set the addresses<br />
mail.From = new MailAddress(&quot;<a href="mailto:prashant@gmail.com">prashant@gmail.com</a>&quot;);<br />
mail.To.Add(&quot;<a href="mailto:you@gmail.com">you@gmail.com</a>&quot;);
</p>
<p>
//set the content<br />
mail.Subject = &quot;Mail From Prashant Lavate&quot;;
</p>
<p>
//first we create the Plain Text part<br />
AlternateView plainView = AlternateView.CreateAlternateViewFromString(&quot;This is my text , viewable by those clients that don&#39;t support html&quot;, null, &quot;text/plain&quot;);
</p>
<p>
//then we create the Html part<br />
//to embed images, we need to use the prefix &#39;cid&#39; in the img src value<br />
//the cid value will map to the Content-Id of a Linked resource.<br />
//thus &lt;img src=&#39;cid:logo&#39;&gt; will map to a LinkedResource with a ContentId of &#39;companylogo&#39;<br />
AlternateView htmlView = AlternateView.CreateAlternateViewFromString(&quot;Here is an embedded image.&lt;img src=cid:companylogo&gt;&quot;, null, &quot;text/html&quot;);
</p>
<p>
//create the LinkedResource (embedded image)<br />
LinkedResource logo = new LinkedResource( &quot;c:\\temp\\prashant.gif&quot; );<br />
logo.ContentId = &quot;logo&quot;;<br />
//add the LinkedResource to the appropriate view<br />
htmlView.LinkedResources.Add(logo);
</p>
<p>
//add the views<br />
mail.AlternateViews.Add(plainView);<br />
mail.AlternateViews.Add(htmlView);
</p>
<p>
<br />
//send the message<br />
SmtpClient smtp = new SmtpClient(&quot;127.0.0.1&quot;); //specify the mail server address<br />
smtp.Send(mail);Remember to set the Language of your code snippet using the Language dropdown.
</p>
