# MOLsploit
Metasploit Outside Lan

MOLsploit is a bash script that allows you to use Metasploit outside the LAN using Localtunnel (alternative NGrok). It checks if Metasploit and Localtunnel are installed and prompts the user for requirements. It then creates a payload with the Localtunnel hostname and port as the LHOST and LPORT respectively, and starts Metasploit with a listener.

## Requirements

- Metasploit Framework
- Localtunnel (alternative ngrok)
- Bash
- Node.js (for Localtunnel)

## Installation

1. Clone the repository: `git clone https://github.com/yourusername/MOLsploit.git`
2. Change directory: `cd MOLsploit 
3. Make the script executable: `chmod +x MOLsploit.sh`

## Usage

1. Run the script: `./MOLsploit.sh`
2. Follow the prompts to enter the payload type, Localtunnel port, and Metasploit listener port.
3. Wait for the payload to be created and Metasploit to start.
4. Run the payload on the target machine and wait for the connection to be established.

## Disclaimer

Using Metasploit outside the LAN may be illegal and unethical if done without permission. It is important to use these tools responsibly and ethically. The author of this script is not responsible for any misuse or damage caused by this script.

## License

This script is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributions

Contributions are welcome! If you find a bug or have a feature request, please open an issue or submit a pull request.
