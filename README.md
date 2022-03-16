# Challenge Architecture
Since I´m an Azure Data Engineer, I used the following Azure resources in order to develop the challenge:

- Azure Storage Account (Data Lake) -> Used to store "trips.csv" file
- Azure Data factory -> Used to orchestrate the pipeline execution 
- Azure Databricks -> Scalable Spark solution used for writting PySpark code (calculate points distance)
- Azure SQL Server -> Scalable solution used to store the final data (as requested)

![image](https://user-images.githubusercontent.com/101717820/158617437-cc25b406-ea27-4043-8e56-7799f737a418.png)



## Logging in Azure:
- For the challenge purpose I´ve created a Free Azure Subscription that Jobsity can use for testing and validating the challenge:
- Login: arleychallengejobsity@outlook.com
- Password: challenge123*


## Resources Creation and configuration:
- Azure Storage Account (Data Lake): I´ve create a storage account resource named **"challengejobsity"** and a blob container named **"trips"**. Inside trips container I created a folder named **"RAW"** and inside RAW folder uploaded the **_"trips.csv"_** file as you seen in bellow image:

![image](https://user-images.githubusercontent.com/101717820/158619139-06a37e50-d790-4550-bb23-8cb0ca610687.png)








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
