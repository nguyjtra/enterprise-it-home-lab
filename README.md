# enterprise-it-home-lab
Enterprise IT Home Lab featuring Windows Server 2022 (Active Directory DS), PowerShell Automation, Cisco Packet Tracer (VLANs &amp; ACLs), and Jira Service Management SLA workflows.
# Enterprise IT Support & Network Home Lab

A comprehensive enterprise infrastructure and systems administration lab demonstrating hybrid IT operations: Active Directory administration, PowerShell automation, multi-VLAN routing with firewall ACLs, and IT Service Management (ITSM) workflows.

---

## Architecture & Topology
- **Virtualization & Systems:** Windows Server 2022 running Active Directory Domain Services (AD DS) and Internal DNS.
- **Network Segmentation (Cisco Packet Tracer):**
  - **VLAN 10 (Custody Subnet):** Restricted end-user access.
  - **VLAN 20 (Admin Subnet):** Management and enterprise operations.
  - **VLAN 30 (IT Subnet):** Secure administrative network.
- **Firewall Policies:** 802.1Q Router-on-a-Stick with Extended ACLs preventing unauthorized traffic from VLAN 10 to internal management subnets.
- **ITSM & Ticketing:** Jira Service Management configured with 15-minute SLA targets for critical incident triage.

---

## Key Features & Implementations

### 1. Automated Bulk Provisioning (PowerShell & AD DS)
- Developed `New-ADUsersFromCSV.ps1` to parse employee data, sanitize account attributes, generate standardized `sAMAccountName` identities, assign Organizational Units (OUs), and mandate password changes on initial logon.
- Configured Group Policies, fine-grained access permissions, account unlock procedures, and offboarding workflows.

### 2. Network Infrastructure & Hardening (Cisco CLI)
- Implemented subinterfaces on Cisco 2911 router with 802.1Q encapsulation and dedicated DHCP pools per VLAN.
- Enforced access boundaries via Extended Access Control Lists (ACLs).
- Hardened CLI interfaces using encrypted console passwords and privilege level 15 access controls.

### 3. Incident Management & SLAs (Jira Service Management)
- Triaged and documented simulated Tier 1 and Tier 2 tickets within an enterprise ITSM portal.
- Maintained a 15-minute Critical SLA target for identity and network connectivity issues using diagnostics (`ping`, `traceroute`, `show ip interface brief`).

---

## Repository Structure
```text
├── README.md                          # Comprehensive project documentation
├── docs/                              # Architecture diagrams and system screenshots
├── scripts/
│   ├── New-ADUsersFromCSV.ps1         # Bulk user provisioning script
│   └── users_template.csv             # Sanitized mock dataset
└── configs/
    ├── Router2911_running_config.txt  # Cisco 2911 routing & ACL configurations
    └── Switch2960_vlan_config.txt     # Switch VLAN & trunking setup
