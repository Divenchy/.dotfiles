read -p "`echo $'Enter the commit message: '`" message
read -p "`echo $'Enter branch to push: '`" branch

git add .
git commit -m "$message
Co-authored-by: nathantruongtamu <156832505+nathantruongtamu@users.noreply.github.com>
Co-authored-by: cdavis328 <cdavis328@tamu.edu>
Co-authored-by: eoe789 <125845846+eoe789@users.noreply.github.com>
Co-authored-by: divenchy <lf7834am@tamu.edu>"
git push -u origin $branch
