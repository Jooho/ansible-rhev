# ansible-rhev
ansible rhev playbook

# Network Topology 
          +----------------+
          | Ansible Master |
          +-------+--------+        ---+------------+------------+---- Service network
                  |                    |            |            |
     ------+------+----+---------+-----|------+-----|------+-----|---- Ansible network (DHCP)
           |           |         |     |      |     |      |     |
      +----+---+  +----+----+  +-+-----+-+  +-+-----+-+  +-+-----+-+
      | RHEV-M |  | Storage |  | Hyper 1 |  | Hyper 2 |  | Hyper 3 |  <== VM supporting 'nested KVM'
      +----+---+  +----+----+  +-+--+--+-+  +-+--+--+-+  +-+--+--+-+
          |            |         |  |  |      |  |  |      |  |  |
          |            |         |  |  +------|--|--+------|--|--+---- Migration network
          |            |         |  |         |  |         |  |
       ---+------------|---------|--+---------|--+---------|--+------- Management network
                       |         |            |            |
                    ---+---------+------------+------------+---------- Storage network 
