#!/bin/bash

echo "Deleting /public, /adm, /ven, and /sec Directories..."

rm -rf /publico /adm /ven /sec # Delete all the directories in one command.

echo "Deleting GRP_ADM, GRP_VEN, and GRP_SEC Groups..."

groupdel GRP_ADM #Delete a group
groupdel GRP_VEN
groupdel GRP_SEC

echo "Deleting users..."

echo "Deleting GRP_ADM members..."

userdel -r -f carlos
userdel -r -f maria
userdel -r -f joao

echo "Deleting GRP_VEN members..."

userdel -r -f debora
userdel -r -f sebastiana
userdel -r -f roberto

echo "Deleting GRP_SEC members..."

userdel -r -f josefina
userdel -r -f amanda
userdel -r -f rogerio

echo "All done!"
