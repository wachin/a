---
title: go cmd
date: 2020-06-30
private: true
---
## go build
go build 命令

1. 如果是普通包，当你执行go build命令后，不会产生任何文件。
2. 如果是main包，当只执行go build命令后，会在当前目录下生成一个可执行文件。或者用go install在$GOPATH/bin木下生成相应文件
3. 文件夹下：go build 默认编译所有文件(不能多个package)，否则为指定文件 go build main.go(可以为多个package)
4. go build 会忽略目录下以”_”或者”.”开头的go文件。

go build的时候会选择性地编译以系统名结尾的文件（Linux、Darwin、Windows、Freebsd）。例如Linux系统下面编译只会选择array_linux.go文件，其它系统命名后缀文件全部忽略。

    array_linux.go 
    array_darwin.go 
    array_windows.go 
    array_freebsd.go

## go clean
go clean 命令是用来移除当前源码包里面编译生成的文件，这些文件包括

    _obj/ 旧的object目录，由Makefiles遗留
    _test/ 旧的test目录，由Makefiles遗留
    _testmain.go 旧的gotest文件，由Makefiles遗留
    test.out 旧的test记录，由Makefiles遗留
    build.out 旧的test记录，由Makefiles遗留
    *.[568ao] object文件，由Makefiles遗留
    DIR(.exe) 由 go build 产生
    DIR.test(.exe) 由 go test -c 产生
    MAINFILE(.exe) 由 go build MAINFILE.go产生

## go fmt
go fmt 命令主要是用来帮你格式化所写好的代码文件。

比如我们写了一个格式很糟糕的 test.go 文件，我们只需要使用 fmt go test.go 命令，就可以让go帮我们格式化我们的代码文件。但是我们一般很少使用这个命令，因为我们的开发工具一般都带有保存时自动格式化功能，这个功能底层其实就是调用了 go fmt 命令而已。

使用go fmt命令，更多时候是用gofmt，而且需要参数-w，否则格式化结果不会写入文件。gofmt -w src，可以格式化整个项目。

## go get
go get分成了两步操作：第一步是下载源码包，第二步是执行go install。
1. go get -d library #只下载
1. go install library #只安装，不下载

## go install
go install 命令在内部实际上分成了两步操作：
第一步是生成结果文件(可执行文件或者.a包)，
第二步会把编译好的结果移到 $GOPATH/pkg 或者 $GOPATH/bin。

下面两个命令等价

    go install
    go install .

## go test
参考go help testflag

## 其他命令
go fix 用来修复以前老版本的代码到新版本，例如go1之前老版本的代码转化到go1

go version 查看go当前的版本

go env 查看当前go的环境变量

go list 列出当前全部安装的package

go run 编译并运行Go程序