git status

git add --all
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
        msg="$*"
fi
git commit -m "$msg"

git push https://github.com/scribus79/PensierieParole-hugo.git
