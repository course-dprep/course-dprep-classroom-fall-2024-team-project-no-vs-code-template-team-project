# Yelp - What influences consumer ratings?
This projects examines the influence of specific business categories on the consumer rating of businesses. We created a model to predict the relative impact of specific business categories that are listed on Yelp on consumer ratings on Yelp of these business. 

![Alt text](https://business.yelp.com/wp-content/uploads/2021/07/yelp-logo_768x512.png)

## Research Motivation
In today's digital landscape, consumer ratings and online reviews are of importance in shaping expectations and driving purchase decisions. As people increasingly rely on online reviews, understanding the business categories that influence positive and negative consumer ratings has become vital for businesses navigating the competitive digital marketplace. By identifying these categories, businesses can refine their offerings to better align with consumer preferences and improve their online reputation. This research leverages a comprehensive open dataset from Yelp, which serves as a major platform where consumers can share experiences and evaluate businesses. With its strong presence across various recreational industries (including restaurants, retail, and services). Yelp has established itself as a trusted source for review-based feedback.

The Yelp dataset provides a wealth of information on over 150,000 businesses across the United States, capturing details such as business name, location, category, attributes, and consumer ratings, used as variables in this research. By analyzing this extensive dataset, we aim to extract valuable insights into which business categories drive consumer ratings. These insights can empower business managers to adopt a data-driven approach, going beyond anecdotal evidence and moving toward strategic, evidence-based decision-making. This shift aligns with the growing trend of data-driven marketing, where decisions are rooted in robust analysis rather than intuition, further underscoring the importance of data analytics in today’s business environment.

Several academic studies support the notion that data-driven decision-making can significantly enhance business performance. For instance, McAfee et al. (2012) highlight how data-driven approaches provide businesses with a competitive advantage by facilitating improved decision-making processes. Similarly, Akter and Wamba (2016) emphasize that data analytics can enhance operational efficiency and customer satisfaction in various service industries. Furthermore, Luca (2016) discusses the critical role of online reviews in consumer decision-making and how they can influence a business's financial performance. These studies underscore the need for a nuanced understanding of consumer ratings, and our research aims to contribute to this understanding by focusing on business categories as primary drivers of consumer feedback.

### Research Question
*Which business categories drive higher consumer ratings on Yelp in the United States?*

This study aims to identify which business categories drive higher consumer ratings on Yelp in the United States. By examining these categories, the research provides critical insights into consumer expectations, allowing businesses to prioritize specific attributes that resonate with their target audience. For example, restaurants might focus on service and ambiance, while fitness centers may emphasize convenience and accessibility. 

Furthermore, this study supports a data-driven approach to business strategy, leveraging Yelp reviews as a valuable source of information. In an increasingly digital market, understanding category-specific drivers of satisfaction enables businesses to strategically enhance their offerings and improve their online reputations.

## Data
The data incorporated in this research is an open dataset provided by Yelp. This dataset includes various business variables, such as names, opening hours, addresses, star reviews, and attributes, of more than 150,000 recreational businesses in the United States of America. These businesses have a extremely broad range of categories, from massage saloons to casinos, and from cheese tastings to tattoo shops. This widespread of types of business allows us to analyse the influence of specific business attributes on consumer ratings on a very broad level. This means that our findings are implementable by a broad range of businesses and industries.

The table below shows the variables within the raw dataset including a brief description of each of the variables. The variables are in order of how the original dataset is built:

|Variable                        |Description                                                                                     |
|--------------------------------|------------------------------------------------------------------------------------------------|
|business_id                      |The unique Yelp id for each registered business                                               |
|hours                            |The opening hours of the business, using a 24hr clock                                         |
|postal_code                   |The postal code of the business                                                                 |
|is_open                       |A dummy variable that indicates if the business is permanently closed, 0 implies permanently closed and 1 implies open for business           |
|accommodates                    |The maximum capacity of the listing                                                            |
|address                     |The address of the business                                                                        |
|categories                   |A list of Yelp business categories the business is classified as                                  |
|latitude                    |The geographical latitude of the business                                                         |
|city                        |The city the business is located in                                                                |
|longitude                   |The geographical longitude of the business                                                         |
|state                       |The American stat the business is located in                                                      |
|review_count               |The number of Yelp reviews the business has                                                       |
|name                        |The name of the business                                                                          |
|stars                        |The business rating in stars, ranges between 0-5 and is rounded to half-stars                |   
|attributes                    |A list of Yelp business attributes and whether the business has this attributes or not        |   

If there is a need to download the Yelp dataset used for this research, the dataset can be downloaded [here](https://drive.google.com/drive/folders/1ioJVCsr5pJ5tAa2dPJ9yxIvL6rYmDSl1?usp=sharing) (yelp_academic_dataset_business.csv)

## Research Method
We are going to analyse the influence of specific business categories on consumer ratings on Yelp. Since the dependent variable, the consumer rating of business measured in stars, is an ordinal variable, we will perform an ANOVA analysis. Firstly, we will recode the variable 'category' into separate dummy variables for each category, indicating whether each business pertains to that category or not (1 if pertains, 0 if not). Then we will design our ANOVA model by regressing the dependent variable 'stars' on all these previously created category dummy variables to find the relative impact of each category on the consumer ratings.

## Conceptual model 



## Relevance
The findings of this research have several important implications for marketing strategies. First of all it could enhance customer experience by identifying key drivers of high ratings. Businesses could focus on working towards being part of certain categories that are found to have a high effect on consumer ratings, which will allow for more targeted improvements rather than broad inefficient changes. The insights of this research could also strengthen a company's branding and communication strategy. If specific categories are found to be significantly important for higher consumer ratings, businesses can highlight being part of these categories in their promotional material to attract more consumers.

## Prediction Model

## Repository Overview

### Structure of the Repository

```
├── data_converter
├── src
│   ├── Analysis
│   ├── DataExploration
│   └── DataPreparation
├── .gitignore
├── LICENSE
├── README.md
└── makefile
```

## Dependencies

Please follow the installation guides on [Tilburg Science Hub](http://tilburgsciencehub.com/). To run this project, the following software is needed:

- R and RStudio ([installation guide](https://tilburgsciencehub.com/topics/computer-setup/software-installation/rstudio/r/))
- Make ([installation guide](https://tilburgsciencehub.com/topics/automation/automation-tools/makefiles/make/))

To run this project, the following R packages are mandatory:

```
googledrive
readr
data.table
dplyr
tidyr
grid
gridExtra
ggplot2

```
The packages will automatically be installed when running the makefile of the project, but if wanted the packages can also be installed using the ```install.packages``` command.

## Running the Code

### Root Makefile Step-By-Step

To run the code, follow these instructions:

1. Fork this repository
2. Open your command line / terminal and run the following code:
```
git clone https://github.com/{your username}/consumer-rating-insights-Yelp.git
```
3. Set your working directory to consumer-rating-insigts-Yelp by typing the following command:
```
cd consumer-rating-insights-Yelp
```
4. Run the makefile to run all source code by typing the following command:
```
make
```
5. The code will run and will generate all output. New folders will be generated called 'data' (containing all the raw and cleaned/prepared data) and 'gen' (containing all generated output). The 'gen' folder will contain the actual output of the project, including the results of the analysis and data exploration visualizations.

### Run Seperate Makefiles Step-By-Step

It is also possible to run the makefiles of the the underlying folders DataPreparation and DataExploration separately. If only in need of interesting visualization produces by the data exploration, for example, solely run the data exploration makefile. To do so:

1. Fork this repository
2. Open your command line / terminal and run the following code:
```
git clone https://github.com/{your username}/consumer-rating-insights-Yelp.git

1. Set the working directory to the folder of which the makefile should be run (in this example DataExploration):
```
cd src/DataExploration
```
2. Run the makefile to run all source code by typing the following command:
```
make
```
3. The code will run and will generate all output of the data exploration, stored in the folders 'data' and 'gen' in the main directory. Not that, in order to run the analysis makefile seperately, the data preperation makefile should be run first!
```
## Authors
This repository is produced by Team 4 of the course Data Preparation & Workflow Management taught by Hannes Datta at Tilburg University. This course is part of the Master's program Marketing Analytics. The team members and authors of this repository:

| Author                                      | Contact                                     | 
|---------------------------------------------|---------------------------------------------|
| **Claudia van Hoof**                        | c.m.m.vanhoof@tilburguniversity.edu         |
| **Beste Özyürekoğlu**                       | b.ozyurekoglu@tilburguniversity.edu         |
| **Lucía Ramos Domínguez**                   | l.ramos@tilburguniversity.edu               |
| **Ashley Saarloos**                         | a.saarloos@tilburguniversity.edu            |

## References 
- Akter, S., & Wamba, S. F. (2016). Big data analytics in E-commerce: A systematic review and agenda for future research. Electronic Markets, 26(2), 173-194.
- McAfee, A., Brynjolfsson, E., Davenport, T. H., Patil, D. J., & Barton, D. (2012). Big data. The management revolution. Harvard Business Review, 90(10), 60-68.
- Luca, M. (2016). Reviews, reputation, and revenue: The case of Yelp.com. Harvard Business School NOM Unit Working Paper, (12-016). 