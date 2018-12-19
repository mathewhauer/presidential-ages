###------LoadCleanData-----
## @knitr LoadCleanData

# Read the age data for the associations.
dat <- read.xlsx("DATA/presidents.xlsx", sheet = 1) %>%
  mutate(AgeAtPres_direct = ElectionYear - Birthyear, # Calculating the Direct Age
         AgeAtPres_est = ElectionYear - (BAyear-22), # Estimating the age based on BA Year completion.
         AGE = if_else(is.na(AgeAtPres_direct), AgeAtPres_est, AgeAtPres_direct)) %>% # Selecting BA Age if Direct Age is not present.
  group_by(Association, Sex) %>% # Grouping to find youngest pres by gender in each Association. Used for labeling.
  mutate(l = if_else(AGE ==  min(AGE, na.rm =T), paste0(President, " (", ElectionYear, "): ", AGE),"")) %>%
  ungroup()

# New object to calculate the % of presidents who are female.
fems <- dat %>%
  group_by(Association, Sex) %>%
  tally() %>% # Getting the # by Association and Gender.
  group_by(Association) %>%
  mutate(percentage = percent(n / sum(n)), # Calculating the % of each Associationg
         label = paste0(Association, " Female Presidents: ", n, " (", percentage,")\n")) %>% # Creating the label
  ungroup() %>%
  filter(Sex == "Female") # Selecting just Female rows.

fems2 <- paste(pull(fems, label)) # Turning the vector into a single text string.
