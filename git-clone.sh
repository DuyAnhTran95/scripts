#!/bin/bash
git clone $1
folder=$(basename -s .git $1)
cd $folder
echo $PWD
git remote add clonerepo $2

for branch in $(git branch -r | grep -v '\->'); do
    branchname=$(basename $branch)
    git checkout $(basename $branch);
    git push -u clonerepo $branchname
done

cd .. && rm -rf $folder
