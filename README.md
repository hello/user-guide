user-guide
==========


###  Content Configuration

- config.toml: Each component on the side bar needs to be declared. Below is example of the a dropdown where `name` is the display name which will be refered to by its dropdown items, `pre` represents the html part just before it (in this case is a bootstrap glyphicon), and `weight` is basically order in this context, i.e. weight = 1 implies it is the top dropdown of the sidebar.
```toml
[[menu.main]]
    name = "sense system"
    pre = "<i class='fa fa-cogs'></i>"
    weight = 1
```

- Markdown files (*.md): Each dropdown item is written as a markdown file. Below is example of `pill_overview.md`

```md
---
date: 2013-07-01
menu:
  main:
    parent: sense system
prev: /system/sense_overview
next: /system/accessories
title: sleep pill overview
weight: 20
---
```

This header tells that this item belongs to `sense system` group which we declared in `config.toml`. And its sibings are `sense-overview` and `accessories`. Note that while `sense system` is the display name of the group, the containing folder's name is not necessarily the same, in this case, it is shortened to `system`.

```md
## Sleep Pill Overview
something about Pill
```

This body is responsible for visual of `pill_overview`.


### Reference
  1. [Github Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
  2. [Bootstrap Glyphicon Cheatsheet](http://fortawesome.github.io/Font-Awesome/icons/)
