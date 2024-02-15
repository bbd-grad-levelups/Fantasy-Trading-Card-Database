# Fantasy-Trading-Card-Database
BBD Graduate Program Database Level-up (2024)

# Prerequisites
1. AWS Account
2. IDE E.g: VSCode

# Step 1 - Clone the repo
1. ```sh
    git clone https://github.com/bbd-grad-levelups/Fantasy-Trading-Card-Database.git
   ```

# Step 2 - Deploy AWS Database
1. Install the [AWS CLI](http://www.howtogeek.com)
2. Install [Terraform](https://developer.hashicorp.com/terraform/install)
3. Create an IAM User with programmatic access on your AWS account, name this user 'terraform-user'
4. Once the IAM User is created, save your Access key ID and your Secret access Key.
5. On your AWS account create a user group, and add your terraform-user to your newly created group
6. Give your user group 'AdministratorAccess'
7. Create an AWS CLI Profile for you IAM USER on your local machine
    1. Open a terminal on your machine
    2. Type this into your terminal and press enter
       ```sh
        aws configure --profile terraform-user
       ```
    3. Enter your AWS Access Key ID and Secret access Key when promted
    4. Enter your region when promted, e.g: eu-west-1
    5. Press enter when they ask for output format
        ```sh
        AWS Access Key ID [NONE]: <enter your access key ID>
        AWS Secret Access Key [NONE]: <enter your secret access key>
        Default region name [NONE]: eu-west-1
        Default output formate [NONE]: 
       ```
8. Open the cloned repo in VSCode
9. Open the Terraform folder in your terminal
10. Enter this command into your terminal
        ```sh
        terraform apply
       ```
11. Enter username and password when prompted
12. View your created database on AWS cloud


