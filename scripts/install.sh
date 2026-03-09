#!/bin/bash
# author: Haohahahaha (Haorui Zhang)
# email: 1259203802@qq.com
# date: 2023-11-19

FILE_PATH=`pwd`
REMOTE_NAME=
GITHUB_REMOTE=
USER_EMAIL=
USER_NAME=

# environment variable
# JYYSLIDE_HOME=/home/hanzhe/Documents/Repos/HaohahaPPT/jyyslide-md
# MYSLIDE_HOME=/home/hanzhe/Documents/Repos/HaohahaPPT
SHELL_NAME=$1

# install jyyslide-md
sudo apt install python3
sudo apt install python3-pip
python3 -m pip install poetry
git clone https://github.com/zweix123/jyyslide-md.git
(cd jyyslide-md && python3 -m poetry install)

# configure environment variables
echo "
export JYYSLIDE_HOME=$FILEPATH/jyyslide-md
export MYSLIDE_HOME=$FILEPATH
export MYSLIDE_SCRIPT=\$MYSLIDE_HOME/scripts
alias mp=\"python3 -m poetry run python \$JYYSLIDE_HOME/main.py \" 
alias pptnew=\"\$MYSLIDE_SCRIPT/new.sh \$1\"
alias pptgen=\"\$MYSLIDE_SCRIPT/gen.sh \$1\"
alias pptopen=\"\$MYSLIDE_SCRIPT/open.sh \$1\"
" >> ~/.$SHELL_NAME
source ~/.$SHELL_NAME

# new gitignore file
touch .gitignore
echo "jyyslide-md" >> .gitignore

# new folder
mkdir -p $MYSLIDE_HOME/docs
mkdir -p $MYSLIDE_HOME/pages

# git init
git init
git config --global user.email "$USER_EMAIL"
git config --global user.name "$USER_NAME"
git add remote $REMOTE_NAME $GITHUB_REMOTE
