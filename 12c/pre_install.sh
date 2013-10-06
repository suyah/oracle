ver=$1
if
pver=11.2.0
else
pver=12.1.0

#Refer to GI Installation Guide E17888-10, 6.1.11 Example of Creating Role-allocated Groups,Users and Paths
#Create users
groupadd -g 54321 oinstall
groupadd -g 54322 dba
groupadd -g 54327 asmdba
groupadd -g 54329 asmadmin

useradd -u 54321 -g oinstall -G dba,asmdba oracle
useradd -u 54322 -g oinstall -G asmadmin,asmdba grid

#Create directories
mkdir -p /u01/app/grid
mkdir -p /u01/app/$pver/grid
mkdir -p /u01/app/oracle
chown -R grid:oinstall /u01
chown oracle:oinstall /u01/app/oracle
chmod -R 775 /u01
