# Marucy manual
[![N|Solid](https://www.underconsideration.com/brandnew/archives/miro_shapes_animated_all.gif)](https://miro.com)

Marucy is a tool for postgres testing from Miro

Author: Necheukhin Anton

## 0. Install ansible and terraform (last versions)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)<br/>
- [Terraform](https://www.terraform.io/downloads.html)<br/>
- Generate  ssh-key if you do not have it: ```ssh-keygen```<br/>
_The key will be placed in the directory: ```~/.ssh```_<br/>
_The file with the private key must be limited in access: ```chmod 400 ~/.ssh/id_rsa```_<br/>

## 1. Scenario creating 
1.Create dumpall of database, which will be used to record scenario:

```su postgres```<br/>
```cd ~```<br/>
```pg_dumpall > backup_dball.sql```<br/>

2.Remove postgres role creating from dump:

```sed --in-place '/CREATE ROLE postgres;/d'  backup_dball.sql```

3.Put logging settings to postgres.conf:

>log_destination = 'csvlog' <br/>
>log_directory = '/logs/pg_log'  <br/>
>logging_collector = on <br/>
>log_min_duration_statement = 0  <br/>
>log_min_messages = error  <br/>
>log_min_error_statement = log  <br/>
>log_connections = on <br/>
>log_disconnections = on <br/>
>log_statement = 'all' <br/>

_*path ```/logs/pg_log``` can be placed on a separate disc if it’s necessary_

3.Restart postgres:

```systemctl restart postgres```

4.Do load testing to record queries. Queries will be recorded in csv file in directory ```/logs/pg_log```. While load testing is doing check that logs are recording.

5.Convert logs to binary pgreplay format. Pgreplay is needed for the following:

```cat *.csv > ./test.replay.csv```

```apt install pgreplay```

```pgreplay -f -c -o /logs/pg_log/test.replay.csv /logs/pg_log/test.replay```

-> test.replay is a scenario

### 2. Instances creating
1.Download marucy: ```git clone https://github.com/Antnch/marucy.git```<br/>
2.Move to ```marucy/terraform``` directory<br/>
3.Add keys to ```marucy/terraform/variables.tf```: ```aws_access_key```, ```aws_secret_key```, ```ssh_key```<br/>
4.Initialize a working directory containing Terraform configuration files: ```terraform init```<br/>
5.Check terraform plan: ```terraform plan```<br/>
6.Create instances and setup network: ```terraform apply```<br/>

## 3. Instances configuring

Copy public IP of created instances to ```marucy/ansible/hosts.tpl```<br/>

You can install all by single command: ```ansible-playbook all.yml -i hosts.tpl```<br/>
Total duration ~ 9m<br/>

Or parts:<br/>
1.Move to ```marucy/ansible``` directory<br/>
2.Install postgres: ```ansible-playbook postgresql.yml -i hosts.tpl```<br/>
authentication data: ```marucy/ansible/group_vars/all.yml```<br/>
_duration ~ 3m 48s_<br/>
3.Install tool for launch test: ```ansible-playbook base.yml -i hosts.tpl```<br/>
_duration ~  1m 24 s_ <br/>
4.Restore database for test: ```ansible-playbook restore.yml -i hosts.tpl```<br/>
_duration ~ 10s_ <br/>
5.Install exporters to collect metrics: ```ansible-playbook exporters.yml -i hosts.tpl```<br/>
_duration ~ 1m 16s_ <br/>
6.Install prometheus and grafana: ```ansible-playbook monitoring.yml -i hosts.tpl```<br/>
_duration ~  2m 5s_<br/>


## 4. Launch scenario
1.Move to db_instance by ssh: ```ssh root@"{{ db_instance_IP }}"```<br/>
2.Move to ```/tmp``` directory<br/>
3.Extract test.replay.gz: ```tar -xvf test.replay.gz```<br/>
4.Open Grafana dashboards: ```http://{{ monitoring_IP }}:3000/``` <br/>
```login:admin```<br/>
```password: admin```<br/>
5.Launch scenario: ```pgreplay -r -h {{ db_data_IP }} -W changeme -s 2 test.replay```<br/>
*```changeme``` - password from ```marucy/ansible/group_vars/all.yml```<br/>


