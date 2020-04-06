# Jenkins installation with Ansible in EC2

```
apt-get update
apt install ansible
cd /etc/ansible
mkdir roles
cd roles
ansible-galaxy install -p . geerlingguy.jenkins
ansible-galaxy install -p . geerlingguy.java
cd ..
cat <<'EOF' >>  create_jenkins.yml
- name: Install Jenkins
  become: yes
  hosts: localhost
  
  vars:
    jenkins_hostname: jenkins.example.com
    java_packages:
      - openjdk-8-jdk

  roles:
    - role: geerlingguy.java
    - role: geerlingguy.jenkins
EOF
ansible-playbook create_jenkins.yml

```