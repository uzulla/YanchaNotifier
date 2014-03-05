# Yancha Notifier

Yanchaの投稿をMacの通知センターにたたきこみます

OSX 10.8 and higher.(terminal-notifierの都合)

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

# Text to speech

OSX(Mavericksでテスト)では読み上げ機能が使えます。
事前にシステム環境設定＞音声入力と読み上げで、kyoko音声データを入れて下さい
configでオフにできます。
rateは速度です、多少遅くしてあります。

# see also

Unruly [https://github.com/ytnobody/Unruly](https://github.com/ytnobody/Unruly)

Yancha [http://yancha.hachiojipm.org](http://yancha.hachiojipm.org/)


