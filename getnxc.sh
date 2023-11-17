#!/bin/bash

update() {
        echo -e '\nRemoving old NetExec'
        eval rm /home/kali/.local/bin/NetExec 2>/dev/null
        eval rm ~/.local/bin/NetExec 2>/dev/null
        eval sudo apt remove NetExec -y 1>/dev/null 2>/dev/null
        eval git clone https://github.com/Pennyw0rth/NetExec
        echo 'Installing NetExec' 
        eval pip3 install ./NetExec/. 1>/dev/null 2>/dev/null
        echo 'Cleaning up'
        eval rm -rf NetExec
        eval cp /home/kali/.cme/workspaces/default/smb.db /kali/.cme/cme_smb.bak 2>/dev/null 
        eval cp /root/.cme/workspaces/default/smb.db /root/.cme/cme_smb.bak 2>/dev/null
        eval rm -f /home/kali/.cme/workspaces/default/smb.db 2>/dev/null
        eval rm -f /root/.cme/workspaces/default/smb.db 2>/dev/null
        alias cme='nxc'
        echo 'Replacing cme with nxc'
        goodbyecme
        echo 'Done'
    }

goodbyecme() {
    local alias_to_add="alias cme='nxc'"
    
    for user_home in /home/*; do
        [ -e "$user_home/.bashrc" ] && ! grep -q "$alias_to_add" "$user_home/.bashrc" && echo -e "\n$alias_to_add" >> "$user_home/.bashrc"
        [ -e "$user_home/.zshrc" ] && ! grep -q "$alias_to_add" "$user_home/.zshrc" && echo -e "\n$alias_to_add" >> "$user_home/.zshrc"
    done
}

update 
