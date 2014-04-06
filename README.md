SuperMakefile
==============

A simple Makefile for non-recursive make.

## Setup

	cd ~
	git clone git@github.com:r10r/SuperMakefile.git .SuperMakefile
	echo "alias smake='make -f ~/.SuperMakefile/Makefile'" >> ~/.bash_profile
	. ~/.bash_profile

	ln -s ~/.SuperMakefile/uncrustify.cfg ~/.uncrustify.cfg

## Usage

see [examples](examples)

### Project Configuration

* Copy the [project.mk](templates/project.mk) to your toplevel project directory.
* Add each module folder to the `MODULES` variable.
* Add a `module.mk` file to each module folder.
* Specify the binaries to build in the `module.mk` file.

## Concepts

* [Recursive Make Considered Harmful](http://miller.emu.id.au/pmiller/books/rmch/)

* Use immediate evaluation `:=` unless you knowingly want deferred evaluation.
* Record results and include them in the Makefile.
* Automatic include dependency tracking to rely on interface changes in *.h files.
* Complete DAG right
* Use includes, as opening files is relatively inexpensive
* A whole project make only needs to interpret a single Makefile (build the DAG once)
* Do full project builds to spot errors/dependencies early

## TODO

* Improve documentation