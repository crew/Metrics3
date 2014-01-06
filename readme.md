### Metrics
This project gathers information about the use of machines in the lab and puts
it into an elasticsearch backend for searching with Kibana.

Currently it only grabs one small information, how many people are logged in.

### How it Works
* On login a (pam.d) script runs pushing over data to the the databse about how many people are logged in etc.
* The database (elasticsearch) then stores this information
* A graphing tool (Kibana) is then used to present this timeseries information.
