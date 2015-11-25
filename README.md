
# Summary

Working through all the exercises in SICP

# Installation

1. Install mit-scheme 9.2
    * https://jacksonisaac.wordpress.com/2014/03/25/installing-scheme-on-mac-os-x/
    * Download and install using the 64-bit dmg
    * Set up the shortcuts as per the article

2. Install rlwrap for command history
    * See http://stackoverflow.com/questions/11908746/mit-scheme-repl-with-command-line-history-and-tab-completion
    * Available as a [MacPort] (https://www.macports.org/ports.php?by=name&substr=rlwrap)

3. Install Unit testing framework
    * http://web.mit.edu/~axch/www/test_manager.html
    * Download http://web.mit.edu/~axch/www/test-manager-1.2.tar, unpack the tarball and
load the test-manager/load.scm


# Running 

* $ scheme  -> to launch the REPL
* $ rlwrap scheme -> lanch the REPL with command history
* 1 ]=>(load "filename.scm")   -> to load and execute the file
* 1 ]=> (exit) -> exit the repl


# References

* [MIT Scheme] (http://www.gnu.org/software/mit-scheme/)
* [All primitive procedures in Scheme] (http://jscheme.sourceforge.net/jscheme/doc/R4RSprimitives.html)
* [Debugging and Tips] (http://www.cs.rpi.edu/academics/courses/fall05/ai/scheme/tips.html)
* [SICP exercises by Bill The Lizard] (http://www.billthelizard.com/search/label/sicp)