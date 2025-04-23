#!/bin/bash

echo "Creating /public, /adm, /ven, and /sec Directories..."

mkdir /publico /adm /ven /sec # Create all the required directories in one command.

echo "Creating GRP_ADM, GRP_VEN, and GRP_SEC Groups..."

groupadd GRP_ADM #Crete group
groupadd GRP_VEN
groupadd GRP_SEC

echo "Creating users..."

echo "Creating GRP_ADM members..."
echo "Adding them to their group..."

# Create a user with a comment (-c), a shell (-s), a home directory (-m), a group (-G) and a password (-p)
useradd carlos -c "GRP_ADM member" -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -1 pass123)
passwd carlos -e # Forces the user to change the password at first login.

useradd maria -c "GRP_ADM member" -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -1 pass123)
passwd maria -e

useradd joao -c "GRP_ADM member" -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -1 pass123)
passwd joao -e

echo "Creating GRP_VEN members..."
echo "Adding them to their group..."

useradd debora -c "GRP_VEN member" -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -1 pass123)
passwd debora -e

useradd sebastiana -c "GRP_VEN member" -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -1 pass123)
passwd sebastiana -e

useradd roberto -c "GRP_VEN member" -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -1 pass123)
passwd roberto -e

echo "Creating GRP_SEC members..."
echo "Adding them to their group..."

useradd josefina -c "GRP_SEC member" -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -1 pass123)
passwd josefina -e

useradd amanda -c "GRP_SEC member" -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -1 pass123)
passwd amanda -e

useradd rogerio -c "GRP_SEC member" -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -1 pass123)
passwd rogerio -e 

echo "Changing the groups of the directories..."

chown root:GRP_ADM /adm # set the owner (root) and the group of the directory
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Changing directories permissions..."

chmod 777 /publico # All the users have permission to rwx in this directory
chmod 770 /adm # The owner (root) and the group members (GRP_ADM) have permission to rwx in this directory. Others can't do anything.
chmod 770 /ven # The owner (root) and the group members (GRP_VEN) have permission to rwx in this directory. Others can't do anything. 
chmod 770 /sec # The owner (root) and the group members (GRP_SEC) have permission to rwx in this directory. Others can't do anything.

echo "All done!"
