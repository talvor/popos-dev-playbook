if ! command -v ansible &> /dev/null
then
    echo "**** Installing ansible"
    sudo apt install python3-pip
    pip install --user ansible
    export PATH=$PATH:~/.local/bin
fi