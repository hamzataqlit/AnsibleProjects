[servers]
%{ for ip in servers ~}
${ip}
%{ endfor ~}
ansible_ssh_private_key_file=\TR-key.pem
ansible_user=ubuntu