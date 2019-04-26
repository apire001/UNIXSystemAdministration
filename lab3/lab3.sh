#!/bin/bash
echo '1. Find all file in /bin, /sbin, /usr/sbin that are setuid and owned by root.'

#These files are potential security risks because users other than root can exeute these files

read -p "Hit any key to continue."
echo find /bin/ /sbin/ /usr/bin/ /usr/sbin/ -perm /4000 -user root
find /bin/ /sbin/ /usr/bin/ /usr/sbin/ -perm /4000 -user root

echo '2. Find all files across the system that have setuid or setgid enabled (regardless of owner).'
read -p "Hit any key to continue."
echo find / perm /6000 2>dev/null
find / -perm /6000 2>/dev/null

echo '3. Find all files in /var that have changed in the last 20 minutes.'
read -p "Hit any key to continue."
echo 'find /var/ -cmin -20'
find /var/ -cmin -20

echo '4. Find all files in /var that are regular files of zero length.'
read -p "Hit any key to continue."
echo find /var/ -type f -empty
find /var/ -type f -empty

echo '5. Find all files in /dev that are not regular files and also not directories. The same command should print a listing that includes permissions and modification times (at a minimum) for these files.'
read -p "Hit any key to continue."
echo find /dev/ ! -type f ! -type d -ls
find /dev/ ! -type f ! -type d -ls

echo '6. Find all directories in /home that are not owned by root. In the same command, change their permissions to ensure they have 711 permissions.'
read -p "Hit any key to continue."
echo find /home/ -type d ! -user root -exec chmod 711 {} \;
find /home/ -type d ! -user root -exec chmod 711 {} \;

echo '7. Find all regular files in /home that are not owned by root. In the same command, change their permissions to ensure they have 755 permissions.'
read -p "Hit any key to continue."
echo find /home/ -type f ! -user root -exec chmod 755 \;
find /home/ -type f ! -user root -exec chmod 755 {} \;

echo '8. Find all files (of all types) in /etc that have changed in the last 5 days.'
read -p "Hit any key to continue"
echo find /etc/ -mtime -5
find /etc/ -mtime -5
