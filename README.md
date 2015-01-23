# User-Guide How-To [![Build Status](https://magnum.travis-ci.com/hello/user-guide.svg?token=NdRqowShjfz5GNB6DGXR&branch=staging)](https://magnum.travis-ci.com/hello/user-guide)

####  Page Structure

1. Domain
  - Staging: https://staging-user.hello.is/ : this is the testing environment which reflects every commit you make on `staging` branch. There will be a brief delay until you see changes. This domain is only accessible if you are on office's wifi.
  - Production: https://user.hello.is/ or to be decided; `master` branch is responsible for it.

2. Component
  - Cover page: minimal as of now, just contains links to marketing website and user-guide
  - Header: hello logo, current post's title, and link to marketing website
  - Left sidebar: a list of dropdowns, each containing links to the children posts.
  - Posts: to be filled in.
  - Footer: none as of now.
  
  Basically, we only need to care about sidebar -> dropdowns and dropdown -> posts
 
#### Content Moderation

1. Configuration

  Each component on the side bar needs to be declared in `config.toml`. 
  ```md
  [[menu.main]]
    name = "sense system"
    pre = "<i class='fa fa-cogs'></i>"
    weight = 1
  ```
where:
  - `name`: display name which will be refered to by its dropdown items.
  - `pre`: add-on-before html content, in this case it is a bootstrap glyphicon. See reference #1
  - `weight`: component order, i.e. weight = 1 implies it is the top dropdown of the sidebar.

2. Markdown

  Each post is written as a markdown file. 
  Each file has a header and a body. Below is example of `pill_overview.md`.
  
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

  ## Sleep Pill Overview
  something about Pill
  ```
  where:
  - The part in between 2 `---` is the header which declares hierarchy of the post.
  - The part below the second `---` is the body which is responsible for the post content. See reference #2.
  - `parent`: tells that this item belongs to `sense system` group which we declared in `config.toml`. 
  - `prev`: tells its preceded post is located at`/system/sense_overview` 
  - `next`: tells its succeeded post is located at `system/accessories`. 
 
  Note that while `sense system` is the display name of the group, the containing folder's name is not necessarily   the same, in this case, it is shortened to `system`.

#### How To Contribute

1. Check out a new github branch from the `staging`, name it after your name or the features you work on.
2. Modify codes:
  - If you want to modify an existing post: 
    - Go to the responsible markdown file. Markdown files are contained in their group folder and group folders are in /content folder.
    - Edit the markdown file and save it, add comments if necessary.
  - If you want to modify an existing dropdown:
    - Go to `config.toml` file, find the responsible block, edit it.
    -  Make sure the its children posts are synced if you changes the name.
  - If you want to add a new post to a current dropdowns:
    - Go to the responsible group folder. Click `+` to add a new markdown file. Don't forget extension `.md`
    - Edit, save and comment if needed.
  - If you want to add a dropdown and then a new post in it:
    - Go to the `/content` folder. Click `+` to add a new folder and then then press `/` to add a markdown file.
    - Edit, save and comment if needed.
3. Make a pull request to `staging` branch, write a summary of changelogs and cc involved persons.
4. Verify if the changes are effective on http://staging-user.hello.is/ once the pull request is accepted, merged and deployed. If possible, view the results on both phones and PCs.

#### Convention:

1. File names are preferably named following [snake case rule](http://en.wikipedia.org/wiki/Snake_case), e.g: sense_overview.md is a appropriate file name.
2. Although markdowns allow posting pictures from third-party sites, it is encouraged to use our own pictures, i.e. upload what we need to use to folder /static/img 

#### Reference

1. [Bootstrap Glyphicon Cheatsheet](http://fortawesome.github.io/Font-Awesome/icons/)
2. [Github Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
