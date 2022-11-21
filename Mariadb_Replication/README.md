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

---
## show max_binlog_size
```sql
show variables like 'max_binlog_size';
```

## show max_binlog_size
```sql
SHOW BINARY LOGS;
SHOW MASTER LOGS;
```

## dump db
```bash
mysqldump -uroot -p  --all-databases > /tmp/alldb.sql 
```

## check scheduler status
```sql
SELECT @@event_scheduler;
```

## open scheduler
```sql
SET GLOBAL event_scheduler = ON;
```

## show scheduler list
```sql
SHOW EVENTS FROM mysql;
```


## set scheduler 
```sql
use mysql;
CREATE EVENT Event_purge_binlog
ON SCHEDULE EVERY 4 HOUR STARTS '2020-04-02 04:00:00'
DO
  PURGE BINARY LOGS BEFORE (NOW() - INTERVAL 4 HOUR);
```


## set scheduler 
```sql
-- 刪除某特定時間點之前的 binary log
PURGE BINARY LOGS BEFORE '2020-04-02 20:40';
 
-- 刪除今天以前的 binary log
PURGE BINARY LOGS BEFORE DATE(NOW());
 
-- 刪除4小時之前的 binary log
PURGE BINARY LOGS BEFORE (NOW() - INTERVAL 4 HOUR);

-- 刪除binlog.000058 之前的 binary log
PURGE MASTER LOGS TO 'binlog.000058'; 

-- 刪除所有的 binary log
PURGE BINARY LOGS;
```