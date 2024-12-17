# Crono - Simple Stopwatch

**Crono** is a minimalistic stopwatch web application that can be accessed through any web browser.

This application is hosted at:
[**crono.sachiel.diegogliarte.com**](http://crono.sachiel.diegogliarte.com)

---

## Features
- **Start/Pause** the stopwatch by clicking anywhere on the screen.
- **Reset** the stopwatch by holding the mouse button.
- **Fullscreen Mode**: Double-click anywhere to toggle fullscreen.

---

## Prerequisites
- **Python 3** installed on your system.
- **Systemd** (for Linux) to manage the service.

---

## Recommended Setup
To easily run the service locally, use the `setup.sh` script:

1. **Run the setup script**:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

2. **Access Crono Locally**:
   Open your browser and go to:
   ```
   http://localhost:1995
   ```

3. **Start/Stop the service manually**:
   - Start the service: `sudo systemctl start crono`
   - Stop the service: `sudo systemctl stop crono`
   - View status: `sudo systemctl status crono`

---

## Uninstall
To remove the service:
```bash
sudo systemctl stop crono
sudo systemctl disable crono
sudo rm /etc/systemd/system/crono.service
sudo systemctl daemon-reload
```
