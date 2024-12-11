#!/bin/bash

# Variables
SERVICE_NAME="crono"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"
PROJECT_DIR="$(pwd)"
PYTHON_PATH="/usr/bin/python3"
PORT=1995

# Ensure the project directory exists
if [ ! -d "$PROJECT_DIR" ]; then
  echo "Creating project directory: $PROJECT_DIR"
  mkdir -p "$PROJECT_DIR"
fi

# Move the HTML file to the project directory
if [ ! -f "$PROJECT_DIR/index.html" ]; then
  echo "Moving index.html to $PROJECT_DIR"
  mv index.html "$PROJECT_DIR/"
else
  echo "index.html already exists in $PROJECT_DIR"
fi

# Create the service file
if [ ! -f "$SERVICE_FILE" ]; then
  echo "Creating service file at $SERVICE_FILE"
  sudo bash -c "cat > $SERVICE_FILE" <<EOL
[Unit]
Description=Crono Web Server
After=network.target

[Service]
User=pi
WorkingDirectory=$PROJECT_DIR
ExecStart=$PYTHON_PATH -m http.server $PORT
Restart=always

[Install]
WantedBy=multi-user.target
EOL
else
  echo "Service file already exists: $SERVICE_FILE"
fi

# Reload systemd, enable and start the service
echo "Reloading systemd and enabling the service"
sudo systemctl daemon-reload
sudo systemctl enable ${SERVICE_NAME}.service
sudo systemctl start ${SERVICE_NAME}.service

# Display service status
echo "Service status:"
sudo systemctl status ${SERVICE_NAME}.service
