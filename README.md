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

# Flyway

Flyway is a tool that allows you to increase the reliability of deployments by
versioning your database. It places changes to your database in version control so that it can be repeated in a new environment. This allows you to repeat deployments in different environments without being concerned about

## Manual with Desktop client

### Set up Database Connection

1. Install Flyway Desktop Client.
2. Make a redgate profile, and log in with it.
3. Make a new project
   1. Assign a relevant project name and location
   2. Select your database type (In our case SQL Server)
4. Set up a target database
   1. Server: Your aws rds endpoint
   2. Port: 1433
   3. Database Name: Database name
   4. Check "encrypt" and "trust server certificate"
   5. Select the right type of authentication 
      1. For SQL Server, this is "SQL Server Authentication"
   6. Use your database username and password
   7. Test and save, which verifies a functional connection

### Add new changes to database (migration)

1. Add a new migration (it will generate version)
2. Enter your database changes (Sql script)
3. Save and select "Run migrate"

## Flyway (CI/CD pipeline)

1. Create a new folder in your project '.github'
2. Add a folder to it called 'workflows'
3. Copy the generalised workflow for a [Flyway CI/CD pipeline](https://documentation.red-gate.com/fd/github-dockerized-yml-pipeline-using-github-actions-188645384.html)
4. Configure this for your specific use case
   1. Select a branch to run from
   2. Modify the working directory to your migrations folder
   3. Add your schema to the file (default dbo)
5. Add github repository secrets to your repository:
   - DB_BUILD_URL: Your jdbc connection string
   - DB_BUILD_USERNAME: database username
   - DB_BUILD_PASSWORD: database password
6. Add new migrations (as .sql scripts) to your folder and push them to the branch

You can view the progress of the github action on your online repository (the "actions") tab to verify that it ran successfully.
