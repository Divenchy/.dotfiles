
thy_self='Co-authored-by: divenchy <lf7834am@tamu.edu>'
co_auth_1='Co-authored-by: nathantruongtamu <156832505+nathantruongtamu@users.noreply.github.com>'
co_auth_2='Co-authored-by: cdavis328 <cdavis328@tamu.edu>'
co_auth_3='Co-authored-by: eoe789 <125845846+eoe789@users.noreply.github.com>'
co_auth_4='Co-authored-by: FrozenEarth <39888817+frozenearth-git@users.noreply.github.com>'
commit_string='"'


read -p "`echo $'Enter the commit message: '`" message
commit_string+=$message 
commit_string+='"'
commit_string+=' -m '
commit_string+='"'
read -a contributors -p "`echo $'Who contributed? If there are multiple authors, separate with a space (e.g. foo bar):\n 1. Connor\n 2. Eduardo\n 3. Nathan\n 4. Steven\n $$ '`"  
for i in ${contributors[*]};
do
    if [[ $i == "Connor" || $i == "1" ]]; then
        commit_string+=$co_auth_2
        commit_string+=',\n'
    elif [[ $i == "Eduardo" || $i == "2" ]]; then
        commit_string+=$co_auth_3
        commit_string+=',\n'
    elif [[ $i == "Nathan" || $i == "3" ]]; then
        commit_string+=$co_auth_1
        commit_string+=',\n'
    elif [[ $i == "Steven" || $i == "4" ]]; then
        commit_string+=$co_auth_4
        commit_string+=',\n'
    fi
done
commit_string+='"'
read -p "`echo $'Enter branch to push: '`" branch
git commit -m $commit_string
git push -u origin $branch
