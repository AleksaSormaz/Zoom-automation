#!/bin/bash

# Function to send a message in Zoom chat
send_message() {
    # Get the window ID of the Zoom meeting window
    zoom_window_id=$(xdotool search --onlyvisible --class "zoom" | head -n 1)

    if [ -n "$zoom_window_id" ]; then
        # Get the ID of the currently active window
        active_window_id=$(xdotool getactivewindow)

        # Check if the Zoom window is active
        if [ "$zoom_window_id" == "$active_window_id" ]; then
            # Type your predefined message
            xdotool type "Your custom message here"
        
            # Press Enter to send the message
            xdotool key Return
        else
            echo "Zoom window is not active"
        fi
    else
        echo "Zoom window not found"
    fi
}

# Function to join a Zoom meeting
join_meeting() {
    # Command to join your Zoom meeting (change the path as needed)
    /snap/bin/zoom-client zoommtg://zoom.us/join?uri="Your Zoom Meeting URL"
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
