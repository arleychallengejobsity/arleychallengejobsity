# Challenge Architecture
Since I´m an Azure Data Engineer, I used the following Azure resources in order to develop the challenge:

- Azure Storage Account (Data Lake) -> Used to store "trips.csv" file
- Azure Data factory -> Used to orchestrate the pipeline execution 
- Azure Databricks -> Scalable Spark solution used for writting PySpark code (calculate points distance)
- Azure SQL Server -> Scalable solution used to store the final data (as requested)

![image](https://user-images.githubusercontent.com/101717820/158617437-cc25b406-ea27-4043-8e56-7799f737a418.png)



## Logging in Azure:
- For the challenge purpose I´ve created a Free Azure Subscription that Jobsity can use for testing and validating the challenge solution:
- Login: arleychallengejobsity@outlook.com
- Password: challenge123*


## Resources Creation and configuration:
- **_Azure Storage Account (Data Lake):_** I´ve create a storage account resource named **"challengejobsity"** and a blob container named **"trips"**. Inside trips container I created a folder named **"RAW"** and inside RAW folder uploaded the **_"trips.csv"_** file as seen in bellow image:
  - **Note** : for challenge purpose I will starting reading the trips file from datalake, but thinking about a real scenario you'll probably starting picking up the trips file from a FTP or a File System for example and loading into RAW or STAGE layer into your datalake

![image](https://user-images.githubusercontent.com/101717820/158619139-06a37e50-d790-4550-bb23-8cb0ca610687.png)

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
