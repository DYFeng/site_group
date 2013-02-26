#!/bin/bash


######################################################################
########## UI Printer Function #######################################  
######################################################################

 
screen_width="`stty size|cut -d ' ' -f 2`"
sites_path="/home/wwwroot/sites/"
db_path="/usr/local/mysql/var/"
local_ip=`/sbin/ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | cut -d : -f2 | awk '{print $1}' | head -n 1`
END="\e[0m"
BF="\033[41;37;5m"
R="\033[31m"

function print_error {
    echo -e "${WBF}ERROR$END ${R}$1$END"
}



#print a single line
function print_line {
    for (( i=0;i<screen_width;i++));do
	    echo -e "=\c"
    done
    echo ""
}

function print_subtitle {
    echo -e "\033[1;32;40m\n$1"
    print_line
    echo -e "\033[0m"
}


function print_mysql_info {
    print_subtitle "Database"
    echo -e "Host:\t\t$db_host"
    echo -e "User name:\t$db_username"
    echo -e "Password:\t$db_password"
}



#tell me success or not
function print_success {
    is_success=$?
    echo -e "\033[1;33;40m"
    print_line

    if [ $is_success != 0 ]; then
        echo "Something went WRONG!! $1 *FAILURE*!"
    else
        echo "Everything is Fine! $1 Success! "
    fi
    print_line
    echo -e "\e[0m"
    
}


#example begin
#Create the wordpress...............................................
#example end
function print_job {
    local len=0
    len=${#1}
    echo -e "$1\c"
    for (( i=len;i<=screen_width-10;i++ ));do
	    echo -e ".\c"
    done
}

#example begin
#......   [DONE]
#......   [FAILE]
#example end
#exit when faile
function print_done {
    if [ $? = 0 ];then
	    echo -e "[\033[1mDONE\e[0m]"
    else
	    echo -e "[\033[31;1mFAILE\e[0m]"
	    exit 1
    fi
}



function print_title {
    clear
    echo -e "\033[1;33;40m"
    print_line
    echo "$1"
    print_line
    echo -e "\e[0m"
    
}
 
######################################################################
########## Utils Function ############################################  
######################################################################



#strip file with line feeds of Windows
function strip_file {
    tmp_file="`mktemp /tmp/super_site.XXXXXX`"
    sed -i 's/^ *//;s/ *$//' $1
    sed -i 's/
//g' $1
    sed -i '/^$/d' $1
    awk '$1=$1' $1  1> $tmp_file
    mv $tmp_file $1
}

#convert all the characters of file to lower
function to_lower {
    sed -i 's/[A-Z]/\l&/g' $1
}

function check_file_exist {
    if [ ! -f $1 ];then
	    echo "Error: file $1 do not exist"
	    exit 1
	fi
}

function check_directory_exist {
    if [ ! -d $1 ];then
        echo "Error: folder $1 do not exist"    
	    exit 1
	fi

}




######################################################################
########## Mysql Function ############################################  
######################################################################


#global variable
db_host=""
db_username=""
db_password=""

db_exclude_file="(mysql|phpmyadmin|performance_schema)"
#do the mysql query,exit when meet a fail query
#$1 query SQL
#$2 using database name
function mysql_query {
    mysql -h$db_host -u$db_username -p$db_password $2 -e "$1" 
    if [ $? != 0 ];then 
	    echo "Info:Databse $2"
	    echo "Info:SQL $1"
	    exit 1
    fi
}

function stop_mysql {
    print_job "Stop the Mysql Server"
    /etc/init.d/mysql stop
    print_done
    killall mysqld
}

function start_mysql {
    print_job "Start the Mysql Server"
    /etc/init.d/mysql start
    print_done
}

function restart_mysql {
    print_job "Restart the Mysql Server"
    /etc/init.d/mysql restart
    print_done
}

######################################################################
########## Nginx Function ############################################  
######################################################################

function restart_nginx {
	print_job "Test Nginx Configure"
	/usr/local/nginx/sbin/nginx -t
	print_done

	print_job "Restart Nginx"
	/usr/local/nginx/sbin/nginx -s reload
	print_done
}

function test_nginx {
	print_job "Test Nginx configure file"
	/usr/local/nginx/sbin/nginx -t
	print_done
}
	        
	        
	        
######################################################################
########## User input method #########################################  
######################################################################


#interactive read variable,with default value
#$1 var
#$2 default
#$3 var_name
function read_var {
    echo -e "Please input \033[1m$3\e[0m"
    read -p "(Default $3: $2):" $1
    eval var=\$$1
    if [ "$var" = "" ];then
    	eval $1=$2
    fi
}

#interactive read variable
#$1 var
#$2 var_name
function read_var1 {    
    while [ 1 ];do
        read -p "Please input $2:" $1
        eval var=\$$1
        [ "$var" != "" ] && break
    done
}

#do the interactive mysql information input
#store in vars db_host db_username db_password
function setup_mysql {
    read_var db_host "127.0.0.1" "database host"
    read_var db_username "root" "database username"
    read_var db_password "root" "database password"
    mysql_query ";"
}


#make a confirmation
#$1 confirm message
#$2 confirm word,default is "YES"
#return 0 when pass
function confirm {
    if [ "$2" = "" ];then
	    w="YES"
    else
	    w="$2"
    fi
    local confirm_word
    echo -e "\033[41;37;1m$1\e[0m"
    echo -e "(type \033[1m$w\e[0m to confirm):\033[1m\c"
    read  confirm_word
    echo -e "\e[0m"
    if [ "$confirm_word" = "YES" ];then
	    return 0
    else
	    return 1
    fi
}

#make a confirmation,exit when fail
#$1 confirm message
#$2 confirm word,default is "YES"
function confirm_or_exit {
    confirm "$1" "$2"
    if [ $? -ne 0 ];then
	    echo -e "\033[1;31;40mUnexpect input,program exit.\033[0m"
	    exit 1
    fi
}

function press_enter_to_continue {
    echo "$1"
    read -n1
}

######################################################################
########## HTTP Post/Get Function ####################################
######################################################################

function create_session {
    eval $1="`mktemp /tmp/http_session.XXXXXX`"
}

function destory_session {
    if [ -f $1 ];then
        rm -rf $1
    fi
}

#$1 session
#$2 url
#$3 data
#$4 curl argument
function http_post {
#     if [ ! -f $1 ];then
#         return 1
#     fi
	
    curl $4 --url $2 -d $3 -b $1 -c $1
}

#$1 session
#$2 url
#$3 curl argument
function http_get {
#     if [ ! -f $1 ];then
#         return 1
#     fi
    curl $3 --url $2 -b $1 -c $1
}

# create_session session
# 
# http_post $session "http://127.0.0.1/wordpress/wp-login.php" "log=admin&pwd=111111&wp-submit=Log+In&redirect_to=http%3A%2F%2Flocalhost%2Fwordpress%2Fwp-admin%2F&testcookie=1" -sf
# echo $?
# http_get $session "http://127.0.0.1/wordpress/wp-admin/options-general.php?page=google-sitemap-generator%2Fsitemap.php&sm_wpv=3.4.1&sm_pv=3.2.6&sm_rebuild=true&noheader=true&_wpnonce=bb0e69b304" -sf
# 
# destory_session $session
# 
# exit 1

######################################################################
########## Main Process ##############################################  
######################################################################

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, use sh $0"
    exit 1
fi




while [ 1 ];do

    print_title "One Key Wordpress Manager for LNMP V0.9 , Written by DY.Feng "
    echo "1) Super God Mode - Clear All Sites"
    echo "2) Super God Mode - Batch Create Wordpress Sites"
    echo "3) Super God Mode - Export All Wordpress Sites"
    echo "4) Super God Mode - Import All Wordpress Sites"
    echo "5) Super God Mode - Build All Wordpress Sitemap"
    echo "6) Super God Mode - Run All Stripts"
    echo "a) Batch Adding Wordpress System"
    echo "r) Batch Removing Wordpress System"
    echo "t) Batch Replace the Wordpress Content"
    echo "k) Batch Adding Content to Wordpress File" 
    echo "p) Batch Copying Script and Run"
    echo "q) Exit Wordpress Manager"
    
    read -p "Select:" do_what 
    [ "$do_what" = "" ] && continue
    [ "$do_what" = "q" ] && exit 1

    case "$do_what" in
        "1")
        
			title="Super God Mode - Clear All Sites"
	        print_title "$title"

            press_enter_to_continue "Press any key to see all the domains on this server"
            
            print_subtitle "Domains"            
            ls -1 $sites_path

	        confirm_or_exit "The scripts will remove all the wordpress site."

            stop_mysql
  
            print_job "Delete all the wordpress files"
            rm -rfv $sites_path/*
            print_done
            
            ls -l $db_path|grep ^d|awk '$1=$1' -|cut -d " " -f 9|grep -Ev "$db_exclude_file" |while read mysql_file
            do
               print_job "Delete database:$mysql_file"
               rm -rfv $db_path/$mysql_file
               print_done
            done 


            print_job "Delete all the domains configure files"
            rm -rfv /usr/local/nginx/conf/vhost/*
            print_done
            
            start_mysql

            restart_nginx
            
            print_success "$title" 
            ;;

		"2" )
			title="Super God Mode - Batch Create Wordpress Sites"
	        print_title "$title"
	        
	        read_var domain_file "domains.txt" "domains file" 
	        
	        check_file_exist "$domain_file"


	        strip_file "$domain_file" 
	        to_lower "$domain_file"
	        
	        read_var wordpress_folder "wordpress" "wordpress folder"

	        check_directory_exist "$wordpress_folder"
	        

	        read_var db_file "datebase.sql" "wordpress sql file"

	        check_file_exist "$db_file"
	        
	        setup_mysql

	        print_subtitle "Domains"

	        cat $domain_file | while read domain_ip;do
	            domain=`echo $domain_ip | cut -d " " -f 1`
	            ip="$local_ip"

	            echo -e "$domain\t$ip\c"
	            if [ ! -f "/usr/local/nginx/conf/vhost/${domain#*.}.conf" ] || [ ! -d "$sites_path/${domain#*.}/${domain%%.*}" ]; then
			        echo ""
	            else
			        echo "(Exist)"
	            fi

	        done

	        [ $? -ne 0 ] && exit

	        print_subtitle "Wordpress:"
	        echo "Folder:$wordpress_folder"

	        print_mysql_info
	        echo -e "Sql file:\t$db_file"


	        confirm_or_exit "The scripts will create the wordpress site.Existing will be overwritten."

	        if [ ! -d /usr/local/nginx/conf/vhost ]; then
	            mkdir /usr/local/nginx/conf/vhost
	        fi

	        cat $domain_file |  while read domain_ip;do

	            domain=`echo $domain_ip | cut -d " " -f 1`
	            ip="$local_ip"

	            subdomain="${domain%%.*}"
	            domain="${domain#*.}"
	            wholedomain="$subdomain.$domain"
	            vhostdir="$sites_path/$domain/$subdomain"
	            alf="log_format  $domain  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
				'\$status \$body_bytes_sent "\$http_referer" '
				'"\$http_user_agent" \$http_x_forwarded_for';"
	            al="access_log  /home/wwwlogs/$domain.log  $domain;"
 	            
	            print_subtitle "$wholedomain\t$ip\t$vhostdir"

	            print_job "Create Virtul Host directory"
	            mkdir -p $vhostdir
	            touch /home/wwwlogs/$domain.log
	            print_done	    
	            
	            print_job "Copy wordpress stuff......"
	            cp -R $wordpress_folder/* $vhostdir/
	            print_done
	            print_job "Setting wordpress configure......"
	            sed -i "s/database_name_here/$wholedomain/g" $vhostdir/wp-config.php
	            sed -i "s/username_here/$db_username/g" $vhostdir/wp-config.php
	            sed -i "s/password_here/$db_password/g" $vhostdir/wp-config.php
	            sed -i "s/host_here/$db_host/g" $vhostdir/wp-config.php
	            sed -i "s/home_here/http:\/\/$wholedomain/g" $vhostdir/wp-config.php
	            sed -i "s/siteurl_here/http:\/\/$wholedomain/g" $vhostdir/wp-config.php
	            print_done

	            print_job "Setting permissions of Virtual Host directory......"
	            
	            chmod -R 755 $vhostdir
	            touch $vhostdir/sitemap.xml
	            touch $vhostdir/sitemap.xml.gz
	            chmod 777 $vhostdir/sitemap.xml
	            chmod 777 $vhostdir/sitemap.xml.gz
	            chmod -R 777 $vhostdir/wp-content/themes
	            chown -R www:www $vhostdir
	            
	            print_done

	            print_job "Importing database ......"
	            
	            mysql_query  "DROP DATABASE IF EXISTS \`$wholedomain\`;"
	            mysql_query "CREATE DATABASE \`$wholedomain\`;"

	            mysql -h$db_host -u$db_username -p$db_password $wholedomain --default-character-set=utf8 < $db_file
	            
	            print_done
	            
			    print_job "Create nginx configure ......"
			    cat >/usr/local/nginx/conf/vhost/$domain.conf<<EOF
$alf
server
{
	listen       $ip;
	server_name *.$domain;
	index index.html index.htm index.php default.html default.htm default.php;

        if ( \$host = '$domain' )
        {
            rewrite ^/(.*)$ http://www.$domain/\$1 permanent;
        }

        if ( \$host ~* (\w+)\.(.*)\.\w+ )
        {
            set \$subdomain /\$1;
        }

        root  $sites_path/$domain\$subdomain;
	
	
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
		        print_done

	        done

            [ $? -ne 0 ] && exit 1 

            test_nginx
			restart_nginx


	        print_success "$title"
            ;;

        "3")

			title="Super God Mode - Export All Wordpress Sites"
            print_title "$title"

            read_var domain_file "domains.txt" "domains file" 

            check_file_exist "$domain_file"
 
	        strip_file "$domain_file" 
	        to_lower "$domain_file"

            backup_domain="/tmp/domains.txt"
            cp $domain_file $backup_domain
            
            print_subtitle "Backup All the files"
            ls -1 $sites_path

            confirm_or_exit "The scripts will backup *ALL* the sites on this server"

            print_subtitle "Backup wordpress files"
            backup_file="backup-`date +%y-%m-%d_%Hh%Mm%Ss`.tar"
            
            print_job "backup wordpress files"
            tar -cpf ./$backup_file $sites_path  
            print_done
            
            print_done

            stop_mysql
            

            ls -l $db_path|grep ^d|awk '$1=$1' -|cut -d " " -f 9|grep -Ev "$db_exclude_file"|while read mysql_file
            do
				print_job "backup mysql file:$db_path/$mysql_file"
                tar -rf "./$backup_file"  "$db_path$mysql_file" 2>/dev/null
                print_done
            done 

            print_job "backup domains.txt"
            tar -rf ./$backup_file  `readlink -f $backup_domain`
			print_done
			
			
            start_mysql

            print_job "Gzip compress with -9"
            gzip -9 $backup_file
            print_done

            print_success "$title in $backup_file.gz"

            ;;
 
        "4")
			title="Super God Mode - Import All Wordpress Sites"
            print_title "$title"

             
            read_var backup_file "`ls |grep -e \"backup-.*\.tar\.gz\"|head -n 1`" "domains file" 

            check_file_exist "$backup_file"
             
             
            confirm_or_exit "The script will import all the wordpress sites"
            
            stop_mysql
            

            print_subtitle "Decompress backup file"
            tar xf $backup_file -C /
            print_done
            
            start_mysql

            if [ ! -d /usr/local/nginx/conf/vhost ]; then
	            mkdir /usr/local/nginx/conf/vhost
	        fi
	        
	        cat /tmp/domains.txt |  while read domain_ip;do

	            domain=`echo $domain_ip | cut -d " " -f 1`
	            ip=`echo $domain_ip | cut -d " " -f 2 -s`

	            subdomain="${domain%%.*}"
	            domain="${domain#*.}"
	            wholedomain="$subdomain.$domain"
	            vhostdir="$sites_path/$domain/$subdomain"
	            alf="log_format  $domain  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
				'\$status \$body_bytes_sent "\$http_referer" '
				'"\$http_user_agent" \$http_x_forwarded_for';"
 	            al="access_log  /home/wwwlogs/$domain.log  $domain;"
 	            
	            print_subtitle "$domain\t$ip\t$vhostdir"

	            print_job "Create Virtul Host directory"
	            mkdir -p $vhostdir
	            touch /home/wwwlogs/$domain.log
	            print_done	    

	            print_job "Setting permissions of Virtual Host directory......"
	            
	            chmod -R 755 $vhostdir
	            touch $vhostdir/sitemap.xml
	            touch $vhostdir/sitemap.xml.gz
	            chmod 777 $vhostdir/sitemap.xml
	            chmod 777 $vhostdir/sitemap.xml.gz
	            chmod -R 777 $vhostdir/wp-content/themes
	            chown -R www:www $vhostdir
	            
	            print_done

	           
	            
	            if [ "$ip" != "" ]; then
			        print_job "Create nginx configure ......"
			        cat >/usr/local/nginx/conf/vhost/$domain.conf<<EOF
$alf
server
{
	listen       $ip;
	server_name *.$domain;
	index index.html index.htm index.php default.html default.htm default.php;

        if ( \$host = '$domain' )
        {
            rewrite ^/(.*)$ http://www.$domain/\$1 permanent;
        }

        if ( \$host ~* (\w+)\.(.*)\.\w+ )
        {
            set \$subdomain /\$1;
        }

        root  $sites_path/$domain\$subdomain;
	
	
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
		            print_done
	            fi
	        done

	        test_nginx
	        
	        restart_nginx
	        
            print_success "Import All wordpress Sites"
             
            ;;
 
		"5")
			title='Super God Mode - Build All Wordpress Sitemap'
			
			print_title "$title"

			read_var wp_username "shanks" "wordpress username"
			
			read_var wp_password "fuckit123" "wordpress password"
			
# 			confirm_or_exit "The script will build all the wordpress sitemap"
			
			ls -1 $sites_path|while read domain
            do
				ls -1 $sites_path/$domain |while read site
				do
				
					print_subtitle "build sitemap of $site.$domain"
					 
					create_session session
					
					print_job "login $site.$domain"
					http_post session "http://$site.$domain/wp-login.php" "log=$wp_username&pwd=$wp_password&wp-submit=Log+In&testcookie=1" "-s --connect-timeout 30"
					
					
					http_get session "http://$site.$domain/wp-admin/options-general.php?page=google-sitemap-generator%2Fsitemap.php&sm_wpv=3.3.1&sm_pv=3.2.6&sm_rebuild=true&noheader=true&_wpnonce=c1661c3d28" "-s  --connect-timeout 30"
					
# 					http_post session 
					destory_session session
					
					
				done
            done
            print_success "$title"
		;;
		
		"6")
			title='Super God Mode - Run All Stripts'
			
			print_title "$title"

			read_var script "3.php" "script path"
			

			
			confirm_or_exit "Run $script on all the wordpress"
			
			ls -1 $sites_path|while read domain
            do
				echo $domain
				ls -1 $sites_path/$domain/ |while read site
				do
					
					print_subtitle "run on $site.$domain"
					curl -sI --connect-timeout 60 "http://$site.$domain/$script" 

				done
            done
            print_success "$title"
		;;
        "a")
			title="Batch Adding Wordpress System"
	        print_title "$title"
	        
	        read_var domain_file "domains.txt" "domains file" 
	        
            check_file_exist "$domain_file"

	        strip_file "$domain_file" 
	        to_lower "$domain_file"
	        
	        read_var wordpress_folder "wordpress" "wordpress folder"

            check_directory_exist $wordpress_folder

	        read_var db_file "datebase.sql" "wordpress sql file"

            check_file_exist $db_file
	        
	        setup_mysql

	        print_subtitle "Domains"

	        cat $domain_file | while read line;do
				
	            domain="`echo $line | cut -d " " -f 1`"
	            ip=`echo "$line" | cut -d " " -f 2`

	            
	            if [ "$ip" = "" ]; then
		            echo "Error:Null ip with domain $domain"
		            exit 1
	            fi
	            
	            
	            echo -e "$domain\t$ip\c"
	            if [ ! -f "/usr/local/nginx/conf/vhost/${domain#*.}.conf" ] || [ ! -d "$sites_path/${domain#*.}/${domain%%.*}" ]; then
			        echo ""
	            else
			        echo "(Exist)"
	            fi
				
	            
	           
	        done
	        [ $? -ne 0 ] && exit

	        print_subtitle "Wordpress:"
	        echo "Folder:$wordpress_folder"

	        print_mysql_info
	        echo -e "Sql file:\t$db_file"



	        confirm_or_exit "The scripts will create the wordpress site.Existing will be overwritten."

	        mkdir -p /usr/local/nginx/conf/vhost

	        cat $domain_file |  while read domain_ip;do

	            domain=`echo $domain_ip | cut -d " " -f 1`
	            ip=`echo $domain_ip | cut -d " " -f 2 -s`

	            subdomain="${domain%%.*}"
	            domain="${domain#*.}"
	            wholedomain="$subdomain.$domain"
	            vhostdir="$sites_path/$domain/$subdomain"
	            alf="log_format  $domain  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
				'\$status \$body_bytes_sent "\$http_referer" '
				'"\$http_user_agent" \$http_x_forwarded_for';"
	            al="access_log  /home/wwwlogs/$domain.log  $domain;"
 	            
	            print_subtitle "$domain\t$ip\t$vhostdir"

	            print_job "Create Virtul Host directory"
	            mkdir -p $vhostdir
	            touch /home/wwwlogs/$domain.log
	            print_done	    
	            
	            print_job "Copy wordpress stuff......"
	            cp -R $wordpress_folder/* $vhostdir/
	            print_done
	            print_job "Setting wordpress configure......"
	            sed -i "s/database_name_here/$wholedomain/g" $vhostdir/wp-config.php
	            sed -i "s/username_here/$db_username/g" $vhostdir/wp-config.php
	            sed -i "s/password_here/$db_password/g" $vhostdir/wp-config.php
	            sed -i "s/host_here/$db_host/g" $vhostdir/wp-config.php
	            sed -i "s/home_here/http:\/\/$wholedomain/g" $vhostdir/wp-config.php
	            sed -i "s/siteurl_here/http:\/\/$wholedomain/g" $vhostdir/wp-config.php
	            print_done

	            print_job "Setting permissions of Virtual Host directory......"
	            
	            chmod -R 755 $vhostdir
	            touch $vhostdir/sitemap.xml
	            touch $vhostdir/sitemap.xml.gz
	            chmod 777 $vhostdir/sitemap.xml
	            chmod 777 $vhostdir/sitemap.xml.gz
	            chmod -R 777 $vhostdir/wp-content/themes
	            chown -R www:www $vhostdir
	            
	            print_done

	            print_job "Importing database ......"
	            
	            mysql_query  "DROP DATABASE IF EXISTS \`$wholedomain\`;"
	            mysql_query "CREATE DATABASE \`$wholedomain\`;"

	            mysql -h$db_host -u$db_username -p$db_password $wholedomain --default-character-set=utf8 < $db_file
	            #[ $? -ne 0 ] && exit 1 
	            print_done
	            
	            
	            if [ "$ip" != "" ]; then
			        print_job "Create nginx configure ......"
			        cat >/usr/local/nginx/conf/vhost/$domain.conf<<EOF
$alf
server
{
	listen       $ip;
	server_name *.$domain;
	index index.html index.htm index.php default.html default.htm default.php;

        if ( \$host = '$domain' )
        {
            rewrite ^/(.*)$ http://www.$domain/\$1 permanent;
        }

        if ( \$host ~* (\w+)\.(.*)\.\w+ )
        {
            set \$subdomain /\$1;
        }

        root  $sites_path/$domain\$subdomain;
	
	
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
		            print_done
	            fi
	        done
	        [ $? -ne 0 ] && exit 1
	       
			test_nginx
			
			restart_nginx

	        print_success "$title"
            ;;
        "r")

	        print_title "Batch Removing Wordpress System"

	        read_var domains_remove "domains.txt" "domains"

	        check_file_exist "$domains_remove"

	        strip_file "$domains_remove"
	        to_lower "$domains_remove"

	        setup_mysql
	        
	        print_subtitle "Removing Domain"

	        cat $domains_remove | while read domain_remove;do
	            echo -e "$domain_remove\c"
	            if [ ! -f "/usr/local/nginx/conf/vhost/${domain_remove#*.}.conf" ]; then
		            echo ""
	            else
		            echo "(Exist)"
	            fi
	        done

	        print_mysql_info	
	        
	        confirm_or_exit "The scripts will REMOVE all sites,including database,log file."
	        
	        cat $domains_remove | while read domain_remove;do
	            
	            domain_remove="`echo $domain_remove | cut -d " " -f 1`"

	            print_job "Removing $domain_remove"
	            subdomain="${domain_remove%%.*}"
	            domain="${domain_remove#*.}"
	            wholedomain="$subdomain.$domain"

	            rm -f /usr/local/nginx/conf/vhost/$domain.conf
	            rm -rf $sites_path/$domain/$subdomain
	            rmdir $sites_path/$domain 2> /dev/null
	            rm -f /home/wwwlogs/$domain.log
	            
	            mysql_query  "DROP DATABASE IF EXISTS \`$wholedomain\`;"
	            
	            print_done
	        done
	        
	        print_success "Batch removing"
	        ;;

		"t")

	        print_title "Batch Replace Content"

	        read_var replace_content_domains_file "replace_content_domains.txt" "domain file"

	        if [ ! -f $replace_content_domains_file ];then
	            echo "Error: file $replace_content_domains_file do not exist"
	            exit 1
	        fi
	        
	        strip_file $replace_content_domains_file

	        setup_mysql

	        print_subtitle "Domains"

	        cat $replace_content_domains_file | while read line ;do

	            if [ "${line:0:2}" = "@@" ];then
		            string_src="${line#*@@}"
		            echo -e "From $string_src\c"
		            continue
	            elif [ "${line:0:2}" = "##" ];then
		            string_dst="${line#*##}"
		            echo " To $string_dst"
		            continue
	            fi

	            domain=`echo $line | tr '[A-Z]' '[a-z]' `	
	            echo -e "$domain\c"
	            if [ ! -d "$sites_path/${domain#*.}/${domain%%.*}" ]; then
		            echo "(Not Exist)"
	            else
		            echo ""
	            fi
	        done

	        print_mysql_info

	        confirm_or_exit "The scripts will REPLACE all the words."
	        
	        cat $replace_content_domains_file | while read line;do
	            if [ "${line:0:2}" = "@@" ];then
		            string_src="${line#*@@}"
		            echo -e "From $string_src\c"
		            continue
	            elif [ "${line:0:2}" = "##" ];then
		            string_dst="${line#*##}"
		            echo "To $string_dst"
		            continue
	            fi

	            domain=`echo $line | tr '[A-Z]' '[a-z]' `	
	            print_job "Replacing $domain"
	            mysql_query "UPDATE \`wp_posts\` SET \`post_excerpt\` = REPLACE(\`post_excerpt\`, '$string_src','$string_dst') WHERE INSTR(\`post_excerpt\`,'$string_src') > 0;" $domain
	            mysql_query "UPDATE \`wp_posts\` SET \`post_content\` = REPLACE(\`post_content\`, '$string_src','$string_dst') WHERE INSTR(\`post_content\`,'$string_src') > 0;" $domain
	            print_done
	        done

	        print_success "Batch replace content"
            ;;
        'k' )
	        print_title "Adding content to Wordpress File"
	        
	        read_var add_content_domains_file "add_content_domains.txt" "domain file"

	        if [ ! -f $add_content_domains_file ];then
	            echo "Error: file $add_content_domains_file do not exist"
	            exit 1
	        fi
	        
	        strip_file $add_content_domains_file

	        print_subtitle "Domains"

	        adding=""
	        
	        cat $add_content_domains_file | while read line ;do
	            if [ "${line:0:2}" = "##" ];then
		            adding="${line#*##}"
		            print_subtitle "Add Content"
		            echo "$adding"
		            print_line
		            continue
	            elif [ "${line:0:2}" = "@@" ];then
		            to_file="${line#*@@}"
		            echo "To File :$to_file"
		            print_line
		            continue
	            fi
		    
		    
	            domain=`echo $line | tr '[A-Z]' '[a-z]' `
	            		    
		    
		    echo -e "$domain \c"
		   
	            if [ ! -d "$sites_path/${domain#*.}/${domain%%.*}" ]; then
		        echo "(Not Exist)"
	            else
		        echo ""
	            fi
	        done

	        confirm_or_exit "The scripts will ADD the content to the files." 

	        cat $add_content_domains_file | while read line ;do

	            if [ "${line:0:2}" = "##" ];then
		            adding="${line#*##}"
		            continue
	            elif [ "${line:0:2}" = "@@" ];then
		            to_file="${line#*@@}"
		            continue
	            fi

	            domain=`echo $line | tr '[A-Z]' '[a-z]' `
	            file="$sites_path/${domain#*.}/${domain%%.*}/$to_file"
	            print_job "Processing file $file"
	            if [ -f $file ]; then
		            echo "$adding" >> $file
		            echo "[DONE]"
	            else
		            echo "[FAILE]"
	            fi
	        done

	        print_success "Adding content to Wordpress File"
            ;;
        "p")
	        print_title "Batch Copying Stripts and Run"

	        read_var scripts_folder "scripts" "scripts folder"

	        if [ ! -d $scripts_folder ];then
	            echo "Error: scripts folder $scripts_folder do not exist"
	            exit 1
	        fi

	        print_subtitle "Domains"

	        ls $scripts_folder | while read file ;do
	            echo $file
	        done

	        confirm_or_exit "The scripts will COPY the scripts to the root of website and RUN."

	        ls $scripts_folder | while read file ;do
	            print_job "Copying to domain:$file"
	            cp -f $scripts_folder/$file $sites_path/${file#*.}/${file%%.*}/1.php
	            print_done
	            print_job "Runing the script......."
	            curl -s "http://$file/1.php" 1> /dev/null
	            print_done
	        done
	        
	        print_success "Copying scripts and run"
	        
	        ;;    
# 	    "e")
# 	        print_title "Export Wordpress System"
# 	        
# 	        read_var domain_file "domains.txt" "domain file"
# 	        
# 	        read_var export_file "`date +%y-%m-%d_%Hh%Mm%Ss`" "export file name without ext"
# 	        
# 	        if [ ! -f $domain_file ];then
# 		        echo "Error: file $domain_file do not exist"
# 		        exit 1
# 	        fi
# 
# 	        strip_file $domain_file 
# 	        to_lower $domain_file
# 	        
# 	        setup_mysql
# 
# 	        print_subtitle "Domains"
# 
# 	        cat $domain_file | while read domain_ip;do
# 	            domain=`echo $domain_ip | cut -d " " -f 1`
# 	            ip=`echo $domain_ip | cut -d " " -f 2`
# 
# 	            echo -e "$domain\t$ip\c"
# 	            if [ ! -f "/usr/local/nginx/conf/vhost/${domain#*.}.conf" ]; then
# 		            echo ""
# 	            else
# 		            echo "(Exist)"
# 	            fi
# 
# 	            if [ "$ip" = "" ]; then
# 		            echo "Error:Null ip with domain $domain"
# 		            exit 1
# 	            elif [ "`/sbin/ifconfig|grep -w $ip`" = "" ];then
# 		            echo "Error:IP $ip is not belong to this server"
# 		            exit 1
# 	            fi
# 	        done
# 	        
# 	        ;;
    esac
    echo "Press any key to continue"
    read -n1
    
done
exit 0

