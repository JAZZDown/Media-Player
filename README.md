# MediaPlayerApp

A simple multimedia playback application combining **Swift** and **Python Flask**.  
This project demonstrates media playback in iOS using **AVFoundation** for video streaming and **Flask** to serve the media file and metadata.

## Features
- Media playback using `AVPlayer` in Swift.
- Fetching metadata from a Python Flask server.
- Flask server serves a sample media file (`sample.mp4`).

## Directory Structure
```
MediaPlayerApp/
├── MediaPlayerApp/          # Swift app files
│   ├── AppDelegate.swift
│   ├── ViewController.swift
│   ├── Main.storyboard
│   ├── Info.plist
├── python_server/           # Python Flask server files
│   ├── server.py
│   ├── requirements.txt
│   ├── media/               # Media directory
│       ├── sample.mp4       # Placeholder media file
```

## Prerequisites
- **Swift:** Xcode installed on macOS.
- **Python:** Version 3.7+ with `pip` installed.

## Setup Instructions

### Python Server
1. Navigate to the `python_server` directory:
   ```bash
   cd python_server
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the server:
   ```bash
   python server.py
   ```
   The server will be available at `http://127.0.0.1:5000`.

### Swift Application
1. Open the `MediaPlayerApp.xcodeproj` file in Xcode.
2. Ensure the Flask server is running.
3. Run the app on a simulator or physical device.

## Flask Endpoints
- **Media Endpoint:** Serves the media file.
  - URL: `/media`
  - Method: `GET`
- **Metadata Endpoint:** Serves metadata about the media.
  - URL: `/metadata`
  - Method: `GET`
  - Example Response:
    ```json
    {
      "title": "Sample Video",
      "duration": "2 minutes",
      "format": "mp4"
    }
    ```

## Notes
- Replace the `sample.mp4` placeholder file in `python_server/media/` with an actual video file.
- Ensure both the Flask server and iOS simulator/device are on the same network for proper communication.

## License
This project is licensed under the MIT License.
