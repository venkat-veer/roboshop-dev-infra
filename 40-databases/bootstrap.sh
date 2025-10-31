dnf install ansible -y
ansible-pull -U https://github.com/venkat-veer/ansible-roboshop-roles-tf.git -e component=mongodb main.yml
