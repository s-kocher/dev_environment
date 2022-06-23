Direct edit git global configuration in editor :
``` cmd
git config --global -e
```

``` gitconfig
[core]
  # %USERPROFILE% or %HOME% location
  excludesfile = ~/.gitignore_global
  editor = notepad2
  # If not in PATH, use absolute path :
  #editor = 'c:\\Program Files\\Notepad2\\Notepad2.exe'
[merge]
  tool = p4merge
[push]
  default = current
[pull]
  rebase = true
[fetch]
  prune = false
[rebase]
  autoStash = true
[stash]
  showIncludeUntracked = true
[alias]
  a = add
  ap = add -p
  br = branch
  ci = commit
  ch = checkout
  com = checkout master
  cde = checkout develop
  chb = checkout -b
  cimend = commit --amend
  cimen = commit --amend --no-edit
  lg = log --decorate --graph --date-order
  lgo = log --decorate --graph --date-order --pretty=format:"%h%x09%an%x09%ad%x09%s" --date=short
  d = diff
  dc = diff --cached
  st = status -u
  rem = rebase master
  red = rebase develop
  prem = pull --rebase origin master
  pred = pull --rebase origin develop
  rc = rebase --continue
````
