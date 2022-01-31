import json
   
# Opening JSON file
f = open('terraform.tfstate',)
   
#list of dictionaries from tfstate
aws_ec2=[]
aws_sg=[]
aws_rt=[]
aws_rta=[]


#variables
data = json.load(f)
cidr ='0.0.0.0/0'  
instance =''
public_ip = '' 
flag_sg= False
flag_ig= False
sg = ''
port = 22
subnet=''
route_table=''
igw=''

#Fetching Values from tfstate and storing in respective lists
for i in data['resources']:
    if i['type']=='aws_instance':
        aws_ec2.append(i)
    if i['type']=='aws_security_group':
        aws_sg.append(i)
    if i['type']=='aws_route_table':
        aws_rt.append(i)
    if i['type']=='aws_route_table_association':
        aws_rta.append(i) 

#seperating the subnet,security group of the instance having public ip          
for i in aws_ec2:
    if i['instances'][0]['attributes']['public_ip']!='':
        public_ip=i['instances'][0]['attributes']['public_ip']          
        sg= i['instances'][0]['attributes']['vpc_security_group_ids'][0]
        subnet=i['instances'][0]['attributes']['subnet_id']
        instance=i['instances'][0]['attributes']['id']
        break
#comparing security group fetched above in sg's list and checking if it matches the cidr and port
for i in aws_sg:
    if sg == i['instances'][0]['attributes']['id']:
        ingres_dict=i['instances'][0]['attributes']['ingress']
        for x in ingres_dict:
            if x['from_port']==port and x['cidr_blocks'][0] == cidr:
                flag_sg=True
                break
        break  
# comparing subnet fetched above in route table association's list to seperate the route table  
for i in aws_rta:
    if subnet == i['instances'][0]['attributes']['subnet_id']: 
        route_table = i['instances'][0]['attributes']['route_table_id'] 
        break   
# comparing route table and cidr fetched above in route table's list to check wheteher it is going via the internet gateway or not
for i in aws_rt:
    if route_table == i['instances'][0]['attributes']['id'] and cidr==i['instances'][0]['attributes']['route'][0]['cidr_block']:
        igw=i['instances'][0]['attributes']['route'][0]['gateway_id']
        if igw!='':
            flag_ig=True
            break


if flag_ig==True and flag_sg==True:
    print("public ip of instance is " + public_ip)    
    print("instance is "+ instance)

f.close()

