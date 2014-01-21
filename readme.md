### Metrics
This project gathers information about the use of machines in the lab and puts
it into an elasticsearch backend for searching with Kibana.

This allows us to get beautiful graphs of all of our usage for the machines in the lab.
<3 Graphs
<3 Data

Currently it only grabs one small information, how many people are logged in.
In future this script could be expaned to cover other information that we want graphed.

### How it Works (Use)
* On login a (pam.d) script runs pushing over data to the the databse about how many people are logged in.
* The database (elasticsearch) then stores this information
* A graphing tool (Kibana) is then used to present this timeseries information.


### Deployment

#### Client
The pam.d script and pam.d config line are pushed out using the config managment tool
for the lab machines

#### Server
The Server is set up using the self contained ansible script (Not Written Yet)
