# ADM_HW5_G16

**Important Note**

To work with this file please download it and use it locally in a folder with the dataset from kaggle, it will automatically create 489 intermediate csv files and a final csv file with the pandas dataframe that is more easily loadable. Make sure you work in a folder because it *will* get cluttered very quickly. The files were too big to push to the repository.

**GROUP 16 MEMBERS**

Elias Antoun       antoun.2128572@studenti.uniroma1.it

Simay Caliskan     simaycaliskan13@gmail.com

Erika Zetu         zetu.1888659@studenti.uniroma1.it

Matteo Grimaldi    grimaldi.1849945@studenti.uniroma1.it

**Part 1**

We loaded the dataset in chunks of 1000, saving intermediate results as csv files and then merged all of them together into a final_data.csv file, to avoid the repeated memory errors when trying to implement other methods. The dataframe was then build using that final csv file and the top 10000 papers were taken to be worked with, as requested in the given. This is followed by building 2 graphs: a directed and unweighted citation graph, and a weighted and undirected collaboration graph using networkx. Finally we have included some explorative visualizations and random sample graphs.

**Part 2.1**
We used the top 10000 papers dataframe. The functions are constructed to work with the appropriate inputs.

**CLQ**
The task is done on AWS. Before moving to the command line, edges and betweenness centrality information of the citation graph are exportes as csv files. The screenshot of the outputs is available as well as the .sh file.

