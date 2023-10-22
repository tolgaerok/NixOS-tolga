{ config, lib, ... }:

#---------------------------------------------------------------------
# Tolga Erok
# 22/10/23
# My personal $HOME directory populator  
# 
# ¯\_(ツ)_/¯
#---------------------------------------------------------------------

let
  setGnomeProfilePicture = ''
    mkdir -p /var/lib/AccountsService/icons
    if [[ ! -h /var/lib/AccountsService/icons/tolga ]]; then
      cp /etc/nixos/SETUP/profile-pics/cool-tolga-2.png /var/lib/AccountsService/icons/tolga
      cp /etc/nixos/SETUP/profile-pics/smile.jpg /var/lib/AccountsService/icons/SOS
    fi
  '';

  createCustomDirectories = ''
    for user_home in /home/*; do
     echo "User home: $user_home"
      username=$(basename "$user_home")
      if [[ "$username" != "root" && "$username" != "NixOs" ]]; then
        # Create basic .bashrc file if it doesn't exist
        if [[ ! -e "$user_home/.bashrc" ]]; then
          echo 'PS1="\\u@\\h:\\w\\$ "' > "$user_home/.bashrc"
        fi

        # Create standard directories
        mkdir -p "$user_home/Documents"
        mkdir -p "$user_home/Downloads"
        mkdir -p "$user_home/Pictures"
        mkdir -p "$user_home/Music"
        mkdir -p "$user_home/Videos"
        mkdir -p "$user_home/Public"
        mkdir -p "$user_home/Templates"
        mkdir -p "$user_home/.config"
        mkdir -p "$user_home/.ssh"

        # Optional: Create user-specific configuration files
        touch "$user_home/.bash_profile"
        touch "$user_home/.profile"

        # Get the user's primary group and set ownership
        usergroup=$(id -gn "$username")
        chown -R "$username:$usergroup" "$user_home/Documents" "$user_home/Downloads" "$user_home/Pictures" "$user_home/Music" "$user_home/Videos" "$user_home/Public" "$user_home/Templates" "$user_home/.config" "$user_home/.ssh" "$user_home/.bash_profile" "$user_home/.bashrc" "$user_home/.profile"
      fi
    done

    # Print "User directories created" in blue
    echo -e "\n\e[34mUser directories created in:\e[0m $HOME\e[0m\n"
  '';
in {
  options = {
    Batman = {
      enable = lib.mkEnableOption
        "Enable the Batman directory creation and profile picture setup";
    };
  };

  config = {
    system.activationScripts.setGnomeProfilePicture =
      if config.Batman.enable then setGnomeProfilePicture else "";

    # Execute the createCustomDirectories script for all user home directories
    system.activationScripts.createCustomDirectories = createCustomDirectories;
  };
}
