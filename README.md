提供一個簡便的框架寫題, 以UVa514當作範例

# 使用方法
基本上可以看makefile得知, 先將一題生成3個檔案, 分別是程式檔, 測試檔, 解答.

匿名規則：514.cc 514.test 514.test.ans

利用以下方法將這三個分別放置到source, tests, answer,

    make mv

你也可以手動放置, 不過我因為懶所以都直接創在目錄下
    
執行完畢後你便可以使用以下方法來測資

    make 514.test

它會自己編譯到target去, 然後對測資用diff做比對

產生的結果檔會在目錄下的test_log, 而差異檔會在diff_log

如果是只有使用 make 就只是將有更新過後的file在source/裡做編譯到target/

至於 make 514 則是對特定項目編譯, 如果有問題可以先看看makefile