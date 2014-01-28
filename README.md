# Yancha Notifier

Yanchaの投稿をMacの通知センターにたたきこみます

Mavericks以降の必要があります

# DESCRIPTION

その内書きます

# REQUIRE

[terminal-notifier](https://github.com/alloy/terminal-notifier)

```
brew install terminal-notifier
```

or use other install method. (see detail in terminal-notifier site)

# INSTALL

```
cpanm --mirror=http://pan.hachiojipm.org/ --mirror=http://ftp.riken.jp/lang/CPAN/ --local-lib=extlib --notest --installdeps .
cp config.pl.sample config.pl
vi config.pl
run.pl
```

> mirror指定しているのは、利用しているライブラリUnrulyがcpanizeはされておらず、HachiPANにあがっているので。
> rikenのミラーはなんでもかまいません。

# see also

Unruly [https://github.com/ytnobody/Unruly](https://github.com/ytnobody/Unruly)

Yancha [http://yancha.hachiojipm.org](http://yancha.hachiojipm.org/)


