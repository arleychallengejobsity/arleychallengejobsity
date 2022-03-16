# Challenge Architecture
Since I´m an Azure Data Engineer, I used the following Azure resources in order to develop the challenge:

- Azure Storage Account (Data Lake) -> Used to store "trips.csv" file
- Azure Data factory -> Used to orchestrate the pipeline execution 
- Azure Databricks -> Scalable Spark solution used for writting PySpark code (calculate points distance)
- Azure SQL Server -> Scalable solution used to store the final data (as requested)

![image](https://user-images.githubusercontent.com/101717820/158699501-57ed0fa8-6976-490d-8ab1-77d97fb4fecd.png)


## Logging into Azure:
- For the challenge purpose I´ve created a Free Azure Subscription that Jobsity can use for testing and validating the challenge solution:
- Login: arleychallengejobsity@outlook.com
- Password: challenge123*


## Resources Creation and configuration:
- **_Azure Storage Account (Data Lake):_** I´ve create a storage account resource named **"challengejobsity"** and a blob container named **"trips"**. Inside trips container I created a folder named **"RAW"** and inside RAW folder uploaded the **_"trips.csv"_** file as seen in bellow image:

![image](https://user-images.githubusercontent.com/101717820/158619139-06a37e50-d790-4550-bb23-8cb0ca610687.png)

After that I configured a Service-Principal (app registration). This is necessary because Databricks use this account to connect to datalake
To create the service principal, I entered Azure Active Directory, clicked in _App registration_ and create a new app registration named **_DATABRICKS-SERVICE-PRINCIPAL_** and add this service-principal with Contributor Access in datalake:


![image](https://user-images.githubusercontent.com/101717820/158700150-e26f8f65-c77b-46a5-9402-0ae4b78e31cf.png)

![image](https://user-images.githubusercontent.com/101717820/158700266-a90f9358-b1e6-4860-8f60-018d4983d877.png)

![image](https://user-images.githubusercontent.com/101717820/158700348-61433795-4c62-41de-b17d-160afca4f686.png)

![image](https://user-images.githubusercontent.com/101717820/158700532-ace517ea-b3c9-4ba2-a28e-9aa2ff9a1476.png)






  - **Note** : for challenge purpose I will starting reading the trips file from datalake, but thinking about a real scenario you'll probably starting picking up the trips file from a FTP or a File System for example and loading into RAW or STAGE layer into your datalake


- **_Azure Data Factory:_** I´ve created a Data Factory resource named **"datafactorychallenge"**  for pipeline orchestration. Data Factory will start databricks cluster control notebook execution.
- 
![image](https://user-images.githubusercontent.com/101717820/158646114-6200a1d5-cda6-48d5-b15a-3046f9dbe17b.png)


- **_Databricks:_**: I´ve created a Databricks resource and cluster (Free tier only per






<!--
**arleychallengejobsity/arleychallengejobsity** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->
