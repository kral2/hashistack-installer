
# get the installer
echo ""
echo "*** Downloading hashistack-install.sh"
curl -LO --silent https://raw.github.com/kral2/hashistack-installer/main/hashistack-install.sh
chmod +x hashistack-install.sh

# Launch the installer : local install, all tools in their latest version
echo ""
echo "*** Local install of Hashistack tools"
mkdir -p .hashistack
cd .hashistack
../hashistack-install.sh terraform packer consul nomad vault boundary waypoint

# Update PATH and activate the new tools in the current shell
echo 'export PATH=~/.hashistack:$PATH' >> ~/.bashrc
source ~/.bashrc
