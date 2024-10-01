# Yelp - What influences consumer ratings?
This projects examines the influence of specific business attributes on the consumer rating of businesses. We created a model to predict the relative impact of specific business attributes that are listed on Yelp on consumer ratings on Yelp of these business. 

![Alt text](https://business.yelp.com/wp-content/uploads/2021/07/yelp-logo_768x512.png)

## Research Motivation
In the digital age, consumer ratings and online reviews have become one of the most influential sources of information in shaping consumer expectations and purchase decisions. This means that in the increasingly competitive digital market it is critical to understand which business attributes are drivers for positive and negative consumer ratings. In order to find these attributes that are drivers of consumer rating, we exploit a large open dataset created by Yelp.

Yelp serves as a public forum where consumers can share their experiences and evaluate business. With Yelp's widespread use in the recreation industries like restaurants, retail, and services, it is one of the top online website consumers visit for a trustworthy review. The dataset of Yelp provides use with various variables (including the name, location, category, attributes, ratings, etc.) of over 150,000 businesses across the United States of America. By analyzing this data we hope to find managerial insights, that will make us understand the importance of specific business attributes for the online consumer reviews.

This research emphasizes the importance of using data to drive business decisions, rather than relying on anecdotal feedback or industry trends. This aligns with the growing trend toward data-driven marketing, where decisions are based on hard evidence rather than intuition.

### Research Question
*Which business attributes have the strongest impact on Yelp's consumer ratings within the United States of America?*

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
We are going to analyse the influence of specific business attributes on consumer ratings on Yelp. Since the dependent variable, the consumer rating of business measured in stars, is an ordinal variable, we will perform an ANOVA analysis. Firstly, we will recode the variable 'attribute' into separate dummy variables for each attribute, indicating whether each business possesses that attributes or not (1 if possessed, 0 if not). Then we will design our ANOVA model by regressing the dependent variable 'stars' on all these previously created attribute dummy variables to find the relative impact of each attribute on the consumer ratings.

## Relevence
The findings of this research have several important implications for marketing strategies. First of all it could enhance customer experience by identifying key drivers of high ratings. Businesses could focus on improving the attributes that are found to have a high effect on consumer ratings, which will allow for more targeted improvements rather than broad inefficient changes. The insights of this research could also strengthen a company's branding and communication strategy. If specific attributes are found to be significantly important for higher consumer ratings, businesses can highlight these attributes in their promotional material to attract more consumers.

## Prediction Model

## Repository Overview

### Structure of the Repository

```
├── data_converter
├── src
│   ├── Analysis
│   ├── DataExploration
│   └── Output
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

### Step-by-Step

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
4. Use the makefile to run all source code by typing the following command:
```
make
```
5. The code will run and will generate all output. New folders will be generated called 'data' (containing all the raw and cleaned/prepared data) and 'gen' (containing all generated output). The 'gen' folder will contain the actual output of the project, including the results of the analysis and data exploration visualizations.

## Authors
This repository is produced by Team 4 of the course Data Preperation & Workflow Management taught by Hannes Datta at Tilburg University. This course is part of the Master's program Marketing Analytics. The teammembers and authors of this repository:
- Claudia van Hoof ([c.m.m.vanhoof@tilburguniversity.edu](mailto:c.m.m.vanhoof@tilburguniversity.edu))
- Beste Özyürekoğlu ([b.ozyurekoglu@tilburguniversity.edu](mailto:b.ozyurekoglu@tilburguniversity.edu))
- Lucía Ramos Dominguez ([l.ramos@tilburguniversity.edu](mailto:l.ramos@tilburguniversity.edu))
- Ashley Saarloos ([a.saarloos@tilburguniversity.edu](mailto:a.saarloos@tilburguniversity.edu))
