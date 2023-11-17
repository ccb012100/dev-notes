# miscellaneous dev notes

## Useful concepts

- Active listening
- API design: feature-oriented vs. task-oriented
- Chesterton's Fence
- Composition over Inheritance
- CQRS
- Curse of Knowledge, The
- Design by contract (also known as DbC, contract programming)
- Disagree and commit
- Dynamic Programming
- Einstellung effect, The
- False Dilemma/False Dichotomy
- False economy
- Memoization
- Model-based testing
- Preconditions, Invariants, Postconditions
- Property-based testing
- [Push Ifs Up and Fors Down](https://matklad.github.io/2023/11/15/push-ifs-up-and-fors-down.html)
- Relentless forward progress
- Replaceability over reusability
- [Replace `bool`s with timestamps](https://changelog.com/posts/you-might-as-well-timestamp-it)
- Row polymorphism
- Servant leadership
- Strong opinions, loosely held
- Structural subtyping
- Testing at the system boundaries
- Vertical slice

## "Laws"

Many taken from [Laws of Software](https://www.laws-of-software.com/)

### Hyrum's Law

> With a sufficient number of users of an API, it does not matter what you promise in the contract: all observable behaviors of your system will be depended on by somebody.

### Atwood's Law

> Any application that can be written in JavaScript, will eventually be written in Javascript

### Brooks's Law

> Adding manpower to a late software project makes it later.

### Conway's Law

> Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure.

### Cunningham's Law

> The best way to get the right answer on the internet is not to ask a question; it's to post the wrong answer.

### Gall's Law

> A complex system that works has evolved from a simple system that worked. A complex system built from scratch won’t work.

### Goodhart's Law

> When a measure becomes a target, it ceases to be a good measure.

### Hofstadter's Law

> It always takes longer than you expect, even when you take into account Hofstadter's Law.

### Kerchkhoff's principle

> In cryptography, a system should be secure even if everything about the system, except for a small piece of information - the key - is public knowledge.

### Kernighan's Law

> Everyone knows that debugging is twice as hard as writing a program in the first place. So if you’re as clever as you can be when you write it, how will you ever debug it?

### Knuth's optimization principle

> We should forget about small efficiencies, say about 97% of the time: **premature optimization is the root of all evil**. Yet we should not pass up our opportunities in that critical 3%.

_Note: Knuth himself referred to it as **Hoare's Dictum**_

### Law of Leaky Abstractions

> All non-trivial abstractions, to some degree, are leaky.

### Linus's Law

> Given enough eyeballs, all bugs are shallow

### Lady Lovelace's Objection

> The Analytical Engine has no pretensions to originate anything. It can do whatever we know how to order it to perform.

### Norvig's Law

> Any technology that surpasses 50% penetration will never double again.

### Parkinson's Law

> Work expands so as to fill the time available for its completion.

### Postel's Law

> Be conservative in what you send, liberal in what you accept.

### Peter Principle

> People in a hierarchy tend to rise to "a level of respective incompetence."

### Wirth's Law

> Software gets slower faster than hardware gets faster.

### Zawinski's Law

> Every program attempts to expand until it can read mail. Those programs which cannot so expand are replaced by ones which can.

### Greenspun's tenth rule of programming

> Any sufficiently complicated C or Fortran program contains an ad hoc, informally-specified, bug-ridden, slow implementation of half of Common Lisp.

## Rob Pike's 5 Rules of Programming

Rule 1. You can't tell where a program is going to spend its time. Bottlenecks occur in surprising places, so don't try to second guess and put in a speed hack until you've proven that's where the bottleneck is.

Rule 2. Measure. Don't tune for speed until you've measured, and even then don't unless one part of the code overwhelms the rest.

Rule 3. Fancy algorithms are slow when n is small, and n is usually small. Fancy algorithms have big constants. Until you know that n is frequently going to be big, don't get fancy. (Even if n does get big, use Rule 2 first.)

Rule 4. Fancy algorithms are buggier than simple ones, and they're much harder to implement. Use simple algorithms as well as simple data structures.

Rule 5. Data dominates. If you've chosen the right data structures and organized things well, the algorithms will almost always be self-evident. Data structures, not algorithms, are central to programming.

## Other pithy phrases

> The first 90 percent of the code accounts for the first 90 percent of the development time. The remaining 10 percent of the code accounts for the other 90 percent of the development time.

-- Tim Cargill, Bell Labs

> Consider how you would solve your immediate problem without adding anything new.

-- Dan McKinley, _Choose Boring Technology_

> Some people, when confronted with a problem, think "I know, I'll use regular expressions." Now they have two problems.

-- Jamie Zawinksy

> The most important property of a program is whether it accomplishes the intentions of its user.

-- Tony Hoare

> The real value of tests is not that they detect bugs in the code, but that they detect inadequacies in the methods, concentration, and skills of those who design and produce the code.

-- Tony Hoare

> There are two ways of constructing a software design: One way is to make it so simple that there are obviously no deficiencies, and the other way is to make it so complicated that there are no obvious deficiencies. The first method is far more difficult.

-- Tony Hoare

> There is nothing a mere scientist can say that will stand against the flood of a hundred million dollars. But there is one quality that cannot be purchased in this way — and that is reliability. The price of reliability is the pursuit of the utmost simplicity. It is a price which the very rich find most hard to pay.

-- Tony Hoare

> I have regarded it as the highest goal of programming language design to enable good ideas to be elegantly expressed.

-- Tony Hoare

> SMOP (ess'em'oh'pee') noun.
>
> An acronym for "a Small Matter Of Programming". A piece of program code, not yet written, whose anticipated length is significantly greater than its intellectual complexity.
>
> This term is used to refer to a program that could obviously be written but is not worth the trouble. It is also used ironically to imply that a difficult problem can be easily solved because a program can be written to do it. The irony is that it is very clear that writing such a program will be a great deal of work.
>
> Example: "It's easy to change a FORTRAN compiler to compile COBOL as well; it's just a small matter of programming."

-- Jargon File, 1983
