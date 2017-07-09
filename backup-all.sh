mkdir vim && cd vim

git init
git remote add origin git@github.com:wind85/vim

cp -r ~/.vim/ .
cp ~/.vimrc .
cp ~/.bashrc .
cp ~/.zshrc .
cp ~/.tmux.conf .
cp -r ~/.tmux/ .
cp ~/Pictures/arch.jpg .
cp /etc/i3status.conf .
cp ~/.config/i3/config .
cp ../backup-all.sh .
cp -r ~/Documents/topcoder/setup .
cp -r ~/Documents/cpp .
cp /usr/local/bin/clang-tidy.sh .

git add .*
git add .

git commit -m "$(date)"
git push -f origin master

cd ../ && rm -rf vim


