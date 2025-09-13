#!/bin/bash

# Function to create user and setup workspace
setup_user() {
    local username=$1
    
    # Create user (macOS syntax)
    sudo dscl . -create /Users/"$username"
    sudo dscl . -create /Users/"$username" UserShell /bin/bash
    sudo dscl . -create /Users/"$username" RealName "$username"
    sudo dscl . -create /Users/"$username" UniqueID "$(( $(dscl . -list /Users UniqueID | awk '{print $2}' | sort -n | tail -1) + 1 ))"
    sudo dscl . -create /Users/"$username" PrimaryGroupID 20
    sudo dscl . -create /Users/"$username" NFSHomeDirectory /Users/"$username"
    
    # Create home directory and workspace
    sudo mkdir -p "/Users/$username"
    sudo mkdir -p "/Users/$username/workspace"
    
    # Set ownership and permissions
    sudo chown -R "$username:staff" "/Users/$username"
    sudo chmod 700 "/Users/$username/workspace"
    
    # Set password (macOS doesn't support password aging the same way)
    sudo passwd "$username"
    
    echo "User $username setup completed"
}


# Set password policy for all users
sudo pwpolicy -setglobalpolicy "minChars=8 requiresNumeric=1 maxMinutesUntilChangePassword=43200 minMinutesUntilChangePassword=1440 usingHistory=6"

# Setup users
setup_user "sarah"
setup_user "mike"


# ------ OUTPUTS  ------ 

# ./user_setup.sh
# Password:
# Changing password for sarah.
# New password:
# Retype new password:
# passwd: Password change failed because password does not meet minimum quality requirements.  Password change failed because password does not meet minimum quality requirements.
# User sarah setup completed
# Changing password for mike.
# New password:
# Retype new password:
# passwd: Password change failed because password does not meet minimum quality requirements.  Password change failed because password does not meet minimum quality requirements.
# User mike setup completed


# linux_assignment git:(main) ✗ ./user_setup.sh
# Changing password for sarah.
# New password:
# Retype new password:

# ################################### WARNING ###################################
# # This tool does not update the login keychain password.                      #
# # To update it, run `security set-keychain-password` as the user in question, #
# # or as root providing a path to such user's login keychain.                  #
# ###############################################################################

# User sarah setup completed
# Changing password for mike.
# New password:
# Retype new password:

# ################################### WARNING ###################################
# # This tool does not update the login keychain password.                      #
# # To update it, run `security set-keychain-password` as the user in question, #
# # or as root providing a path to such user's login keychain.                  #
# ###############################################################################

# User mike setup completed


# List users

# linux_assignment git:(main) ✗ ls ~
# hemac  mike   root   sarah