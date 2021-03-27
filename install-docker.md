Installing docker on Ubuntu
===========================

    sudo apt install docker.io

Add to docker group so you don't need to run docker as sudo: 

    sudo groupadd docker
    sudo usermod -aG docker $USER
    # Logout and login again

If: WARNING: Error loading config file: /home/user/.docker/config.json -
stat /home/user/.docker/config.json: permission denied

Then:

    sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
    sudo chmod g+rwx "$HOME/.docker" -R


Docker in a GCP Instance
========================

```
sudo gcloud components install docker-credential-gcr

sudo ln -s /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/docker-credential-gcr /usr/local/bin/

docker-credential-gcr configure-docker
```

Then docker pull


Set up proxy
============

    sudo mkdir -p /etc/systemd/system/docker.service.d
    sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf

Paste this:

```
[Service]
     Environment="FTP_PROXY=http://domain.com:911"
     Environment="ftp_proxy=http://domain.com:911"
     Environment="HTTP_PROXY=http://domain.com:911"
     Environment="http_proxy=http://domain.com:911"
     Environment="HTTPS_PROXY=http://domain.com:912"
     Environment="https_proxy=http://domain.com:912"
     Environment="SOCKS_PROXY=http://domain.com:1080"
     Environment="socks_proxy=http://domain.com:1080"
```

Then do: 

    sudo service docker stop
    sudo service docker start
