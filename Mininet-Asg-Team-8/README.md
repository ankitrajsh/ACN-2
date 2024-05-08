# Mininet Assignment : BGP Path Hijacking

The purpose of this Mininet assignment is to learn about Border Gateway Protocol (BGP) and how it can be used to hijack a network.

## Aim :

* To build a simple custom topology consisting of some routers and hosts.
* To un a simple web server on a host and send GET requests to it from a host belonging to some other network domain.
* To nalyse the role of BGP and Forwarding tables of various routers in forwarding the GET requests and responses to the appropriate hosts.
* To demonstrate a hijack on the network of the client server and redirect all the GET requests its network towards a rogue network.

## Features of the Topology:

The topology contains:

* Four routers R1, R2, R3 and R4 in a bus topology fasion.
* Router R1 is connected to three hosts h1-1, h1-2, h1-3 and two routers R2 and R4.
* Router R2 is connected to three hosts h2-1, h2-2, h2-3 and two routers R1 and R3.
* Router R3 is connected to three hosts h3-1, h3-2, h3-3 and one routers R2.
* Router R4 is connected to three hosts h4-1, h4-2, h4-3 and one routers R1.

## Execution Steps :

Execute the following commands:

1. Enter the BGP Folder by running the below command in a terminal.
```bash
cd bgp
```

2. Create the topology by running the below command in the terminal.
```bash
sudo python bgp.py
```

3. Ping h3-1
* Login into h1-1 by running the below command in the mininet topology terminal.
```bash
xterm h1-1
```
* Ping h3-1 by running the below command in the h1-1 node terminal.
```bash
ping 13.0.1.1 -c 10
```

4. Check contents of BGP Table of routers R1 and R2
* Login into the router R1 by running the below command in a new terminal.
```bash
cd bgp
sudo python run.py --node R1 --cmd "telnet localhost bgpd"
en
```
* Display the BGP Table by running the below command in the terminal.
```bash
sh ip bgp
```
* Login into the router R2 by running the below command in a new terminal.
```bash
cd bgp
sudo python run.py --node R2 --cmd "telnet localhost bgpd"
en
```
* Display the BGP Table by running the below command in the terminal.
```bash
sh ip bgp
```

5. Check contents of Forwarding Table of routers R1 and R2
* Login into the router R1 by running the below command in the mininet topology terminal.
```bash
xterm R1
```
* Display the BGP Table by running the below command in the R1 node terminal.
```bash
route -n
```
* Login into the router R2 by running the below command in the mininet topology terminal.
```bash
xterm R2
```
* Display the BGP Table by running the below command in the R2 node terminal.
```bash
route -n
```

6. Start sending GET requests from h1-1 to h3-1 by running the below command in a new terminal.
```bash
cd bgp
./website.sh
```

7. Start sending GET requests from h2-3 to h3-1 by running the below command in a new terminal.
```bash
cd bgp
./website2.sh
```

8. Launch the rogue attack on complete AS3 network by running the below command in a new terminal.
```bash
cd bgp
./start_rogue.sh
```

9. Stop the rogue attack on complete AS3 network by running the below command in the terminal.
```bash
./stop_rogue.sh
```

10. Launch the rogue attack only on h3-1 in AS3 network by running the below command in a new terminal.
```bash
cd bgp
./start_rogue2.sh
```

11. Stop the rogue attack only on h3-1 in AS3 network by running the below command in the terminal.
```bash
./stop_rogue2.sh
```