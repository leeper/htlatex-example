# Demo of `htlatex` build cycle

This repository demonstrates how to get a word (.docx) document from a LaTeX (.tex) source file, preserving tables, equations, and references.

(This demo uses make. So just type `make` on the command line. For a basic `make` demo, see [https://github.com/leeper/make-example](https://github.com/leeper/make-example).)

There are a couple of strategies available here.

## `htlatex`

I like `htlatex`. I works well, preserves cross-references, section numbers, citations, and equations. Other options include installing additional software, which might work better, but you already have `htlatex` installed with your TeX distribution.

The build workflow - using `make` is two steps:

```bash
htlatex manuscript "html,fn-in"
bibtex manuscript
htlatex manuscript "html,fn-in"
htlatex manuscript "html,fn-in"
pandoc manuscript.html -o manuscript-htlatex.docx
```

Note the second argument to `htlatex`, which delivers footnotes. For whatever reason they're not included in the HTML by default.

This workflow, in my experience, is the best one available. Basically, you're buiding an HTML file and using `pandoc` to convert the well-formatted HTML into a word document.

## Basic `pandoc`

An alternative is to call `pandoc` directly on the `.tex` file, but the result misses a lot:

```bash
pandoc manuscript.tex -o manuscript-pandoc.docx
```

Note that cross-references and citations are messed up. An advantage is that equations are actually typeset in Word, rather than being images of the LaTeX equations (as above). If you have an equation-heavy document, this may be the way to go. Basically figure out which is better to resolve manually - equations or cross-references.

## `pandoc` with a CSL file

Update: John McFarlane points out that the simple `pandoc` command is not appropriate. Instead, to preserve citations you need to specify a "citation style language" file and call a more verbose `pandoc` command. We'll use [this CSL file from the official CSL repo](https://github.com/citation-style-language/styles/blob/master/american-political-science-association.csl).

```bash
pandoc manuscript.tex -o manuscript-pandoc.docx --filter pandoc-citeproc --csl american-political-science-association.csl
```

This gets references working quite well.
