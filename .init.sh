
if [ -f ~/.inited ]; then
	echo "Done!"
else
	echo "alias ..='cd ..'" >> ~/.bashrc
	echo "alias em='emacs -mm'" >> ~/.bashrc
	echo "alias wa0='source ~/.wa.sh wa0'" >> ~/.bashrc
	echo "alias wa1='source ~/.wa.sh wa1'" >> ~/.bashrc
	echo "alias wa2='source ~/.wa.sh wa2'" >> ~/.bashrc
	echo "alias wa3='source ~/.wa.sh wa3'" >> ~/.bashrc
	echo "alias wa4='source ~/.wa.sh wa4'" >> ~/.bashrc
        cp .wa.sh ~/.wa.sh -f
        cp .emacs ~/ -f
        mkdir ~/temp -p
        mkdir ~/work/wa0 -p
        mkdir ~/work/wa1 -p
        mkdir ~/work/wa2 -p
        mkdir ~/work/wa3 -p
        mkdir ~/work/wa4 -p
        
	alias ..='cd ..'
	alias em='emacs -mm'
	alias wa0="source ~/.wa.sh wa0"
	alias wa1="source ~/.wa.sh wa1"
	alias wa2="source ~/.wa.sh wa2"
	alias wa3="source ~/.wa.sh wa3"
	alias wa4="source ~/.wa.sh wa4"
        
	touch ~/.inited
	echo "...Done!"
fi

