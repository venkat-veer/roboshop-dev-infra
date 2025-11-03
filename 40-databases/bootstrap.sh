
component=$1
dnf install ansible -y
ansible-pull -U https://github.com/venkat-veer/ansible-roboshop-roles-tf.git -e component=$component main.yml

# git clone ansible-playbook
# cd ansible-playbook
# ansible-playbook -i inventory main.yml