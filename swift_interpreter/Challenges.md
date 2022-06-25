
## Chapter 2 Challenges

 1. Pick an open source implementation of a language you like. Download the source code and poke around in it. Try to find the code that implements the scanner and parser. Are they handwritten, or generated using tools like Lex and Yacc? (.l or .y files usually imply the latter.)
 Ans. Looked at Swift

 2. Just-in-time compilation tends to be the fastest way to implement dynamically typed languages, but not all of them use it. What reasons are there to not JIT?
 Ans. Slower? 
 
 3. Most Lisp implementations that compile to C also contain an interpreter that lets them execute Lisp code on the fly as well. Why?
 Ans.
 

## Chapter 3 Challenges

 1. Write some sample Lox programs and run them (you can use the implementations of Lox in my repository). Try to come up with edge case behavior I didn’t specify here. Does it do what you expect? Why or why not?
 
 2. This informal introduction leaves a lot unspecified. List several open questions you have about the language’s syntax and semantics. What do you think the answers should be?
 Ans. How does the language deal with class function/property overrides during inheritance? 
How are cyclic references in closures dealt with?
Is there string interpolation?
How are errors handled? Are there exceptions thrown?
 
 3. Lox is a pretty tiny language. What features do you think it is missing that would make it annoying to use for real programs? (Aside from the standard library, of course.)
 Ans: Protocols or interfaces are missing. No checks for class properties, could lead to nasty runtime issues. 
