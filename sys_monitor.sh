#!/bin/bash

# Set log file location in current user's directory
LOG_DIR="$HOME/Library/Logs/system_monitoring"
LOG_FILE="$LOG_DIR/system_stats_$(date +%Y%m%d).log"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Function to log with timestamp
log_with_timestamp() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# System monitoring header
log_with_timestamp "=== System Monitoring Report ==="

# CPU and Memory Usage
log_with_timestamp "--- CPU and Memory Usage ---"
top -l 1 -n 5 -s 0 >> "$LOG_FILE"

# Disk Usage
log_with_timestamp "--- Disk Usage ---"
df -h >> "$LOG_FILE"

# Directory Sizes (only check current user's directory)
log_with_timestamp "--- Important Directory Sizes ---"
du -sh "$HOME/Documents" "$HOME/Downloads" "$HOME/Desktop" 2>/dev/null >> "$LOG_FILE"

# Top 5 Resource-Intensive Processes
log_with_timestamp "--- Top 5 Resource-Intensive Processes ---"
ps aux | sort -r -k 3,3 | head -6 >> "$LOG_FILE"

# Set appropriate permissions (RW-R-R)
chmod 644 "$LOG_FILE"


# ------ OUTPUTS  ------ 


# Make the script executable
# chmod +x sys_monitor.sh

# Run the script
# ./sys_monitor.sh

# View the logs
# cat "$HOME/Library/Logs/system_monitoring/system_stats_$(date +%Y%m%d).log"

#Log Output:

# cat "$HOME/Library/Logs/system_monitoring/system_stats_$(date +%Y%m%d).log"
# [2025-09-13 14:15:39] === System Monitoring Report ===
# [2025-09-13 14:15:39] --- CPU and Memory Usage ---
# Processes: 478 total, 2 running, 476 sleeping, 2031 threads 
# 2025/09/13 14:15:41
# Load Avg: 5.78, 6.15, 6.04 
# CPU usage: 12.10% user, 25.0% sys, 62.89% idle 
# SharedLibs: 248M resident, 38M data, 16M linkedit.
# MemRegions: 551363 total, 1943M resident, 106M private, 691M shared.
# PhysMem: 8154M used (1675M wired), 37M unused.
# VM: 59T vsize, 3026M framework vsize, 14110498(0) swapins, 15579337(0) swapouts.
# Networks: packets: 10610176/9639M in, 6344429/978M out.
# Disks: 7907308/180G read, 11242820/182G written.

# PID    COMMAND          %CPU TIME     #TH #WQ #PORTS MEM   PURG CMPRS PGRP  PPID STATE    BOOSTS %CPU_ME %CPU_OTHRS UID FAULTS COW MSGSENT MSGRECV SYSBSD SYSMACH CSW  PAGEINS IDLEW POWER INSTRS CYCLES USER           #MREGS RPRVT VPRVT VSIZE KPRVT KSHRD
# 89516  periodic-wrapper 0.0  00:00.01 2   1   26     368K  0B   356K  89516 1    sleeping *0[1]  0.00000 0.00000    0   625    74  85      40      275    189     78   8       1     0.0   0      0      root           N/A    N/A   N/A   N/A   N/A   N/A  
# 89453  DataDetectorsSou 0.0  00:00.09 2   1   26     728K  0B   708K  89453 1    sleeping  0[0]  0.00000 0.00000    257 2550   125 84      42      747    229     198  13      2     0.0   0      0      _datadetectors N/A    N/A   N/A   N/A   N/A   N/A  
# 78812  distnoted        0.0  00:00.49 2   1   29     432K  0B   264K  78812 1    sleeping *0[1]  0.00000 0.00000    282 2033   86  100     4094    20673  8420    7086 0       5     0.0   0      0      _trustd        N/A    N/A   N/A   N/A   N/A   N/A  
# 77199  periodic-wrapper 0.0  00:00.01 2   1   26     368K  0B   356K  77199 1    sleeping *0[1]  0.00000 0.00000    0   720    75  88      44      301    199     88   0       1     0.0   0      0      root           N/A    N/A   N/A   N/A   N/A   N/A  
# 76894  siriinferenced   0.0  00:00.19 2   1   30     1200K 0B   1192K 76894 1    sleeping  0[0]  0.00000 0.00000    0   3020   192 98      52      915    209     656  166     7     0.0   0      0      root           N/A    N/A   N/A   N/A   N/A   N/A  
# [2025-09-13 14:15:41] --- Disk Usage ---
# Filesystem       Size   Used  Avail Capacity iused    ifree %iused  Mounted on
# /dev/disk1s1s1  113Gi   14Gi  4.9Gi    75%  502388 51383800    1%   /
# devfs           192Ki  192Ki    0Bi   100%     664        0  100%   /dev
# /dev/disk1s4    113Gi  3.0Gi  4.9Gi    38%       4 51383800    0%   /System/Volumes/VM
# /dev/disk1s2    113Gi  394Mi  4.9Gi     8%    2236 51383800    0%   /System/Volumes/Preboot
# /dev/disk1s6    113Gi  4.7Gi  4.9Gi    49%      52 51383800    0%   /System/Volumes/Update
# /dev/disk1s5    113Gi   84Gi  4.9Gi    95%  864378 51383800    2%   /System/Volumes/Data
# map auto_home     0Bi    0Bi    0Bi   100%       0        0  100%   /System/Volumes/Data/home
# [2025-09-13 14:15:41] --- Important Directory Sizes ---
#   0B	/Users/hemac/Documents
# [2025-09-13 14:15:41] --- Top 5 Resource-Intensive Processes ---
# USER               PID  %CPU %MEM      VSZ    RSS   TT  STAT STARTED      TIME COMMAND
# _windowserver      169   3.0  0.4 35981072  34632   ??  Ss   19Jul25 150:01.35 /System/Library/PrivateFrameworks/SkyLight.framework/Resources/WindowServer -daemon
# root               136   1.0  0.1 33704892   6472   ??  Ss   19Jul25   3:14.41 /usr/libexec/opendirectoryd
# root               161   0.9  0.0 33659952   1592   ??  Ss   19Jul25   2:14.08 /usr/sbin/notifyd
# root                 1   0.7  0.2 34152904  13928   ??  Ss   19Jul25   7:30.87 /sbin/launchd
# hemac            25969   0.5  4.9 1494440308 414732   ??  S     7:55PM   9:36.24 /Applications/Visual Studio Code.app/Contents/Frameworks/Code Helper (Renderer).app/Contents/MacOS/Code Helper (Renderer) --type=renderer --user-data-dir=/Users/hemac/Library/Application Support/Code --standard-schemes=vscode-webview,vscode-file --enable-sandbox --secure-schemes=vscode-webview,vscode-file --cors-schemes=vscode-webview,vscode-file --fetch-schemes=vscode-webview,vscode-file --service-worker-schemes=vscode-webview --code-cache-schemes=vscode-webview,vscode-file --app-path=/Applications/Visual Studio Code.app/Contents/Resources/app --enable-sandbox --enable-blink-features=HighlightAPI --disable-blink-features=FontMatchingCTMigration,StandardizedBrowserZoom, --lang=en-GB --num-raster-threads=2 --enable-zero-copy --enable-gpu-memory-buffer-compositor-resources --enable-main-frame-before-activation --renderer-client-id=4 --time-ticks-at-unix-epoch=-1757603777929710 --launch-time-ticks=83345368964 --shared-files --field-trial-handle=1718379636,r,17399426750700218259,3868434391746150187,262144 --enable-features=DocumentPolicyIncludeJSCallStacksInCrashReports,EarlyEstablishGpuChannel,EstablishGpuChannelAsync --disable-features=CalculateNativeWinOcclusion,FontationsLinuxSystemFonts,MacWebContentsOcclusion,ScreenAIOCREnabled,SpareRendererForSitePerProcess --variations-seed-version --vscode-window-config=vscode:00f65af9-e9b1-4820-bf7e-e527ca942aac --seatbelt-client=63
# [2025-09-13 14:16:41] === System Monitoring Report ===
# [2025-09-13 14:16:41] --- CPU and Memory Usage ---
# Processes: 477 total, 2 running, 475 sleeping, 2053 threads 
# 2025/09/13 14:16:42
# Load Avg: 3.43, 5.42, 5.77 
# CPU usage: 6.3% user, 21.33% sys, 72.62% idle 
# SharedLibs: 248M resident, 38M data, 16M linkedit.
# MemRegions: 551269 total, 1961M resident, 106M private, 673M shared.
# PhysMem: 8156M used (1672M wired), 35M unused.
# VM: 59T vsize, 3026M framework vsize, 14116642(0) swapins, 15579337(0) swapouts.
# Networks: packets: 10611186/9640M in, 6345223/979M out.
# Disks: 7907891/180G read, 11243708/182G written.

# PID    COMMAND          %CPU TIME     #TH #WQ #PORTS MEM   PURG CMPRS PGRP  PPID STATE    BOOSTS %CPU_ME %CPU_OTHRS UID FAULTS COW MSGSENT MSGRECV SYSBSD SYSMACH CSW  PAGEINS IDLEW POWER INSTRS CYCLES USER           #MREGS RPRVT VPRVT VSIZE KPRVT KSHRD
# 89516  periodic-wrapper 0.0  00:00.01 2   1   26     368K  0B   356K  89516 1    sleeping *0[1]  0.00000 0.00000    0   625    74  85      40      275    189     78   8       1     0.0   0      0      root           N/A    N/A   N/A   N/A   N/A   N/A  
# 89453  DataDetectorsSou 0.0  00:00.09 2   1   26     728K  0B   708K  89453 1    sleeping  0[0]  0.00000 0.00000    257 2550   125 84      42      747    229     198  13      2     0.0   0      0      _datadetectors N/A    N/A   N/A   N/A   N/A   N/A  
# 78812  distnoted        0.0  00:00.50 2   1   29     432K  0B   264K  78812 1    sleeping *0[1]  0.00000 0.00000    282 2033   86  100     4106    20733  8444    7106 0       5     0.0   0      0      _trustd        N/A    N/A   N/A   N/A   N/A   N/A  
# 77199  periodic-wrapper 0.0  00:00.01 2   1   26     368K  0B   356K  77199 1    sleeping *0[1]  0.00000 0.00000    0   720    75  88      44      301    199     88   0       1     0.0   0      0      root           N/A    N/A   N/A   N/A   N/A   N/A  
# 76894  siriinferenced   0.0  00:00.19 2   1   30     1200K 0B   1192K 76894 1    sleeping  0[0]  0.00000 0.00000    0   3020   192 98      52      915    209     656  166     7     0.0   0      0      root           N/A    N/A   N/A   N/A   N/A   N/A  
# [2025-09-13 14:16:42] --- Disk Usage ---
# Filesystem       Size   Used  Avail Capacity iused    ifree %iused  Mounted on
# /dev/disk1s1s1  113Gi   14Gi  4.9Gi    75%  502388 51382440    1%   /
# devfs           192Ki  192Ki    0Bi   100%     664        0  100%   /dev
# /dev/disk1s4    113Gi  3.0Gi  4.9Gi    38%       4 51382440    0%   /System/Volumes/VM
# /dev/disk1s2    113Gi  394Mi  4.9Gi     8%    2236 51382440    0%   /System/Volumes/Preboot
# /dev/disk1s6    113Gi  4.7Gi  4.9Gi    49%      52 51382440    0%   /System/Volumes/Update
# /dev/disk1s5    113Gi   84Gi  4.9Gi    95%  864368 51382440    2%   /System/Volumes/Data
# map auto_home     0Bi    0Bi    0Bi   100%       0        0  100%   /System/Volumes/Data/home
# [2025-09-13 14:16:42] --- Important Directory Sizes ---
#   0B	/Users/hemac/Documents
# 1.3G	/Users/hemac/Downloads
# 1.3M	/Users/hemac/Desktop
# [2025-09-13 14:16:43] --- Top 5 Resource-Intensive Processes ---
# USER               PID  %CPU %MEM      VSZ    RSS   TT  STAT STARTED      TIME COMMAND
# root               168   9.1  0.3 33794544  25172   ??  Ss   19Jul25   9:15.14 /usr/libexec/syspolicyd
# root               170   6.1  0.1 33699032   7532   ??  Ss   19Jul25   6:42.08 /System/Library/PrivateFrameworks/TCC.framework/Support/tccd system
# hemac            11077   5.5  0.1 33698748   7268   ??  S    27Aug25   0:23.04 /System/Library/PrivateFrameworks/TCC.framework/Support/tccd
# _trustd          76859   3.7  0.1 33706644   6064   ??  Ss   15Aug25   1:46.84 /usr/libexec/trustd
# hemac            25969   2.9  5.1 1494429112 425308   ??  S     7:55PM   9:49.74 /Applications/Visual Studio Code.app/Contents/Frameworks/Code Helper (Renderer).app/Contents/MacOS/Code Helper (Renderer) --type=renderer --user-data-dir=/Users/hemac/Library/Application Support/Code --standard-schemes=vscode-webview,vscode-file --enable-sandbox --secure-schemes=vscode-webview,vscode-file --cors-schemes=vscode-webview,vscode-file --fetch-schemes=vscode-webview,vscode-file --service-worker-schemes=vscode-webview --code-cache-schemes=vscode-webview,vscode-file --app-path=/Applications/Visual Studio Code.app/Contents/Resources/app --enable-sandbox --enable-blink-features=HighlightAPI --disable-blink-features=FontMatchingCTMigration,StandardizedBrowserZoom, --lang=en-GB --num-raster-threads=2 --enable-zero-copy --enable-gpu-memory-buffer-compositor-resources --enable-main-frame-before-activation --renderer-client-id=4 --time-ticks-at-unix-epoch=-1757603777929710 --launch-time-ticks=83345368964 --shared-files --field-trial-handle=1718379636,r,17399426750700218259,3868434391746150187,262144 --enable-features=DocumentPolicyIncludeJSCallStacksInCrashReports,EarlyEstablishGpuChannel,EstablishGpuChannelAsync --disable-features=CalculateNativeWinOcclusion,FontationsLinuxSystemFonts,MacWebContentsOcclusion,ScreenAIOCREnabled,SpareRendererForSitePerProcess --variations-seed-version --vscode-window-config=vscode:00f65af9-e9b1-4820-bf7e-e527ca942aac --seatbelt-client=63
# [2025-09-13 19:28:28] === System Monitoring Report ===
# [2025-09-13 19:28:28] --- CPU and Memory Usage ---
# Processes: 477 total, 3 running, 474 sleeping, 2024 threads 
# 2025/09/13 19:28:30
# Load Avg: 4.27, 5.69, 7.31 
# CPU usage: 18.20% user, 33.94% sys, 47.85% idle 
# SharedLibs: 256M resident, 38M data, 18M linkedit.
# MemRegions: 528201 total, 2622M resident, 102M private, 819M shared.
# PhysMem: 7473M used (1578M wired), 718M unused.
# VM: 59T vsize, 3153M framework vsize, 14943497(0) swapins, 16297933(0) swapouts.
# Networks: packets: 10647208/9666M in, 6367958/985M out.
# Disks: 8008351/184G read, 11422437/186G written.

# PID    COMMAND          %CPU TIME     #TH #WQ #PORTS MEM   PURG CMPRS PGRP  PPID STATE    BOOSTS %CPU_ME %CPU_OTHRS UID FAULTS COW MSGSENT MSGRECV SYSBSD SYSMACH CSW  PAGEINS IDLEW POWER INSTRS CYCLES USER           #MREGS RPRVT VPRVT VSIZE KPRVT KSHRD
# 89516  periodic-wrapper 0.0  00:00.01 2   1   26     368K  0B   360K  89516 1    sleeping *0[1]  0.00000 0.00000    0   625    74  85      40      275    189     78   8       1     0.0   0      0      root           N/A    N/A   N/A   N/A   N/A   N/A  
# 89453  DataDetectorsSou 0.0  00:00.09 2   1   26     728K  0B   712K  89453 1    sleeping  0[0]  0.00000 0.00000    257 2550   125 84      42      747    229     198  13      2     0.0   0      0      _datadetectors N/A    N/A   N/A   N/A   N/A   N/A  
# 78812  distnoted        0.0  00:00.53 2   1   29     432K  0B   268K  78812 1    sleeping *0[1]  0.00000 0.00000    282 2096   86  100     4501    22708  9234    7674 0       5     0.0   0      0      _trustd        N/A    N/A   N/A   N/A   N/A   N/A  
# 77199  periodic-wrapper 0.0  00:00.01 2   1   26     368K  0B   360K  77199 1    sleeping *0[1]  0.00000 0.00000    0   720    75  88      44      301    199     88   0       1     0.0   0      0      root           N/A    N/A   N/A   N/A   N/A   N/A  
# 76894  siriinferenced   0.0  00:00.19 2   1   30     1200K 0B   1196K 76894 1    sleeping  0[0]  0.00000 0.00000    0   3020   192 98      52      915    209     656  166     7     0.0   0      0      root           N/A    N/A   N/A   N/A   N/A   N/A  
# [2025-09-13 19:28:30] --- Disk Usage ---
# Filesystem       Size   Used  Avail Capacity iused    ifree %iused  Mounted on
# /dev/disk1s1s1  113Gi   14Gi  5.9Gi    71%  502388 61799480    1%   /
# devfs           192Ki  192Ki    0Bi   100%     664        0  100%   /dev
# /dev/disk1s4    113Gi  2.0Gi  5.9Gi    26%       3 61799480    0%   /System/Volumes/VM
# /dev/disk1s2    113Gi  394Mi  5.9Gi     7%    2236 61799480    0%   /System/Volumes/Preboot
# /dev/disk1s6    113Gi  4.7Gi  5.9Gi    45%      52 61799480    0%   /System/Volumes/Update
# /dev/disk1s5    113Gi   84Gi  5.9Gi    94%  865672 61799480    1%   /System/Volumes/Data
# map auto_home     0Bi    0Bi    0Bi   100%       0        0  100%   /System/Volumes/Data/home
# [2025-09-13 19:28:30] --- Important Directory Sizes ---
#   0B	/Users/hemac/Documents
# 1.3M	/Users/hemac/Desktop
# [2025-09-13 19:28:32] --- Top 5 Resource-Intensive Processes ---
# hemac            25992  98.3  0.2 1490746856  14940   ??  R     7:55PM  17:20.23 /Applications/Visual Studio Code.app/Contents/Frameworks/Code Helper.app/Contents/MacOS/Code Helper --type=utility --utility-sub-type=node.mojom.NodeService --lang=en-GB --service-sandbox-type=none --user-data-dir=/Users/hemac/Library/Application Support/Code --standard-schemes=vscode-webview,vscode-file --enable-sandbox --secure-schemes=vscode-webview,vscode-file --cors-schemes=vscode-webview,vscode-file --fetch-schemes=vscode-webview,vscode-file --service-worker-schemes=vscode-webview --code-cache-schemes=vscode-webview,vscode-file --shared-files --field-trial-handle=1718379636,r,17399426750700218259,3868434391746150187,262144 --enable-features=DocumentPolicyIncludeJSCallStacksInCrashReports,EarlyEstablishGpuChannel,EstablishGpuChannelAsync --disable-features=CalculateNativeWinOcclusion,FontationsLinuxSystemFonts,MacWebContentsOcclusion,ScreenAIOCREnabled,SpareRendererForSitePerProcess --variations-seed-version
# _windowserver      169  11.1  0.5 35980600  39056   ??  Ss   19Jul25 151:55.44 /System/Library/PrivateFrameworks/SkyLight.framework/Resources/WindowServer -daemon
# USER               PID  %CPU %MEM      VSZ    RSS   TT  STAT STARTED      TIME COMMAND
# root               170   9.0  0.1 33699556   9092   ??  Ss   19Jul25   6:49.86 /System/Library/PrivateFrameworks/TCC.framework/Support/tccd system
# hemac            11077   8.9  0.1 33699796   7464   ??  U    27Aug25   0:25.88 /System/Library/PrivateFrameworks/TCC.framework/Support/tccd
# hemac            11108   6.3  0.1 33693784   7336   ??  S    27Aug25   0:08.78 /System/Library/PrivateFrameworks/CloudDocsDaemon.framework/Versions/A/Support/bird



