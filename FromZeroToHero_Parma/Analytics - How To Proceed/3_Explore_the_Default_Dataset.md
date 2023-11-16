[**Back to the previous step**](/FromZeroToHero_Parma/Analytics%20-%20How%20To%20Proceed/2_Create_the_Bronze_Lakehouse.md)

# 1. Explore the raw data using the default dataset

1. When you create a lekehouse or a datawarehouse, a [default powerBI](https://learn.microsoft.com/en-us/fabric/data-warehouse/datasets#understand-whats-in-the-default-power-bi-dataset) dataset is created.

    ![default ds](../Images/default%20dataset.png)

2. From the dataset pane, you can view all the tables. You have options to create reports either from scratch, paginated report, or let Power BI automatically create a report based on your data. For this tutorial, select **Auto-create** under **Create a report**.

    ![auto create](../Images/auto%20create%20report.png)

3. Since the table is a dimension and there are no measures in it, Power BI creates a measure for the row count and aggregates it across different columns, and creates different charts as shown in the following image. You can save this report for the future by selecting Save from the top ribbon. You can make more changes to this report to meet your requirement by including or excluding other tables or columns.

    ![Results](../Images/Auto%20created%20report%20results.png)

4. When closing the report you can save it

[**Go to the next step**](/FromZeroToHero_Parma/Analytics%20-%20How%20To%20Proceed/4_Ingest_Data_Using_Pipeline.md)
