#   Author: Yavuz Selim Ozkaya
# LinkedIn: https://www.linkedin.com/in/yavuzselimozkaya

# References: https://github.com/JetsonHacksNano/installSwapfile
# 	      https://gist.github.com/adujardin/c0ee25cfb343ea5b6d17ea88ec6634ac - If you want to remove GUI, visit the link

sudo apt update
sudo apt autoremove -y
sudo apt clean -y
sudo apt remove thunderbird libreoffice-* -y
sudo apt-get purge aisleriot gnome-sudoku gnome-mines gnome-mahjongg gnomine gbrainy -y
sudo apt-get autoremove -y
sudo apt clean -y
echo "[INFO] Some unnecessary stuff has been removed!"
echo "[INFO] Upgrades are in progress!"
sleep 3
sudo apt-get -y update && sudo apt-get -y upgrade
echo "[INFO] Upgrades are done!"
sleep 2

cd ~
set -e
SWAPSIZE=4	# Ubuntu recommends 6GB for 4GB of memory when using suspend but
		# Jetson Nano already has 2GB of zram prebuilt, so we need 4GB of swap file
echo "[INFO] Creating Swapfile at: /mnt"
echo "[INFO] Swapfile Size: " $SWAPSIZE"GB"
sleep 1
sudo fallocate -l $SWAPSIZE"G" "/mnt/swapfile_"$SWAPSIZE"G"	# Create a swapfile
cd /mnt
sudo chmod 600 "swapfile_"$SWAPSIZE"G"				# Change permissions so that only root can use it
sudo mkswap "swapfile_"$SWAPSIZE"G"				# Set up the Linux swap area
sudo swapon "swapfile_"$SWAPSIZE"G"				# Now start using the swapfile
echo "[INFO] Modifying /etc/fstab to enable on boot..."
sudo sh -c 'echo "/mnt/swapfile_'$SWAPSIZE'G swap swap defaults 0 0" >> /etc/fstab'
echo "[INFO] Swap file has been created at /mnt/swapfile_"$SWAPSIZE"G"
echo "[WARNING] Rebooting the system in 5 secs to make sure changes are in effect."
sleep 5
sudo reboot

