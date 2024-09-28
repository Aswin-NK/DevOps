Local version control system->Centrailzed version control system->Distributed version control system

git add->Stagging Area
git commit->Local Respository
git push->Remote Respository


yum install git –y ( git install package name ) 
git  --version ( find git version 2.40.1 ) 

git config --global user.name "kishondar" (git config – configure git settings, --global –make the server private) (u.name kisho007 – setting this u.name to global repo)
 
git config --global user.email "kishondarsenguttuvan@gmail.com"
 
git config --global core.editor vim (git config – configure git settings, --global setting is to @ globally , core.editor – default text editor that git will use , vim: This specifies that the text editor to be used by Git is Vim)

git config --global core.compression 2 ( core.compression you are setting the level of compression used by Git when storing objects in the repository )

git config --global diff.tool vim.diff 

git init (Git initializing)

git status ( seeing whats the git status ) Once addedd to stagging area we can able to track it ( test file is there but we cant able to track)---> output 

git add  . ( working directory to staging area command, git add . -all files (or) git add test ( particular file) (or) git --all )

git branch --->master branch created 

git commit -m “first commit” (-m message)

git log ( it shows logs ) git log --oneline ( commits shown in online )

git commit -am "second commit" ( a->add)

git branch future ( for feauture branch creation)

git branch ( we can see feature branch )

git checkout master--->git branch ( master open )

git merge future ( merged future branch code to master)---->Once in master branch we can merge

git show ce0da25 (commit id)
git blame sample ( shows modification details of every line )

go to github now, create repository, new , give name ( git repo ) , keep it public , create repository
git remote add origin  https://github.com/kishondarsenguttuvan/Gitrepoo.git
git push origin master
kishondarsenguttuvan@gmail.com
Password upload token

git remote  -v ------> To describe 