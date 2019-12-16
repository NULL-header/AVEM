# AVEM
a Auto Virtual Environment Maker for windows.  

#仕様  
*Pythonが入っているWindows前提。  
*Gitの使用及びAtomでのコーディング想定。  
*仮想環境が構築されているかどうかはrequirements.txtのMD5のハッシュ値が名前のファイルの存在によって判別している。  
*ハッシュ化するコマンドは空のファイルをMD5化するとエラーを起こして空の結果を返す為、空の結果が帰って来たときに0byteのMD5を直接定義している。  
*requirements.txtのハッシュ値が０を表すものの場合、`python -m pip -r requirements.txt`は行われない。  
*カレントディレクトリの中にPythonの仮想環境を構築する。  
*Git用のgit-bashへのアクセスやAtomへのアクセスを補助するバッチファイルも生成する。  
*.gitignoreも生成する。  

#バグ、改善点  
*requirements.txt及び.gitignoreについてだが、バッチファイルの`echo. >somefile`というコマンドの結果が[空白][改行]となる為、MD5によるハッシュ化が可能であり、0byteの判定に引っ掛からない。よってrequirements.txtにパッケージが書き込まれているとして`python -m pip -r requirements.txt`が実行されてしまう。ただし、空白を引数にしている為にパッケージはインストールされない。`これについて、空白のみが入っていた場合のMD5のハッシュ値もpip回避のif文の条件に書き込むことが想定される。  
*想定では環境構築時にはPythonのコードを実行せずに終了するように設計したのだが、requirements.txtにパッケージが含まれている場合の環境構築時のみコマンドが終了し、requirements.txtが空のときにもコードが実行される。これについては、if文を括弧で改行しているのが問題であるとして、サブルーチンの活用をすることで回避が可能でないかと考えている。
*requirements.txtに書き込んでいないパッケージの削除の為、毎回仮想環境を削除し、毎回生成しては毎回Pipをアップデートをしている。これは非常に非効率であるので、その辺りの改造が望まれる。  