#!/bin/bash

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, use sudo sh $0"
    exit 1
fi

clear
echo "========================================================================="
echo "One Key Wordpress Manager for LNMP V0.9 , Written by DY.Feng "
echo "========================================================================="
echo ""

echo "a) Batch Adding Wordpress System"
echo "r) Batch Removing Wordpress System"
echo "e) Export Wordpress System"
echo "i) Import Wordpress System"

read -p "Select :" do_what

if [ $do_what = 'a' ];then

	clear
	echo "========================================================================="
	echo "Batch Adding Wordpress System"
	echo "========================================================================="
	echo ""

	domain_file="domains.txt"

	echo "Please input domain file:" 
	read -p "(Default domain file: domains.txt):" domain_file

	if [ "$domain_file" = "" ]; then
		domain_file="domains.txt"
	fi

	if [ ! -f $domain_file ];then
		echo "Error: file $domain_file do not exist"
		exit 1
	fi

	echo "Please input wordpress folder:"
	read -p "(Default wordpress folder: wordpress):" wordpress_folder

	if [ "$wordpress_folder" = "" ]; then
		wordpress_folder="wordpress"
	fi

	if [ ! -d $wordpress_folder ];then
		echo "Error: wordpress folder $wordpress_folder do not exist"
		exit 1
	fi

	echo "Please input wordpress sql file:"
	read -p "(Default wordpress sql file: datebase.sql):" db_file

	if [ "$db_file" = "" ]; then
		db_file="datebase.sql"
	fi

	if [ ! -f $db_file ];then
		echo "Error: wordpress sql file $db_file do not exist"
		exit 1
	fi
	
	echo "Please input database host"
	read -p "(Default host: localhost):" db_host

	if [ "$db_host" = "" ]; then
		db_host="localhost"
	fi

	echo "Please input database username:"
	read -p "(Default username: root):" db_username

	if [ "$db_username" = "" ]; then
		db_username="root"
	fi

	echo "Please input database password:"
	read -p "(Default password: "root"):" db_password

	if [ "$db_password" = "" ]; then
		db_password="root"
	fi

	mysql -h$db_host -u$db_username -p$db_password -e ";"
	
	if [ $? != 0 ];then 
		echo "Error:MySQL connection failed"
		exit 1
	else
		echo "Test:MySQL connection success"
	fi



	echo ""
	echo "Demains:"
	echo "==========================="


	# domains_ips=(`cat $domain_file`)

	cat $domain_file | awk '$1=$1' | while read domain_ip;do
		domain=`echo $domain_ip | cut -d " " -f 1 |tr '[A-Z]' '[a-z]' `
		ip=`echo $domain_ip | cut -d " " -f 2`
		
		echo -e "$domain\t$ip\c"
		if [ ! -f "/usr/local/nginx/conf/vhost/$domain.conf" ]; then
			echo ""
		else
			echo "(Exist)"
		fi
	done

	echo ""
	echo "Wordpress:"
	echo "==========================="
	echo "Folder:$wordpress_folder"


	echo ""
	echo "Database:"
	echo "==========================="
	echo -e "Sql file:\t$db_file"
	echo -e "Host:\t\t$db_host"
	echo -e "User name:\t$db_username"
	echo -e "Password:\t$db_password"

	echo "==========================="
	echo "The scripts will create the wordpress site.(Existing will be overwritten)(y/n)"

	read create_wordpress
	if [ "$create_wordpress" != 'y' ]; then
		exit 1
	fi

	if [ ! -d /usr/local/nginx/conf/vhost ]; then
		mkdir /usr/local/nginx/conf/vhost
	fi


	cat $domain_file | awk '$1=$1' | while read domain_ip;do

		domain=`echo $domain_ip | cut -d " " -f 1 |tr '[A-Z]' '[a-z]' `
		ip=`echo $domain_ip | cut -d " " -f 2`
		
		
		vhostdir="/home/wwwroot/$domain"
		alf="log_format  $domain  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
				'\$status \$body_bytes_sent "\$http_referer" '
				'"\$http_user_agent" \$http_x_forwarded_for';"
		al="access_log  /home/wwwlogs/$domain.log  $domain;"
		
		echo ""
		echo "==========================================="
		echo -e "$domain\t$ip\t$vhostdir"
		echo "==========================================="
		echo "Create Virtul Host directory......"
		mkdir -p $vhostdir
		
		touch /home/wwwlogs/$domain.log
		
		echo "Copy wordpress stuff......"
		cp -R $wordpress_folder/* $vhostdir/
		
		echo "Setting wordpress configure......"
		sed -i "s/database_name_here/$domain/g" $vhostdir/wp-config.php
		sed -i "s/username_here/$db_username/g" $vhostdir/wp-config.php
		sed -i "s/password_here/$db_password/g" $vhostdir/wp-config.php
		sed -i "s/host_here/$db_host/g" $vhostdir/wp-config.php
		sed -i "s/home_here/http:\/\/$domain/g" $vhostdir/wp-config.php
		sed -i "s/siturl_here/http:\/\/$domain/g" $vhostdir/wp-config.php
		
		echo "Setting permissions of Virtual Host directory......"
		
		chmod -R 755 $vhostdir
		touch $vhostdir/sitemap.xml
		touch $vhostdir/sitemap.xml.gz
		chmod 777 $vhostdir/sitemap.xml
		chmod 777 $vhostdir/sitemap.xml.gz
		chown -R www:www $vhostdir
		
		echo "Importing database ......"
		
		mysql -h$db_host -u$db_username -p$db_password -e "DROP DATABASE IF EXISTS \`$domain\`;"
		if [ $? != 0 ]; then 
			exit 1 
		fi
		mysql -h$db_host -u$db_username -p$db_password -e "CREATE DATABASE \`$domain\`;"
		if [ $? != 0 ]; then 
			exit 1 
		fi
		mysql -h$db_host -u$db_username -p$db_password $domain --default-character-set=utf8 < $db_file
		if [ $? != 0 ]; then 
			exit 1 
		fi
		
		
		cat >/usr/local/nginx/conf/vhost/$domain.conf<<EOF
$alf
server
{
	listen       $ip:80;
	server_name $domain;
	index index.html index.htm index.php default.html default.htm default.php;
	root  $vhostdir;
	
	
	include wordpress.conf;
	location ~ .*\.(php|php5)?$
	{
		try_files \$uri =404;
		fastcgi_pass  unix:/tmp/php-cgi.sock;
		fastcgi_index index.php;
		include fcgi.conf;
	}

	location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$
	{
		expires      30d;
	}

	location ~ .*\.(js|css)?$
	{
		expires      12h;
	}
	
	
	$al
}
EOF
	done

	echo ""
	echo "==========================================="
	echo "Test Nginx configure file........"
	/usr/local/nginx/sbin/nginx -t
	if [ $? != 0 ];then
		exit 1
	else
		echo -e "Restart Nginx....................\c"
		/usr/local/nginx/sbin/nginx -s reload
		if [ $? != 0 ];then
			echo "[FAILE]"
		else
			echo "[OK]"
		fi
	fi
elif [ $do_what = 'r' ];then

	clear
	echo "========================================================================="
	echo "Batch Removing Wordpress System"
	echo ""
	echo "Please input domains:" 
	read -p "(Default domain file: domains.txt):" domains
	echo domains
else
	exit 1
fi


