!#/bin/sh
echo "export DISPLAY=:0.0" >> ~/.bashrc

echo "
[Unit]
Description=Turn on Xvfb for system (X-server) clipboard in Vim

[Install]
WantedBy=multi-user.target

[Service]
ExecStart=/usr/bin/Xvfb :0.0
Restart=always
" > xvfb.service

sudo systemctl enable xvfb.service
sudo systemctl start xvfb.service
