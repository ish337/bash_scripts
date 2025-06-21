#! /bin/bash

len=$(wc -l < /home/user/git/bash_scripts/hello.txt)
dat=$(date)

echo $dat " Hello World! " $len >> /home/user/git/bash_scripts/hello.txt


