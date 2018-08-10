# Demo of `htlatex` build cyle

This repository demonstrates how to get a word (.docx) document from a LaTeX (.tex) source file, preserving tables, equations, and references.

This demo uses make. So just type `make` on the command line. (For a basic `make` demo, see [https://github.com/leeper/make-example](https://github.com/leeper/make-example).)

That's actually doing two steps:

```
htlatex manuscript
bibtex manuscript
htlatex manuscript
htlatex manuscript
pandoc manuscript.html -o manuscript-htlatex.docx
```

This workflow, in my experience, is the best one available. An alternative is to call `pandoc` directly on the `.tex` file, but the result misses a lot:

```
pandoc manuscript.tex -o manuscript-pandoc.docx
```

Note that cross-references and citations are all messed up.

Other options include installing additional software, which might work better, but you already have `htlatex` installed with your TeX distribution.
