# Contributing

Awesome that you are reading this!

 * For questions, you can create an Issue
 * Code changes go via Pull Requests

This tutorial is in its early stages and full of
tyypo's and inc*orrect form*atting.

I am open to any suggestions.

## Suggestions

 * Fill the gaps: the statuses indicate my non-existing Travis build examples. 
   It would be helpful for this tutorial to fill those gaps
 * Move text: text is now in a `LyX` file, where most people (including me) would
   prefer a web-friendly version. I intend to move the content to the `README.md`
   file of each example.
 * Improve my style: the current Travis build scripts can be improved:
    * idioms that 'just work'
    * faster build times, by avoid using `apt-get install`, but use `addons`:

```
# Slow, to be avoided
sudo apt-get install libboost-all-dev

# Fast, to be preferred
addons: 
  apt: 
    packages: libboost-all-dev
```

## Branching policy

 * There is only one branch, called `master`

If needed, a `develop` branch will be added.

## Submitting a new build

Every build must:

 * Provide a minimal example
 * Be tested to compile cleanly
 * Have a good style, following this [.clang-format](.clang-format) file

## Roadmap

 * Add and improve content:
   * Getting all examples to work
   * Move text to `README.md`s of individual builds
   * Adding more examples
 * Write a script to bundle chapter as one PDF