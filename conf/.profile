############ iterm2 #######
# key bindings
#bindkey "\e[1~" beginning-of-line
#bindkey "\e[4~" end-of-line
# CTRL+q
stty start undef
stty stop undef
bindkey \^U backward-kill-line
alias md='mkdir'

###############
#export
export ENV_MODE=dev
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export CLICOLOR="xterm-color"
export PATH=/usr/local/opt/python/libexec/bin:$PATH:$HOME/www/a/bin:~/bin
export PATH=/usr/local/Cellar/openresty/1.15.8.3_1/nginx/sbin:$PATH
export GNUTERM=qt
export PROMPT='${ret_status}%{$fg_bold[green]%}%p%{$fg[cyan]%}%C$ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}'$'\n$ '
#export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"
export PIP_FORMAT=columns

##############lua
export LUA_DIR=/usr/local/opt/lua@5.1

#################NVM##############
echo "nvm.sh"
export NVM_DIR="$HOME/.nvm"
#source $(brew --prefix nvm)/nvm.sh
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

ulimit -n 1000

# alias
export EDITOR="nvim"
alias vi='nvim'
alias vim='nvim'
alias cp='cp -i'
alias svnst='svn st'
alias l='ls -lah'
alias code1='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

# python
alias py='ipython3'
alias p='python'
alias p2='python2'
export PYTHONPATH=.

# docker
alias drmi='docker rmi $( docker images --filter "dangling=true" -q --no-trunc)'


# brew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

#git
#sh ~/.git.bash

# git complete
#tree /usr/local/etc/bash_completion.d
#adb-completion.bash git-completion.bash git-prompt.sh

# git command
alias gitup='git submodule init && git submodule update'
alias ga.='git add .'
function lllllllllzrmv(){
    mv $2 $1;
}

function gcap(){
    ori_dir=$(pwd)
	git commit -am $1;
    if test $? != 0;then
        return
    fi

    if git remote | grep '\w';then
        if git remote | xargs -L1 -J% git push --follow-tags % HEAD; then
            cd $(git rev-parse --show-toplevel)
            subdirs=(b )
            top_dir=$(pwd)
            echo "check top_dir $top_dir"
            for subdir in "${subdirs[@]}"; do
                echo "check subdir $subdir"
                test -d $subdir && ! test -f $subdir/nopush && cd $subdir;
                if test $? = 0;then
                    echo git push $subdir;
                    subFullPath="$top_dir/$subdir"
                    echo $subFullPath
                    if [[ ${subFullPath%a/b} != $subFullPath ]];then
                        echo git pull
                        git pull -Xtheirs
                    fi
                    git add .
                    git commit -am "msg:$1"
                    git remote | xargs -L1 git push
                    cd $top_dir
                fi
            done
        fi
    elif git svn info | grep '\w';then
        echo git svn dcommit;
        git svn rebase;
        git svn dcommit;
    fi
    cd $ori_dir
}

# grep
unset GREP_OPTIONS
alias grep='grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn'
mcd(){ mkdir -p $@; cd $1;}
alias grepr='grep -rn -F'
grepr.(){ grep -rn $@ .}

# gbk
function iconvgbk(){
	if test $# -gt 0; then
		test -f $1 && iconv -c -f gbk -t utf-8  $1 > ~/tmp.txt && mv ~/tmp.txt $1 && echo "Successfully convert $file!";
	fi
}
function uniqfile(){
	if test $# -gt 0; then
		echo "waiting";
		sort $1 | uniq > ~/tmp.txt && mv ~/tmp.txt $1 && echo 'succ'
	fi
}

# loop shell command
function loop(){
	while true;do
		#printf "\r%s" "`$*`";
		printf "\n%s" "`$@`";
		sleep 1;
	done
}

# mda
function mda (){
        mkdir -p $1
        sudo chmod a+rwx $1
}

#alias for cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

alias yarn=tyarn

# z.lua
#eval "$(lua ~/conf/z.lua --init zsh)"

[ -f ~/.private ] && source ~/.private
[ -f ~/.local.rc ] && source ~/.local.rc

# golang
export GODEV=local
export GO111MODULE=on 
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
[[ -d $GOROOT ]] || export GOROOT=/usr/local/Cellar/go@1.12/1.12.17/libexec
alias go12='export GOROOT=/usr/local/Cellar/go@1.12/1.12.17/libexec; ln -sf /usr/local/opt/go@1.12/bin/go /usr/local/bin/go'
alias go14='export GOROOT=/usr/local/Cellar/go/1.14/libexec; ln -sf /usr/local/opt/go@1.14/bin/go /usr/local/bin/go'


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
