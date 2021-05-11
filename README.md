# ZeroToHero
An automated tool used for transforming chromebook into a network pentesting and web-hacking device

# Overview 
Using a collection of bash commands along with the "chromebrew" package management tool, this program is used to provide otherwise standard chromebooks with both Network pentesting and Web-Hacking capabilities. This is done by the installation of serveral "required" tools along with some additional steps that the user will need to take after the setup of the tools!

Then presto you're Done! 

# Usage
`zth.sh` select option presented at menu (1

# Directions (*Post Installation of Tools*)
(!) These instrucctions may vary based on the model of Chromebook you have.(!) 
(!) Activate Linux on your Chromebook if this isn't alrady done(!) 
1. Clone the Harvester git-clone: github.com/;aramies/theHarvester
2. Go to the folder and install requirements: `cd theHarvester && sudo pip3 install -r requirements.txt`
3. Download Burp SUite. Get the jar version and copy to the Linux files folder. 
4. Start Burp Suite and Firefox: `java -jar burpsuite_community_v2020.2.1.jar`
5. In Firefox , go to: `Settings -> Certificates -> Authorities` 
6. In Firefox configure proxy to be `locaclhost:8080` for all protocols 
7. Go to `http://burp`
8. Download CA cert 
9. Install the cert in Firefox as an authority CA. Enable the certificate and Identify websites and mail. 
10. Ready to hack. 
