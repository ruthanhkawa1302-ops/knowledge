# Convention
```
+ psql has its own set of commands , all of which start with backslash (\)
+ Some command accepts a pattern * and ? are wildcards
+ Double quotes specify exact name, ignore all special characters and preserving case

+ During startup , psql can use environment variables for connection
+ Sau khi khởi động, psql sẽ đọc file cấu hình và thực thi các câu lệnh ~/.psqlrc
+ -f FILENAME , execute all commands in filename and exit
+ -c COMMAND , execute command and exits
+ --help display startup option and exits

+ \s	Hiển thị lịch sử các câu lệnh (command history).
+ \s FILENAME	Lưu lịch sử các câu lệnh vào file FILENAME.
+ \e	Mở query buffer trong trình soạn thảo mặc định (như vi, nano), sau khi lưu và thoát sẽ thực thi câu lệnh.
+ \e FILENAME	Mở file FILENAME trong trình soạn thảo, sau khi lưu và thoát sẽ thực thi nội dung của file đó.
+ \w FILENAME	Ghi (save) nội dung hiện có trong query buffer vào file FILENAME mà không thực thi.
psql -o FILENAME	Khi khởi động psql, ghi toàn bộ kết quả truy vấn (không bao gồm lỗi stderr) vào file FILENAME.
+ \o FILENAME	Trong phiên psql hiện tại, chuyển hướng (redirect) kết quả truy vấn sang file FILENAME.
+ \o	Tắt chế độ ghi ra file và quay lại hiển thị kết quả trên màn hình.
+ \g FILENAME	Thực thi nội dung trong query buffer và ghi kết quả trực tiếp vào file FILENAME.
+ \g	Thực thi nội dung trong query buffer (tương đương kết thúc câu lệnh bằng ;).
+ \watch <seconds>	Thực thi lại truy vấn trước đó sau mỗi <seconds> giây.
```

# Variable
Set variable
```
\set city Hanoi
\echo :city > Hanoi
\unset city
```

Ta có thể điều chỉnh một số tham số đặc biệt sau 
```
AUTOCOMMIT	Bật/tắt chế độ tự động commit sau mỗi câu lệnh SQL.
ENCODING	Thiết lập hoặc hiển thị bảng mã ký tự (character encoding) của phiên làm việc.
HISTFILE	Chỉ định file lưu lịch sử lệnh của psql.
ON_ERROR_ROLLBACK	Tự động ROLLBACK transaction khi xảy ra lỗi (hữu ích khi làm việc tương tác).
ON_ERROR_STOP	Khi gặp lỗi, psql sẽ dừng thực thi các câu lệnh tiếp theo (thường dùng khi chạy script).
PROMPT1	Tùy chỉnh dấu nhắc lệnh (prompt) chính của psql.
VERBOSITY	Điều chỉnh mức độ chi tiết của thông báo lỗi.
```
# Conditional commands
```
\if EXPR : Begin conditional block

\elif EXPR : Alternative within current conditional block

\else : Final alternative within current conditional block

\endif : End conditional block
```

# Informational commands
```
+ \d[(i|s|t|v|b|S)][+] [pattern] : List of objects (indexes, sequences, tables, views, tablespaces and dictionaries)

+ \d[+] [pattern] : Describe structure details of an object

+ \l[ist][+]  : Lists of databases in a database cluster

+ \dn+ [pattern] : Lists schemas (namespaces) , + adds permission and description to output

+ \df[+] [pattern] : Lists functions , + adds owner , language , source code and description to output
```

# Common psql Meta commands
```
+ \conninfo : Current connection information

+ \q or ^d or quit or exit : Quits the psql program

+ \cd [ directory ] : Change current working directory

Tip - To display your current working directory, use \! pwd

+ \! [ command ] : Executes the specified Unix or Windows command

If no command is specified, escapes to a separate Unix shell (CMD.EXE in Windows)
```

# Extended query protocol
```
