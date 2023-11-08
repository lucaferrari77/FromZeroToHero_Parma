# Data Saturday Parma 2023: Microsoft Fabric From zero to hero 

In this session you will cover Analytic and Real time scenarios using Microsoft Fabric



## Prerequisites
1. Internet connectivity
2. Your own active Azure Subscribtion
3. Your own [Microsoft Fabric Trial](https://learn.microsoft.com/en-us/fabric/get-started/fabric-trial)

## What feature will you use during the session

During this session you will explore Microsoft Fabric capabilities and you will use:
1. Workspace
2. Lakehouse and Warehouse to build the [Medallion architecture](https://learn.microsoft.com/en-us/azure/databricks/lakehouse/medallion)
3. Data Flow Gen2
4. Pipelines
5. Notebooks
6. SQL Endpoints
7. Datasets
8. PowerBI reports
9. EventStream
10. KQL Database and Queryset
12. Data Activator - Reflex

## 1 - End to End Analytic scenario

The following image shows the lakehouse end-to-end architecture. The components involved are described in the following list.
![Diagram of the end-to-end architecture of a lakehouse in Microsoft Fabric.](/FromZeroToHero_Parma/Images/lakehouse-end-to-end-architecture.png)

**Data sources:** Fabric makes it quick and easy to connect to Azure Data Services, as well as other cloud-based platforms and on-premises data sources, for streamlined data ingestion.

**Ingestion:** You can quickly build insights for your organization using more than 200 native connectors. These connectors are integrated into the Fabric pipeline and utilize the user-friendly drag-and-drop data transformation with dataflow. Additionally, with the Shortcut feature in Fabric you can connect to existing data, without having to copy or move it.

**Transform and store:** Fabric standardizes on Delta Lake format. Which means all the Fabric engines can access and manipulate the same dataset stored in OneLake without duplicating data. This storage system provides the flexibility to build lakehouses using a [Medalliion architecture](https://learn.microsoft.com/en-us/azure/databricks/lakehouse/medallion) or a data mesh, depending on your organizational requirement. You can choose between a low-code or no-code experience for data transformation, utilizing either pipelines/dataflows or notebook/Spark for a code-first experience.

**Consume:** Power BI can consume data from the Lakehouse for reporting and visualization. Each Lakehouse has a built-in TDS/SQL endpoint, for easy connectivity and querying of data in the Lakehouse tables from other reporting tools. Additionally, when a Lakehouse is created, a corresponding secondary item called a Warehouse is automatically generated with the same name as the Lakehouse. It provides users with the TDS/SQL endpoint functionality.

## Sample Dataset

Wide World Importers (WWI) is a wholesale novelty goods importer and distributor operating from the San Francisco Bay area. As a wholesaler, WWI's customers mostly include companies who resell to individuals. WWI sells to retail customers across the United States including specialty stores, supermarkets, computing stores, tourist attraction shops, and some individuals. WWI also sells to other wholesalers via a network of agents who promote the products on WWI's behalf. To learn more about their company profile and operation, see [Wide World Importers sample databases for Microsoft SQL](https://learn.microsoft.com/en-us/sql/samples/wide-world-importers-what-is?view=sql-server-ver16&preserve-view=true).

In general, data is brought from transactional systems or line-of-business applications into a lakehouse. However, for the sake of simplicity in this tutorial, we use the dimensional model provided by WWI as our initial data source. We use it as the source to ingest the data into a lakehouse and transform it through different stages (Bronze, Silver, and Gold) of a medallion architecture.


## 2 - End to End Real Time scenario

You will track the International Space Station using Microsoft Fabric. 
![PBI Orbit](/FromZeroToHero_Parma/Images/PBI_orbit.png)

The end to end scenario is available [here](https://github.com/anshulsharmas/fabric-iss-demo)


## Credits

Analytic Scenarios has been derived from this one available in the Microsoft Public documentation:
https://learn.microsoft.com/en-us/fabric/get-started/end-to-end-tutorials#multi-experience-tutorials
https://learn.microsoft.com/en-us/fabric/data-engineering/tutorial-lakehouse-get-started
https://learn.microsoft.com/en-us/fabric/data-warehouse/tutorial-introduction

The Real Time scenario is available [here](https://github.com/anshulsharmas/fabric-iss-demo)
and it has been created by [***Anshul Sharms***](https://github.com/anshulsharmas)

[**Go to the first step**](/FromZeroToHero_Parma/Analytics%20-%20How%20To%20Proceed/1_Create_MS_Fabric_workspace.md)
