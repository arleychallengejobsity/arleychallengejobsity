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


-**_Databricks:_**: I´ve created a Databricks resource named **"databricks-challenge"** and a cluster named **"clusterjs"**
After that I develop a PySpark notebook named **"data-engineering-challenge"** to ingest and store the trips data

![image](https://user-images.githubusercontent.com/101717820/158703594-6e6736bc-4e5c-4b7c-b60a-58e7ba675a7b.png)

Lets discuss further about the notebook steps:

- The first 2 commented steps was executed only once to mount databricks driver (here I used the configurations from the service-principal created before - **_Note:_** for the challenge development, the app Id, secret Id and Directory Id is open. FOR SURE in a production environment you MUST use a Key Vault to encrypt the keys) 

![image](https://user-images.githubusercontent.com/101717820/158703948-ea6f34cb-820e-4c32-a8be-2ef8d181a987.png)

- The steps bellow is used to import necessary libraries and Read the "trips.csv" file into a spark dataframe:

![image](https://user-images.githubusercontent.com/101717820/158704611-c76a11f1-8387-4d9a-a252-e2066d26e0aa.png)

and then convert origin and destination geometric points into and long and calculated the distance using Haversine formula:

![image](https://user-images.githubusercontent.com/101717820/158704752-5815f583-4b1b-40ce-ac84-aee7675edb52.png)

and created distange ranges for grouping:
![image](https://user-images.githubusercontent.com/101717820/158705039-784ad0e2-35e7-4924-88db-b2d967b3f3bb.png)

after that I plotted the points using Folium library and folium plugin MarkerCluster:

![image](https://user-images.githubusercontent.com/101717820/158705160-2f78daff-bfab-4e13-bb68-01939cbb4902.png)

![image](https://user-images.githubusercontent.com/101717820/158705230-74d22687-3298-4827-b213-9b2f837f4e78.png)

After that I calculated the average number of thips for an area:

![image](https://user-images.githubusercontent.com/101717820/158705361-21a6c9dc-29ad-4fab-90ea-7eae783a07bc.png)

and then loaded the final dataframe into  SQL Server:

![image](https://user-images.githubusercontent.com/101717820/158705445-47626e5c-2048-4587-a1fe-d069393f99fc.png)

There is also a final Command that replicates the final dataframe and generate 100 million rows for proof of scalability. It tooked around 21 minutes to load 100 million rows into SQL Server:

![image](https://user-images.githubusercontent.com/101717820/158705614-c4a365d2-7cc6-4a5d-9bef-2af0230608c0.png)




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
