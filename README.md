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
**_Azure Storage Account (Data Lake):_** 
  I´ve create a storage account resource named **"challengejobsity"** and a blob container named **"trips"**. Inside trips container I created a folder named **"RAW"** and inside RAW folder uploaded the **_"trips.csv"_** file as seen in bellow image:

![image](https://user-images.githubusercontent.com/101717820/158619139-06a37e50-d790-4550-bb23-8cb0ca610687.png)

After that I configured a Service-Principal (app registration). This step is necessary because Databricks uses this account to connect and authenticate with datalake.
To create the service principal, I entered Azure Active Directory, clicked in _App registration_ 

![image](https://user-images.githubusercontent.com/101717820/158700150-e26f8f65-c77b-46a5-9402-0ae4b78e31cf.png)


and created a new app registration named **_DATABRICKS-SERVICE-PRINCIPAL_** 

![image](https://user-images.githubusercontent.com/101717820/158700266-a90f9358-b1e6-4860-8f60-018d4983d877.png)

![image](https://user-images.githubusercontent.com/101717820/158700348-61433795-4c62-41de-b17d-160afca4f686.png)

and added this service-principal with Contributor Access in datalake:

![image](https://user-images.githubusercontent.com/101717820/158700532-ace517ea-b3c9-4ba2-a28e-9aa2ff9a1476.png)

  - **Note** : for challenge purpose I will starting reading the trips file from datalake, but thinking about a real scenario you'll probably starting picking up the trips file from a FTP or a File System for example and loading into RAW or STAGE layer into your datalake


**_Azure Data Factory:_** I´ve created a Data Factory resource named **"datafactorychallenge"**  for pipeline orchestration. I created a pipeline named "_pipe_challenge_jobsity_". this pipeline controls the databricks notebook execution and send status to log actitivy (log is then sended to a table named [dbo].[EXECUTION_LOGS] in SQL Server. **This responds mandatory Feature -> Develop a way to inform the user about the status of the data ingestion without using a polling solution**

![image](https://user-images.githubusercontent.com/101717820/158702830-e1667361-feb3-4e68-a647-c714a66fb457.png)

Data Factory also has Triggers, and you can configure a Trigger to schedule the pipeline execution  **This responds mandatory Feature -> There must be an automated process to ingest and store the data**

![image](https://user-images.githubusercontent.com/101717820/158702963-a37315b4-5474-4eef-8e12-8690dc0f54f1.png)


Data Factory will then start databricks cluster to control notebook execution.
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
