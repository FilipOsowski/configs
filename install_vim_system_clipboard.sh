echo "export DISPLAY=:0.0" >> ~/.bashrc
  
echo "[Unit]
Description=Turn on Xvfb for system (X-server) clipboard in Vim

[Install]
WantedBy=multi-user.target

[Service]
ExecStart=/usr/bin/Xvfb :0.0
Restart=always" > /etc/systemd/system/xvfb.service

sudo apt --yes install xvfb
sudo systemctl enable xvfb.service
sudo systemctl start xvfb.service
