============
Sphinx Blank
============
Sphinxで多言語対応したHTMLドキュメントを書くための空プロジェクトです。
http://narusemotoki.github.io/SphinxBlank/ja/
http://narusemotoki.github.io/SphinxBlank/en/

-----
Setup
-----
Ubuntuの場合、このコマンドでSphinxをインストールすることができます。

::

  $ sudo apt-get install gettext
  $ sudo easy_install sphinx-gettext-helper sphinx


ドキュメントの書き方
====================

ソースの作成
-------------
sourceディレクトリ以下に拡張子をrstにして、reStructuredTextで原文を書きます。

翻訳ファイルの作成
------------------
このコマンドを実行すると、sourceディレクトリの中のディレクトリごとに翻訳用のファイルが生成されます。

::

  $ make multilingual-html

翻訳
----
localeディレクトリの中にpoという拡張子のファイルがあるので、それを編集することで翻訳することができます。

HTMLの出力
----------
翻訳ファイルを生成するときと同じコマンドでHTMLを出力することができます。出力先はbuild/htmlです。

::

  $ make multilingual-html

gh-pagesの作り方
================
このコマンドを実行することで、gh-pages用の構成にすることができます。初回のみ手動でgh-pagesというブランチを作成する必要があります。

::

   $ make gh-pages

ライセンス
==========
MIT LICENSEです。
