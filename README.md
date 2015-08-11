This docker file enables you to easily configure an Apache docker container.
To run it call:
<code>
docker run --name apache -v /var/www:/var/www -p 80:80 -p 443:443 eagos/armhf-apache 
</code>


The following is an example of a systemd service.
<code>
[Unit]
Description=Docker apache server.
After=docker.service

[Service]
ExecStartPre=-/usr/local/bin/docker rm apache
ExecStart=/usr/local/bin/docker run --name apache -v /var/www:/var/www -p 80:80 -p 443:443 eagos/armhf-apache 
Restart=on-failure
TimeoutSec=20

[Install]
WantedBy=multi-user.target
</code>
