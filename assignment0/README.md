Phase1: Create basis Linux VM and install Terraform utility. 
1.            Create another Linux VM/windows VM using TF script  
2.            Attach first standard storage disk of t10 GB
3.            Open Ports for 22 & 80 using TF {ingress & egress}

Phase2: Incremental activity in phase 1.
1.            Attach second disk of 8 GB
2.            Open another port 3306 egress 

Phase3: Incremental in above both phases
1.	      Increase the second standard storage disk from 8 GB to 9 GB.

Phase 4: Optional {good if u can do it} 
	     On the same server install apache via Terraform and update /var/www/html with ‘hello world’ page via Ansible.

