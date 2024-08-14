# Configurações do Hadoop

Este repositório contém arquivos de configuração para um cluster Hadoop. O cluster é composto por um nó master e cinco nós slaves.

## Estrutura do Cluster

- **Master Node**: `masternode`
- **Slave Nodes**:
  - `node2`
  - `node3`
  - `node4`
  - `node5`
  - `node6`

## Arquivos de Configuração

Os arquivos de configuração principais estão localizados nas seguintes pastas:

- `conf/`: Contém arquivos de configuração do Hadoop para todos os nós.
  - `core-site.xml`: Configurações básicas do Hadoop.
  - `hdfs-site.xml`: Configurações do HDFS.
  - `mapred-site.xml`: Configurações do MapReduce.
  - `yarn-site.xml`: Configurações do YARN.

## Configuração do Master Node

1. **core-site.xml**:
   - Defina o nome do master node no parâmetro `fs.defaultFS`:
     ```xml
     <configuration>
       <property>
         <name>fs.defaultFS</name>
         <value>hdfs://masternode:9000</value>
       </property>
     </configuration>
     ```

2. **hdfs-site.xml**:
   - Configure o diretório do NameNode e os diretórios de dados:
     ```xml
     <configuration>
       <property>
         <name>dfs.namenode.name.dir</name>
         <value>/path/to/name/node/dir</value>
       </property>
       <property>
         <name>dfs.datanode.data.dir</name>
         <value>/path/to/data/node/dir</value>
       </property>
     </configuration>
     ```

3. **mapred-site.xml**:
   - Configure o `mapreduce.framework.name` para `yarn`:
     ```xml
     <configuration>
       <property>
         <name>mapreduce.framework.name</name>
         <value>yarn</value>
       </property>
     </configuration>
     ```

4. **yarn-site.xml**:
   - Configure o ResourceManager e o NodeManager:
     ```xml
     <configuration>
       <property>
         <name>yarn.resourcemanager.hostname</name>
         <value>masternode</value>
       </property>
       <property>
         <name>yarn.nodemanager.hostname</name>
         <value>node2,node3,node4,node5,node6</value>
       </property>
     </configuration>
     ```

## Configuração dos Nodes Slaves

Os arquivos de configuração dos slaves devem refletir as configurações do master, mas com alguns ajustes:

1. **core-site.xml**:
   - O parâmetro `fs.defaultFS` deve apontar para o master node:
     ```xml
     <configuration>
       <property>
         <name>fs.defaultFS</name>
         <value>hdfs://masternode:9000</value>
       </property>
     </configuration>
     ```

2. **hdfs-site.xml**:
   - O parâmetro `dfs.datanode.data.dir` deve apontar para o diretório específico do slave:
     ```xml
     <configuration>
       <property>
         <name>dfs.datanode.data.dir</name>
         <value>/path/to/data/node/dir</value>
       </property>
     </configuration>
     ```

3. **mapred-site.xml**:
   - O parâmetro `mapreduce.framework.name` deve ser o mesmo do master:
     ```xml
     <configuration>
       <property>
         <name>mapreduce.framework.name</name>
         <value>yarn</value>
       </property>
     </configuration>
     ```

4. **yarn-site.xml**:
   - O parâmetro `yarn.nodemanager.hostname` deve ser o hostname do slave:
     ```xml
     <configuration>
       <property>
         <name>yarn.nodemanager.hostname</name>
         <value>node2</value>
       </property>
     </configuration>
     ```


