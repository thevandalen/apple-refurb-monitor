# Apple Refurbished iPhone Monitor

A simple macOS script to monitor Apple's refurbished iPhone page and notify you when specific models become available.

## What it does

- Checks https://www.apple.com/shop/refurbished/iphone every 30 minutes
- Sends a macOS notification when iPhone 13 mini is found
- Opens the page in your browser automatically
- Logs all checks to `~/.refurb-iphone-check.log`

## Setup

1. Copy the script to your home directory:
   ```bash
   cp check-refurb-iphone.sh ~/
   chmod +x ~/check-refurb-iphone.sh
   ```

2. Create the launchd plist at `~/Library/LaunchAgents/com.refurb-iphone-check.plist`:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
       <key>Label</key>
       <string>com.refurb-iphone-check</string>
       <key>ProgramArguments</key>
       <array>
           <string>/Users/YOUR_USERNAME/check-refurb-iphone.sh</string>
       </array>
       <key>StartInterval</key>
       <integer>1800</integer>
       <key>RunAtLoad</key>
       <true/>
   </dict>
   </plist>
   ```

3. Load the agent:
   ```bash
   launchctl load ~/Library/LaunchAgents/com.refurb-iphone-check.plist
   ```

## Usage

```bash
# Run a manual check
~/check-refurb-iphone.sh

# View check history
cat ~/.refurb-iphone-check.log

# Stop monitoring
launchctl unload ~/Library/LaunchAgents/com.refurb-iphone-check.plist

# Resume monitoring
launchctl load ~/Library/LaunchAgents/com.refurb-iphone-check.plist
```

## Customization

Edit `SEARCH_TERM` in the script to monitor for different models (e.g., "14 mini", "SE").
