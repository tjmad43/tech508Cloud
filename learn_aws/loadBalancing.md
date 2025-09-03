# Load Balancing

Load balancers are servers that forward internet traffic to multiple servers (EC2 instances) downstream.

### Why use a load balancer?
- spread load across multiple downstream instances
- expose a single point of access (DNS) to your application
- seamlessly handle failures of downstream instances
- do regular health checks to instances
- provide SSL termination (HTTPS) for websites
- high availability across zones

### Why use an Elastic Load Balancer?
- an ELB (Elastic Load Balancer) is a managed load balancer
  - AWS guarantees that it will be working
  - AWS takes care of upgrades, maintenance, high availability
  - AWS provides only a few configuration knobs
- costs less to setup your own load balancer but a lot more effort (maintanance, integrations)
- 4 kinds of load balancers offered by AWS:
  - Application Load Balancer (HTTP/HTTPS only) - Layer 7
  - Network Load Balancer (ultra-high performance, allows for TCP) - Layer 4
  - Gateway Load Balancer - Layer 3
  - Classic Load Balancer (retired in 2023) - Layer 4 & 7

### Application Load Balancer
- HTTP / HTTPS / gRPC protocols (Layer 7)
- HTTP Routing features
- Static DNS (URL)

### Network Load Balancer
- TCP / UDP protocols (Layer 4)
- High Performance: millions of requests per second
- Static IP through elastic IP

### Gateway Load Balancer
- GENEVE Protocol on IP Packets (Layer 3)
- Route Traffic to Firewalls that you manage on EC2 Instances
- Intrusion detections