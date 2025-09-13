#!/bin/bash

# Function to create user and setup workspace
setup_user() {
    local username=$1
    
    # Create user
    useradd -m -s /bin/bash "$username"
    
    # Create workspace directory
    mkdir -p "/home/$username/workspace"
    
    # Set ownership and permissions
    chown -R "$username:$username" "/home/$username"
    chmod 700 "/home/$username/workspace"
    
    # Set password expiry
    chage -M 30 "$username"  # Password expires after 30 days
    chage -m 1 "$username"   # Minimum password age 1 day
    
    echo "User $username setup completed"
}

# Password policy in /etc/login.defs
cat << EOF >> /etc/login.defs
PASS_MAX_DAYS 30
PASS_MIN_DAYS 1
PASS_WARN_AGE 7
EOF

# Password complexity using PAM
cat << EOF >> /etc/pam.d/common-password
password requisite pam_pwquality.so retry=3 minlen=8 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1
EOF

# Setup users
setup_user "sarah"
setup_user "mike"