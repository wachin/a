---
title: shell argv
date: 2019-05-17
---
# shell argv

    ${1:"default"}

# optional

    while getopts "a:bc" arg #选项后面的冒号表示该选项需要参数
    do
            case $arg in
                a)
                    echo "a's arg:$OPTARG" #参数存在$OPTARG中
                    ;;
                d)
                    echo "d's arg:$OPTARG" #参数存在$OPTARG中
                    ;;

                b)
                    echo "b"
                    ;;
                c)
                    echo "c"
                    ;;
                ?)  
                echo "unkonw argument"
            exit 1
            ;;
            esac
    done

test:

    sh test.sh -a name -b -c