source(here::here("R/package_loading.R"))

glimpse(NHANES)

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

NHANES %>%
  colnames() %>%
  length()

NHANES %>%
  mutate(Height = Height / 100,
         Testing = "yes",
         Highlyactive = if_else(
           PhysActiveDays<=5,
           "yes",
           "no"
         ))

NHANES_updated <- NHANES %>%
  mutate(UrineVolaverage = (UrineVol1 * UrineVol2) / 2)

# Check the names of the variables
colnames(NHANES)

# Pipe the data into mutate function and:
NHANES_modified <- NHANES %>% # dataset
  mutate(
    UrineVolAverage = (UrineVol1 + UrineVol2) / 2,
    Pulse = Pulse/60,
    YoungChild = if_else(Age <= 6, TRUE, FALSE))
head(NHANES_modified$UrineVolAverage)

# Selecting Variables -----------------------------------------------------

NHANES %>%
  select(Gender, BMI) #to exclude, just add a '-' sign in front of the variable name
  select (starts_with("smoke"),
          contains("Vol"),
          matches("[123]"))

NHANES %>%
  rename (
    #NewName = OldName
    NumberBabies = nBabies,
    Sex = Gender
    )

NHANES %>%
  filter(Gender != "female" & BMI == 25)

NHANES %>%
  arrange(desc(Age), Gender) %>%
  select(Age, Gender)

# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter(BMI >= 20 & BMI <= 40 & Diabetes == 'Yes')

# 2. Working or renting, and not diabetes
NHANES %>%
  filter((Work == "Working" | HomeOwn == "Rent") & Diabetes != "Yes") %>%
  select(Age, Gender, Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
NHANES %>%
  arrange(desc(nBabies)) %>%
  select(Age, nBabies)

# Group by and Summarise --------------------------------------------------

NHANES %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MinBMI = min(BMI, na.rm = TRUE))

NHANES %>%
  group_by(Gender, Work) %>%
  summarise(
    MeanBMI = mean(BMI, na.rm = TRUE),
    MeanAge = mean(Age, na.rm = TRUE)
    )

# Conversion to Long Form -------------------------------------------------

table4b %>%
  gather(year, population, -country) #arguments are new column names, country as identifier

table4b %>%
  gather(year, population, `1999`, `2000`)

nhanes_simple <- NHANES %>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)

nhanes_long <- nhanes_simple %>%
  gather(Measure, Value, -SurveyYr, -Gender)

nhanes_long %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(MeanValue = mean(Value, na.rm = TRUE))

table2 %>%
  spread(type, count)

nhanes_summary <- NHANES %>%
  spread(SurveyYr, MeanValue)


nhanes_wrnagled <- NHANES %>%
  mutate(MoreThan5DaysActive = if_else())



