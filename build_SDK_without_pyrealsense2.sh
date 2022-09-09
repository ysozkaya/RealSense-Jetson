#   Author: Yavuz Selim Ozkaya
# LinkedIn: https://www.linkedin.com/in/yavuzselimozkaya

# References: https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
sudo apt-get install apt-utils librealsense2-utils -y
echo "[INFO] RealSense SDK has been installed!"
echo "[INFO] Upgrades are in progress!"
sleep 3
sudo apt-get -y update && sudo apt-get -y upgrade
echo "[INFO] Upgrades are done!"
