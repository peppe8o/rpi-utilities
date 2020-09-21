exec &> >(tee -a "logfile.log")
NOW=$(date +"%Y-%m-%d %H:%M:%S")

echo "----------------------------------------"
echo "[$NOW] Starting performance optimization"
echo "----------------------------------------"
echo "Please, be sure you are using proper Power Supply, providing enoght current for your PI"
echo
echo "----------------------------------------"
echo "[$NOW] Installing ZRAM"
echo "----------------------------------------"
echo "Downloading ZRAM:"
wget -O /usr/bin/zram.sh https://raw.githubusercontent.com/novaspirit/rpi_zram/master/zram.sh
echo "Making it executable"
chmod +x /usr/bin/zram.sh
echo "Adding to rc.local for execution on boot"
sed -i '/exit 0/ i /usr/bin/zram.sh &' /etc/rc.local
echo
echo "----------------------------------------"
echo "[$NOW] Reduce GPU shared RAM"
echo "----------------------------------------"
echo "Reducing GPU RAM to 16MB"
sed -i '$ a gpu_mem=16' /boot/config.txt
echo
echo "----------------------------------------"
echo "[$NOW] Disable HDMI"
echo "----------------------------------------"
echo "Disabling HDMI output on boot"
sed -i '/exit 0/ i /usr/bin/tvservice -o' /etc/rc.local
echo
echo "----------------------------------------"
echo "[$NOW] Optimization Finished!"
echo "----------------------------------------"
echo
