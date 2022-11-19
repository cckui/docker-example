# Mariadb_Replication

# Master
## show bin log expire days
```sql
show variables like 'expire_logs_days'; 
```

## show bin log
```sql
show variables where variable_name like '%log_bin%';
```

## create sync account
```sql
create user 'slave'@'%' identified by '123';
```

## grant privileges
```sql
grant replication slave on *.* to 'slave'@'%'; 
```

## flush privileges
```sql
flush privileges;
```

## flush privileges
```sql
show master status;
```

## dump db
```bash
mysqldump -uroot -p  --all-databases > /tmp/alldb.sql 
```


---

# Slave
## 建立抄寫
```sql
change master to master_host='db1',master_port=3306,master_user='slave',master_password='123',master_log_file='bin-log.000003',
master_log_pos=767;
start slave;
show slave status;
```

## 看抄寫狀態
```sql
show slave status;
stop slave;
reset slave;
```

[Ref](https://www.jianshu.com/p/a525b4824e8e)