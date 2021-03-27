gitconfig file
==============

Create/Add to config file:

    sudo nano ~/.gitconfig

Paste this:

```
[push]
        default = matching
[http]
        sslverify = false
[alias]
        tree  = log --graph --all --oneline --decorate
        st    = status -uno
        chp   = cherry-pick -e
        amend = commit --amend

[user]
        email = luis@remis.io
        name  = Luis Remis
```
