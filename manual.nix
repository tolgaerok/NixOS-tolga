{ ... }:

#---------------------------------------------------------------------
# Tolga Erok
# 10/6/2023
# My personal NIXOS KDE configuration 
# 
# ¯\_(ツ)_/¯
#---------------------------------------------------------------------

{

  imports = [

    #---------------------------------------------------------------------
    # Laptop: Apple MacBook Pro 9.2 i7-3615QM Intel HD Graphics 4000
    #---------------------------------------------------------------------
    # ./machines/Apple-MacBookPro-9.2/Apple-configuration.nix
    
    #---------------------------------------------------------------------
    # Laptop: HP-i5-2520M x 4 ProBook 6460b Intel HD Graphics 3000
    #---------------------------------------------------------------------
    # ./machines/HP-i5-ProBook-6460b (FULL-CONFIG)/configuration.nix

    #---------------------------------------------------------------------
    # Desktop: HP-i7-2660-EilteDesk-8200-SFF ATI Radeon R5 340x OEM
    #---------------------------------------------------------------------
    # ./machines/HP-i7-2660-EilteDesk-8200-SFF/EliteDesk-8200-configuration.nix

    #---------------------------------------------------------------------
    # Laptop: HP-i7-3615QM x 4 EliteBook Folio 9470M Intel HD Graphics 4000
    #---------------------------------------------------------------------
    # ./machines/HP-i7-Folio-9470M (FULL-CONFIG)/configuration.nix

    #---------------------------------------------------------------------
    # Main: HP-i7-4770 x 8 EliteDesk G1 800 SFF Nvidia GT-1030
    #---------------------------------------------------------------------
    ./machines/HP-i7-4770-EliteDesk-G1-800-SFF/EliteDesk-800-G1-configuration.nix

    #---------------------------------------------------------------------
    # Laptop: Samsung NP530U4B i5-2467M ATI Radeon HD 7550M
    #---------------------------------------------------------------------
    # ./machines/Samsung-NP530U4B-configuration.nix

    #---------------------------------------------------------------------
    # Laptop: Sony Vaio VPCEB13FG i3-330M x 2 Intel HD Graphics
    #---------------------------------------------------------------------
    # ./machines/Sony-Vaio-i3-330M (FULL-CONFIG)/configuration.nix

  ];

}
