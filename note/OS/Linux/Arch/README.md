# Execute arch install
## Keyboard
`loadkeys fr` to load French keyboard "AZERTY"

## Set password
`nano`, `vim`, etc..., to update password
- [/install.sh](/note/OS/Linux/Arch/install.sh) (LVM & Disk to use)
- [/chroot.sh](/note/OS/Linux/Arch/chroot.sh) (Root, user, and hostname)

## Downloading and running script
```
curl -o /install.sh https://raw.githubusercontent.com/Altherneum/.github/refs/heads/main/note/OS/Linux/Arch/install.sh
chmod +x /install.sh
/install.sh
```