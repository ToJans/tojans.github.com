---
layout: post
date: "2011-11-03"
slug: "bdd-given-i-did-to-support-flow-in-user-stories"
title: 'Essay : Extending BDD stories ; the "Given I did" clause - including flow in user stories'
---

### Introduction

In this essay I am going to reflect my personal ideas and opinions on the DSL syntax used for BDD, and I will propose a new concept for the common BDD language.

I am going to show you how I really grasped what I was doing wrong with my stories, and how the syntax should be extended in order to contain extra flow information in a really easy way.  
This new concept adds extra conceptual information to the stories, and also reduces the work the developer has to do to implement the DSL.

Enjoy !

### In the beginning, there was nothing !!!  

I got started on this idea while I was replying to an email about the limitations of current BDD stories. Since my conversation partner said he had some issues on the current BDD syntax used, I asked him wether he could clarify on the issues.

While I was replying to the response he sent, I was trying to explain my thoughts by giving an example :

As a customer  
I want to place orders  
So that I can get the products where and when I want them

Scenario Place an order  
When I want to place an order  
Then I should be able to select products in a catalog  

Scenario Order products  
Given I have selected on or more products in a catalog  
When I add it to my shopping cart  
Then the shopping cart should contain the selected product  

Scenario Modify a product in the shopping cart  
Given I have some products in my shopping cart  
When I edit a product order  
Then the edited product order should have changed

### Eureka !!  

This was the moment I noticed that something was wrong. Let us take a good look at the last Scenario : "Modify a product in the shopping cart" . What is wrong with it, one might ask ? While I was writing this story I was thinking the following :  
- What if the shopping cart is empty ?  
- Hmmz I don't know, I suppose we need another scenario for that  
- Another scenario for what ?  
- We define two scenarios : one for a shopping carts with products in it, and one for the case where it's empty, and we add "Given the shopping cart is (not) empty"  
- But hey, why ? I'm not interested in the "Modify the shopping cart if the shopping cart is empty" because it is just litter, it doesn't really add to the conceptual story.  
- Yeah, but as a developer I need to know what to do if it is empty and you try to modify it.  
- Are you stupid ?  Ok, maybe you need to say that it is not possible, but it adds no conceptual info at all to the story !!  
- Oh, you mean that it is actually some extra information on the scenario; the "shopping cart is not empty" is not just a given for this example; it is a requirement ???  
- Yes, it's not a given, it is a requirement that should say that this story is only valid in this particular case  
- Hmmz interesting concept, let's try :

Scenario Modify a product in the shopping cart  
If I have some products in my shopping cart  
When I edit an ordered product  
Then the edited product should have changed

- Whoa ! that looks nice; If we have this scenario, we do not need an extra scenario for the empty shopping cart  
- But wait, we could also say it like this

Scenario Modify a product in the shopping cart  
Given I have some products in my shopping cart  
When I edit an ordered product  
Then the edited product should have changed

- What is the difference ?  
- Well, it is really a conceptual thing; I'll try to think about another example

Scenario Place the order  
If I have identified myself as a valid customer  
When I edit an ordered product  
Then the edited product should have changed

- Hmmz something is wrong with it ?  
- What ?

### Eureka : Part deux

- EUREKA !!!  
- What ? Again ???  
- I found it ; the "If" clause is actually describing something you did previously.  
- In the example the "If I have identified myself as a valid customer" actually means we should have some kind of a scenario called "Identify myself as a valid customer"  
- Oh, you are describing the flow here ?  
- Yups, that is it; it is extra information you are providing....  
- Wow, that is interesting !!  
- But, I see a small problem; the name of the scenario does not match the "If "clause  
- .... let's see.... AHA !!  
- Yes ?  
- Here is the example :

Scenario Identify myself as a valid customer  
Given  I have some valid id method  
When  I identify myself  
Then   it should state me as a valid customer  

Scenario Place the order  
Given I did identify myself as a valid customer  
  And I did order products  
When place the order  
Then order should be confirmed  

Scenario Order products  
Given I did select one or more products in a catalog  
When I add it to my shopping cart  
Then the shopping cart should contain the selected product  

- Whoa, that looks nice ! So what you are actually doing is extending the story the whole time ?  
- Yes, that's it.  
- So we are gradually replacing all the "Given"s by the "Given I did" and thus including extra flow in the context ?  
- Yes !! And in theory we could go all the way until we get to the very bottom of every single implemented line of code...  
- Man ! So the developer only has to implement the "Given"s , and not the "Given I did" ?  
- Yups !!  
- That should save a lot of work !! nice !!

### In conclusion

Using the "Given I did" clause, we can include extra conceptual information in the BDD stories; the stories become tighter, but they contain even more information then before.

By analyzing the "Given I did" specs, one can deduct the flow an application should allow. In the example stated above, the option of ordering with an empty shopping cart should not be available since it is not mentioned in the stories; the developer should only allow state transitions mentioned in the stories....  

I truly think that we have something new here, and hope that this essay is a viable contribution to the BDD community on it's own !!

Kind Regards,

Tom Janssens

PS : I'm not really schizophrenic; I was just looking for a way to reflect my thaughts ;)

### Appendix A : a working example story :

```gherkin
Context      Be.Corebvba.Aubergine.Examples.Accounts.Contexts.AccountContext  
ContextDLL   Be.Corebvba.Aubergine.Examples.DLL  

Story Transfer money between accounts  

    As a user  
    I want to transfer money between accounts  
    So that I can have real use for my money  

    Given the balance of AccountA is 3m  
    Given the balance of AccountB is 2m  
    Given the owner of AccountA is the current user  

    Scenario Authenticate the current user as a 'valid or invalid' user  
        Given the name of the current user is 'username'  
          And the password of the current user is 'password'  
        When I request authentication for the current user  
        Then the process should 'fail or succeed'  

        Example  
            +--------------------+------------+------------+------------------+  
            | 'valid or invalid' | 'username' | 'password' | 'fail or succeed'|  
            +--------------------+------------+------------+------------------+  
            | valid              | Neo        | Red pill   | succeed          |  
            | invalid            | Neo        | Blue pill  | fail             |  
            +--------------------+------------+------------+------------------+  

    Scenario Authenticate the current user for 'an account'  
        Given I did authenticate the current user as a valid user  
        When I request authentication for 'an account' with the current user  
        Then the process should 'fail or succeed'  

        Example accounts :  
            +--------------+-------------------+  
            | 'an account' | 'fail or succeed' |  
            +--------------+-------------------+  
            |  AccountA    | succeed           |  
            |  AccountB    | fail              |  
            +--------------+-------------------+  

    Scenario Transfer AAm between 2 accounts  
        Given I did authenticate the current user for AccountA  
        When I transfer AAm from AccountA to AccountB with the current user  
        Then the balance of AccountA should be BBm   
        Then the balance of AccountB should be CCm   
        Then the process should 'fail or succeed'  

        Example for the transfer  

            +----+----+----+-------------------+  
            | AA | BB | CC | 'fail or succeed' |  
            +----+----+----+-------------------+  
            |  1 |  2 |  3 | succeed           |  
            |  2 |  1 |  4 | succeed           |  
            |  3 |  0 |  5 | succeed           |  
            |  4 |  3 |  2 | fail              |  
            +----+----+----+-------------------+  


### Appendix B : the resulting output of my runner:

Aubergine Console Runner - Core bvba - Tom Janssens 2009  

Processing file(s) : accounts\stories\*.txt  
  Processing file : C:\Projecten\Be.Corebvba.Aubergine\Be.Corebvba.Aubergine.ConsoleRunner\bin\Debug\accounts\stories\Transfer_money_between_accounts.txt  

    Story Transfer money between accounts =>OK  
        Given the balance of AccountA is 3m =>OK  
        Given the balance of AccountB is 2m =>OK  
        Given the owner of AccountA is the current user =>OK  
        Scenario Authenticate the current user as a valid user =>OK  
            Given the name of the current user is Neo =>OK  
            Given the password of the current user is Red pill =>OK  
            When I request authentication for the current user =>OK  
            Then the process should succeed =>OK  

        Scenario Authenticate the current user as a invalid user =>OK  
            Given the name of the current user is Neo =>OK  
            Given the password of the current user is Blue pill =>OK  
            When I request authentication for the current user =>OK  
            Then the process should fail =>OK  

        Scenario Authenticate the current user for AccountA =>OK  
            Given I did authenticate the current user as a valid user =>OK  
            When I request authentication for AccountA with the current user =>OK  
            Then the process should succeed =>OK  

        Scenario Authenticate the current user for AccountB =>OK  
            Given I did authenticate the current user as a valid user =>OK  
            When I request authentication for AccountB with the current user =>OK  
            Then the process should fail =>OK  

        Scenario Transfer 1m between 2 accounts =>OK  
            Given I did authenticate the current user for AccountA =>OK  
            When I transfer 1m from AccountA to AccountB with the current user =>OK  
            Then the balance of AccountA should be 2m =>OK  
            Then the balance of AccountB should be 3m =>OK  
            Then the process should succeed =>OK  

        Scenario Transfer 2m between 2 accounts =>OK  
            Given I did authenticate the current user for AccountA =>OK  
            When I transfer 2m from AccountA to AccountB with the current user =>OK  
            Then the balance of AccountA should be 1m =>OK  
            Then the balance of AccountB should be 4m =>OK  
            Then the process should succeed =>OK  

        Scenario Transfer 3m between 2 accounts =>OK  
            Given I did authenticate the current user for AccountA =>OK  
            When I transfer 3m from AccountA to AccountB with the current user =>OK  
            Then the balance of AccountA should be 0m =>OK  
            Then the balance of AccountB should be 5m =>OK  
            Then the process should succeed =>OK  

        Scenario Transfer 4m between 2 accounts =>OK  
            Given I did authenticate the current user for AccountA =>OK  
            When I transfer 4m from AccountA to AccountB with the current user =>OK  
            Then the balance of AccountA should be 3m =>OK  
            Then the balance of AccountB should be 2m =>OK  
            Then the process should fail =>OK
```

### Appendix C : The context + DSL

    internal class 
```C#
AccountContext  
    {  
        public User currentUser = new User();  
        public Account AccountA = new Account();  
        public Account AccountB = new Account();  
        public AccountService AccountService = new AccountService();  
        public ProcessStatus LastStatus;  

        [DSL(@"the (?<member>.+) of (?<instance>.+) is (?<value>.+)")]  
        void assignfield(object instance,string member,object value)  
        {  
            instance.Set(member, value);  
        }  

        [DSL(@"the (?<member>.+) of (?<instance>.+) should be (?<value>.*)")]  
        bool shouldbefield(object instance, string member, object value)  
        {  
            var obj = instance.Get<object>(member);  
            return Convert.ChangeType(value, obj.GetType()).Equals(obj);  
        }  

        [DSL(@"I request authentication for (?<user>.+)")]  
        void authenticate_for_account_x(User user)  
        {  
            LastStatus = AccountService.AuthenticateUser(user);  
        }  

        [DSL(@"I request authentication for (?<account>.+) with (?<user>.+)")]  
        void authenticate_for_account_x(User user, Account account)  
        {  
            LastStatus =  AccountService.AuthenticateUserForAccount(account,user);  
        }  

        [DSL(@"I transfer (?<amount>.+) from (?<from>.+) to (?<to>.+) with (?<user>.+)")]  
        void transfering_xm_from_a_to_b(decimal amount, Account from, Account to,User user)  
        {  
            LastStatus = AccountService.Transfer(user,amount, from,to);  
        }  

        [DSL]  
        bool The_process_should_fail()  
        {  
            return LastStatus.Success == false;  
        }  

        [DSL]  
        bool The_process_should_succeed()  
        {  
            return LastStatus.Success == true;  
        }  

        [DSL("(?<name>Account[AB])")]  
        Account getaccountAB(string name)  
        {  
            return this.Get<Account>(name);  
        }  

        [DSL(@"(?<amount>\d+)(?<ismillion>m?)")]  
        decimal getmillion(decimal amount,string  ismillon)  
        {  
            return amount*(ismillon=="m"?1m:1);  
        }  

        [DSL]  
        User the_current_user()  
        {  
            return currentUser;  
        }  
    }  
```