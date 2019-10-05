
## Install Samba
Install SMB/CIFS server, client and common files used by both 
````
sudo apt-get install samba samba-common smbclient
````

Check status of [smbd](https://www.samba.org/samba/docs/current/man-html/smbd.8.html) and [nmbd](https://www.samba.org/samba/docs/current/man-html/nmbd.8.html) service
````
sudo service smbd status
sudo service nmbd status
````

## Mount USB-Drive

Add usb via UUID-reference in ``/etc/fstab``
````
UUID=<some_uuid> /media/<somefolder>   auto    defaults          0       0
````

## Configure Samba
Edit ``/etc/samba/smb.conf``
 
Sets socket options (default is set to ``TCP_NODELAY``)
````
socket options = TCP_NODELAY IPTOS_LOWDELAY SO_RCVBUF=65536 SO_SNDBUF=65536
````

Add Share
````
[Share]
path = /media/usb1
read only = no
valid users = pi
````
## Run 
Restart smbd and nmbd.
````
sudo service smbd restart
sudo service nmbd restart
````

Sets password for samba user
````
sudo smbpasswd -a pi
````



Sources: 
- https://www.elektronik-kompendium.de/sites/raspberry-pi/2007071.htm
- https://openmediavault.readthedocs.io/en/latest/administration/services/samba.html
- https://calomel.org/samba_optimize.html
- https://wiki.ubuntuusers.de/Externe_Laufwerke_statisch_einbinden/