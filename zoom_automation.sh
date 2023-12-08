#!/bin/bash

# Function to send a message in Zoom chat
send_message() {
    # Get the window ID of the Zoom meeting window
    zoom_window_id=$(xdotool search --onlyvisible --class "zoom" | head -n 1)

    if [ -n "$zoom_window_id" ]; then
        # Focus on the Zoom window
        xdotool windowactivate --sync "$zoom_window_id"
        
        # Wait for a few seconds to ensure the window is focused
        sleep 2
        
        # Type your predefined message
        xdotool type "Your predefined message here"
        
        # Press Enter to send the message
        xdotool key Return
    else
        echo "Zoom window not found"
    fi
}

# Function to join a Zoom meeting
join_meeting() {
    # Replace this command with the command to join your Zoom meeting
    # For example:
    # /path/to/zoom --url=YOUR_ZOOM_MEETING_URL
    # You'll need to replace "/path/to/zoom" and "YOUR_ZOOM_MEETING_URL" with your actual Zoom executable path and meeting URL.
    echo "Command to join the Zoom meeting goes here"
}

# Specify the target date (format: YYYYMMDD)
target_date="20231231"  # Change this to your desired date

# Specify the target time (format: HHMM, 24-hour format)
target_time="1200"  # Change this to your desired time (e.g., 12:00 PM)

# Get the current date and time
current_date=$(date +"%Y%m%d")
current_time=$(date +"%H%M")

# Check if it's the target date and time
if [ "$current_date" == "$target_date" ] && [ "$current_time" == "$target_time" ]; then
    # Call the function to join the meeting
    join_meeting
    
    # Wait for some time to let the meeting window load (adjust as needed)
    sleep 30
    
    # Call the function to send a message in the Zoom chat
    send_message
else
    echo "Today is not the target date and time. Exiting..."
fi
