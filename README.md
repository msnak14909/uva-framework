提供一個簡便的框架寫題, 以UVa514當作範例

# 使用方法
基本上可以看makefile得知, 先將一題生成3個檔案, 分別是程式檔, 測試檔, 解答.

命名規則：514.cc 514.test 514.ans

利用以下方法將這三個分別放置到source, tests, answer,

    make mv

你也可以手動放置, 不過我因為懶所以都直接創在目錄下
    
執行完畢後你便可以使用以下方法來測資

    make 514.test

它會自己編譯到target去, 然後對測資用diff做比對

產生的結果檔會在目錄下的test_log, 而差異檔會在diff_log

如果是只有使用 make 就只是將有更新過後的file在source/裡做編譯到target/

如果要執行特定的檔案, 雖然這個使用機率很低就是了...

    make 514.out
    
如果有其他問題可以先看看makefile

剩下的一個功能是astyle, 不過使用前請先確定你有astyle的功能,

如果你是ubuntun你可以藉由apt-get install astyle來安裝

    make astyle

藉此格式化你的file, 這個部份你可以參考astyle去修改你要的規格, 用來統一程式碼風格