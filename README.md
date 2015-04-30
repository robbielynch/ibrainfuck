# Brainfuck Kernel for IPython

IBrainfuck is brainfuck language kernel for [IPython.](http://ipython.org) It
allows users to use IPython's Notebook frontend, except where IPython executes
python code, IBrainfuck can execute brainfuck code.

This is on top of all of IPython's other frontend features like Markdown
rendering, HTML rendering, saving notebooks for later use and even the ability
to view IBrainfuck Notebooks in [IPython's NBViewer](http://nbviewer.ipython.org/)

## [Demo Brainfuck Notebook](http://nbviewer.ipython.org/gist/robbielynch/e611442ca2d056f3b78f)

## Requirements:

* Python 3.4 in your ``$PATH``
* ``virtualenv`` installed

## Installing for the first time

```bash
$ make bf-deps
```
Once IPython starts up. In the top right corner:
`Select New -> Brainfuck`

## Running every other time
```bash
$ make bf
```
Once IPython starts up. In the top right corner:
`Select New -> Brainfuck`

### Thanks to:
Thanks to **Joel Buchheim-Moore** for his brainfuck interpreter - [Which I found on github](https://github.com/joelbm24/brainy/blob/master/lib/bfinter.py)


