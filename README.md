# Bash-Weather-App

## Author: Brendan Dileo
### Version: v0.1

## Description

The purpose of this Bash script is to retrieve the current weather data and display it for the current location's weather using the OpenWeatherMap API. The script fetches the user's location based on their IP address via the [ipinfo API](https://ipinfo.io), and then retrieves weather information like temperature and condition.

## Features

- Retrieves weather data based on your current location (using IP address).
- Displays weather information with corresponding icons for conditions (sunny, rainy, snowy, etc.).
- Uses OpenWeatherMap API for weather data.
- Provides temperature in Celsius with appropriate icons for temperature range.

## Prerequisites

- **Bash**: Make sure you have a working Bash shell (Linux/macOS should work out of the box).
- **jq**: A lightweight and flexible command-line JSON processor. Install it with:

  ```bash
  sudo apt-get install jq  # For Ubuntu/Debian
  brew install jq          # For macOS with Homebrew
  # Setup

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/yourusername/Bash-Weather-App.git
    cd Bash-Weather-App
    ```

2. Open the script `weather.sh` and replace the placeholder `enter_openweathermap_api_key` with your actual OpenWeatherMap API key:

    ```bash
    API_KEY="your_openweathermap_api_key" # Replace with your own API key
    ```

## Usage

1. Make the script executable:

    ```bash
    chmod +x weather.sh
    ```

2. Run the script:

    ```bash
    ./weather.sh
    ```

The script will fetch the weather for your current location using your IP address and display the current temperature and weather conditions, including icons.

## Example Output

Here is an example of the output you can expect when running the script:

```bash
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Weather Script - Version 0.1
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Weather for London 🏙️
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Temperature: 12 °C 🌤️
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Condition: clear sky ☀️
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```
![Weather Checker]()


  
