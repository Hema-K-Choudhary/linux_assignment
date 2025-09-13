#!/bin/bash

# Create backup directory in user's home
BACKUP_DIR="$HOME/backups"
mkdir -p "$BACKUP_DIR"

# Apache backup script (assumes Homebrew installation)
cat << 'EOF' > "$HOME/backup_apache.sh"
#!/bin/bash
BACKUP_DATE=$(date +%Y-%m-%d)
BACKUP_DIR="$HOME/backups"
BACKUP_FILE="$BACKUP_DIR/apache_backup_${BACKUP_DATE}.tar.gz"

# Create backup (macOS Apache paths)
tar -czf "$BACKUP_FILE" \
    /usr/local/etc/httpd/ \
    /usr/local/var/www/ \
    2>/dev/null

# Verify backup
echo "Verifying backup contents:" > "$BACKUP_DIR/apache_verify_${BACKUP_DATE}.log"
tar -tvf "$BACKUP_FILE" >> "$BACKUP_DIR/apache_verify_${BACKUP_DATE}.log"
EOF

# Nginx backup script (assumes Homebrew installation)
cat << 'EOF' > "$HOME/backup_nginx.sh"
#!/bin/bash
BACKUP_DATE=$(date +%Y-%m-%d)
BACKUP_DIR="$HOME/backups"
BACKUP_FILE="$BACKUP_DIR/nginx_backup_${BACKUP_DATE}.tar.gz"

# Create backup (macOS Nginx paths)
tar -czf "$BACKUP_FILE" \
    /usr/local/etc/nginx/ \
    /usr/local/var/www/ \
    2>/dev/null

# Verify backup
echo "Verifying backup contents:" > "$BACKUP_DIR/nginx_verify_${BACKUP_DATE}.log"
tar -tvf "$BACKUP_FILE" >> "$BACKUP_DIR/nginx_verify_${BACKUP_DATE}.log"
EOF

# Set permissions
chmod +x "$HOME/backup_apache.sh"
chmod +x "$HOME/backup_nginx.sh"

# Setup cron jobs (for current user)
(crontab -l 2>/dev/null; echo "0 0 * * 2 $HOME/backup_apache.sh") | crontab -
(crontab -l 2>/dev/null; echo "0 0 * * 2 $HOME/backup_nginx.sh") | crontab -

echo "Backup scripts have been set up in $HOME"
echo "Backups will be stored in $BACKUP_DIR"