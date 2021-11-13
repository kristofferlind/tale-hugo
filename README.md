# Tale

[![Build Status](https://travis-ci.com/EmielH/tale-hugo.svg?branch=master)](https://travis-ci.com/EmielH/tale-hugo)

This is a port of the [Tale theme for Jekyll](https://github.com/chesterhow/tale) to Hugo. Tale is a minimal Jekyll theme curated for storytellers. Checkout the demo [here](https://chesterhow.github.io/tale/). I did not design this theme; I only ported it from Jekyll to Hugo.

![Tale screenshot](https://raw.githubusercontent.com/EmielH/tale-hugo/master/images/screenshot.png)

## Installation

### 1. Install the theme

If your site is also under version control using git, the easiest way to install this theme is to add it as a submodule. If you have not created a git repo for your project yet, you need to run `git init` beforehand. Inside the folder of your Hugo site, run the following command.

```
git submodule add https://github.com/kristofferlind/tale-hugo.git themes/tale
```

Alternatively, you can clone the theme into your project.

```
git clone https://github.com/kristofferlind/tale-hugo.git themes/tale
```

### 2. Configure Hugo

Add the following line to `config.toml` to tell Hugo to use the theme.

```
theme = "tale"
```

## Example
Check /exampleSite for example of content structure

## Acknowledgments

Thanks

- to [Emiel Hollander](//github.com/EmielH) for porting to Hugo
- to [Chester How](//github.com/chesterhow) for creating the original [Tale theme for Jekyll](https://chesterhow.github.io/tale/),
- to [onedrawingperday](//github.com/onedrawingperday), [bep](//github.com/bep) and [digitalcraftsman](//github.com/digitalcraftsman) for their help in getting the theme working correctly with Hugo,
- to [lucperkins](https://github.com/lucperkins) for the [Fresh theme](https://github.com/lucperkins/hugo-fresh) from which I used some useful snippets of code.

## License
See [LICENSE](https://github.com/kristofferlind/tale-hugo/blob/master/LICENSE).
