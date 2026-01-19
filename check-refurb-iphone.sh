#!/bin/bash
# Monitor Apple Refurbished iPhone page for iPhone 13 mini

URL="https://www.apple.com/shop/refurbished/iphone"
SEARCH_TERM="13 mini"
LOG_FILE="$HOME/.refurb-iphone-check.log"

# Fetch the page and search for iPhone 13 mini
content=$(curl -s "$URL")

if echo "$content" | grep -qi "$SEARCH_TERM"; then
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] FOUND: iPhone 13 mini available!" >> "$LOG_FILE"

    # macOS dialog box (more reliable than notification center)
    response=$(osascript <<'APPLESCRIPT'
display dialog "iPhone 13 mini is now available on Apple Refurbished!" with title "iPhone Alert" buttons {"Open Page", "OK"} default button "Open Page"
APPLESCRIPT
)

    # Open page if user clicked "Open Page" or automatically
    open "$URL"

    echo "FOUND: iPhone 13 mini is available!"
else
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] Not found" >> "$LOG_FILE"
    echo "Not found at $timestamp"
fi
