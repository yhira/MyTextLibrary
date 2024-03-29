'----------------------------------------------------------------------
【ソ フ ト名】 MyTextLibrary
【バージョン】 Ver.0.72b
【ソフト種別】 フリーソフト
【動作可能OS】 Windows 98/Me/2000/XP
【必要なもの】 なし
【開発  言語】 Borland Delphi Professional Version 6.0
【著  作  権】 Copyright (C) 2003 yhira
【Ｕ　Ｒ　Ｌ】 今んとこ無し
【電子メール】 yhira@uoz.fitweb.or.jp
'----------------------------------------------------------------------

【 概要 】
    「MyTextLibrary」はテキストファイルの閲覧、検索を目的したソフトです。
    オンラインソフトに付属しているテキストファイルやプログラムのソースコー
    ドなど形式化したテキストファイルの閲覧に便利です。また、MyTextLibrary
    フォルダ内に独自のテキストファイルライブラリを作成することによりテキス
    トファイルの管理、検索が容易になります。目的のテキストの場所、語句にす
    ばやく到達したいときに威力を発揮すると思います。

    元々このソフトは、作者がオンラインソフトのテキストヘルプを管理したり、
    プログラムのTips、ソースコード、書籍などのサンプルを登録しておいて、特
    定の手続きや関数名などを検索し、その検索した手続き、関数の使用方法を参
    照する目的で作成したソフトに機能を追加したものです。

【 特長 】
◆しおり設定機能
    テキストファイルにしおりを設定できます。しおりを選択することによりその
    部分を表示します。また、設定したしおりは次回起動時にも有効で、何度も参
    照する部分などに、容易に到達することが出来ます。
◆目次機能
    ファイルを開くと、MyTextLibraryオプションに従い自動的に目次を自動作成
    します。しおり同様目次を選択することによりその部分を表示します。
◆強調表示機能
    オプションで予約語を設定することにより、登録した予約語を強調表示します。
    また、HTML、C++、JAVA、Delphi、Perl、COBOL、Ruby、JSP、SQL表示形式にも
    設定可能です。
◆検索機能
    MyTextLibraryに登録されているテキストファイルから、特定の文字を検索し、
    発見されたテキストファイル名、発見場所をリストアップします。
◆編集機能
    編集ファイルの保存などは自動的に行います。ファイルはテキストファイルラ
    イブラリに登録されたデ−タを編集するだけなので、元のファイルに影響を及
    ぼすことはありません。

【 インストール 】
	適切な解凍ソフトを使用して、任意のフォルダに解凍します。

	※バージョンアップについて
		MyTextLibraryを解凍したフォルダに新バージョンの
「MyTextLibrary.exe」を
		上書きコピーして下さい。

【 アンインストール 】
    MyTextLibraryを解凍したフォルダの中の以下のフォルダ、ファイルを削除し
    て下さい。

      MyTextLibrary.exe
      config.tls
      editor.tls
      option.tls
      MYTEXTLIBRARY.HLP
      MyTextLibrary.cnt
      Readme.txt
      Setting  --------フォルダ
      LibraryData  -----フォルダ

    レジストリは使用していません。

【 使用方法 】
    MyTextLibrary.exeをマイコンピュータなどからダブルクリックすると起動で
    きます。

◆新規ファイル・フォルダの作成
    新しいファイルを作成するには、まず、追加したいフォルダをアイテム表示欄
    から選択してから[ファイル]-[ファイルの新規作成]を実行して下さい。ファイ
    ルアイテム設定ダイアログが表示されアイテム名などを設定して[OK]ボタンを
    押してください。新規ファイルアイテムが作成されます。
    カテゴリ分けするにはファイルを作成同様に追加したいフォルダをアイテム表
    示欄から選択して[ファイル]-[フォルダの新規作成]がを実行してください。
    フォルダアイテム設定ダイアログが表示されアイテム名などを設定して[OK]ボ
    タンを押してください。新規フォルダアイテムが作成されます。
◆既存のファイル・フォルダを開く
    テキストファイルを開くには追加したいフォルダをアイテム表示欄から選択し
    て[ファイル]-[ファイルを開く]を実行して下さい。ダイアログが表示されオ
    プションで設定されている拡張子のファイルを開くことが出来ます。
    フォルダに含まれているファイルをを開くには追加したいフォルダをアイテム
    表示欄から選択して[ファイル]-[フォルダごと開く]かもしくは[ファイル]-
    [サブフォルダも含めてフォルダを開く]を実行して下さい。[フォルダごと開
    く]はダイアログで選択された階層のみのファイルの取得です。
    [サブフォルダも含めてフォルダを開く]はダイアログで選択されたフォルダ以
    下のすべての階層のファイルを取得するので、選択したフォルダ以下に無数の
    ファイルが存在する場合には、かなり時間がかかる場合があるので、実行には
    十分注意して下さい。
◆検索
    検索をするには検索バーの入力コンボボックスに検索対象文字を入力して、入
    力コンボボックス横から検索条件を選択して[ファイル検索]ボタンを押して下
    さい。検索条件に応じた結果がリストアップされます。
    大文字小文字を区別した検索、正規表現などの検索には対応していません。
◆しおりの登録
    ドキュメントエリアのしおりに登録したい行に、入力カーソルを置き、[右ク
    リック]-[この文をしおりに追加]で登録できます。（＊折り返し表示されてい
    る場合は改行された後の文の先頭が登録されます。）しおりを削除する場合は
    [右クリック]-[この文をしおりから削除]又は[このファイルのしおりを全て削
    除]を選択して下さいエディタ画面左端をダブルクリックででもしおりの登録・
    削除ができます。[ツール]-[しおりマネジャー]でしおりの一括管理も出来ま
    す。

【 免責事項 】
    このソフトウェアを使用したいかなる結果に対しても、作者は免責とします。
    ソフトウェア、及び付随するファイルを所有、またはダウンロード開始した時
    点で、使用者がすべてのリスクを引き受けることとします。使用者ご自身の責
    任で使用してください。
    このソフトにバグ等の不具合が発見された場合できる限り対処しますが、必ず
    バージョンアップするという責任は負いません。

【 転載・配布について 】
    使用、転載、および配布には制限はありませんが、転載、配布時には事後でも
    よいので私にメールで連絡を下さい。
    転載、配布時は書庫ファイル名及び格納ファイルを改変しないで下さい。また、
    入手したファイルをすべて含めた形で行ってください

【 謝辞 】
    このソフトウェア開発にあたり､いろいろなソフトを参考にさせて頂き、また
    多数の優れたコンポーネントを使用させて頂きました。これらがなければ本ソ
    フトも作成できなかったと思います。ソフト、コンポーネントの作者の方にこ
    の場を借りて厚くお礼申し上げます。

履歴
====
2003/02/22 0.72b  D&Dに対応
2003/02/21 0.71b　テスト版作成
'----------------------------------------------------------------------
