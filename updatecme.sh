#!/bin/bash

update() {
        echo -e '\nRemoving old crackmapexec'
        eval rm /home/kali/.local/bin/crackmapexec 2>/dev/null
        eval rm ~/.local/bin/crackmapexec 2>/dev/null
        eval sudo apt remove crackmapexec -y 1>/dev/null 2>/dev/null
        eval git clone https://github.com/Porchetta-Industries/CrackMapExec
        echo 'Installing CrackMapExec' 
        eval pip3 install ./CrackMapExec/. 1>/dev/null 2>/dev/null
        echo 'Cleaning up'
        eval rm -rf CrackMapExec
        eval cp /home/kali/.cme/workspaces/default/smb.db /kali/.cme/cme_smb.bak 2>/dev/null 
        eval cp /root/.cme/workspaces/default/smb.db /root/.cme/cme_smb.bak 2>/dev/null
        eval rm -f /home/kali/.cme/workspaces/default/smb.db 2>/dev/null
        eval rm -f /root/.cme/workspaces/default/smb.db 2>/dev/null
        echo 'Done'
    }
update 
