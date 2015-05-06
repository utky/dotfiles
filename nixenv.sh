sudo mkdir /etc/nix
echo "binary-caches = http://zalora-public-nix-cache.s3-website-ap-southeast-1.amazonaws.com/ http://cache.nixos.org/" | sudo tee /etc/nix/nix.conf
