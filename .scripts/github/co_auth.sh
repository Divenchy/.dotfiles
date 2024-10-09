thy_self='Co-authored-by: divenchy <lf7834am@tamu.edu>'
co_auth_1='Co-authored-by: nathantruongtamu <156832505+nathantruongtamu@users.noreply.github.com>'
co_auth_2='Co-authored-by: cdavis328 <cdavis328@tamu.edu>'
co_auth_3='Co-authored-by: eoe789 <125845846+eoe789@users.noreply.github.com>'
co_auth_4='Co-authored-by: FrozenEarth <39888817+frozenearth-git@users.noreply.github.com>'

read -p "`echo $'Enter the commit message: '`" message

commit_messages=("-m" "$message")

read -p "`echo $'Who contributed? If there are multiple authors, separate with a space (e.g. foo bar):\n 1. Connor\n 2. Eduardo\n 3. Nathan\n 4. Steven\n $$ '`" -a contributors

for i in ${contributors[*]};
do
    if [[ $i == "Connor" || $i == "1" ]]; then
        commit_messages+=("-m" "$co_auth_2")
    elif [[ $i == "Eduardo" || $i == "2" ]]; then
        commit_messages+=("-m" "$co_auth_3")
    elif [[ $i == "Nathan" || $i == "3" ]]; then
        commit_messages+=("-m" "$co_auth_1")
    elif [[ $i == "Steven" || $i == "4" ]]; then
        commit_messages+=("-m" "$co_auth_4")
    fi
done

read -p "`echo $'Enter branch to push: '`" branch

echo "git commit ${commit_messages[@]}"

git add .
git commit "${commit_messages[@]}"
git push -u origin $branch
