library(tidyverse)
library(forcats)

train_df <- read_csv("data/train.csv") %>% mutate(set = "train")
test_df <- read_csv("data/test.csv") %>% mutate(set = "test")
sample_submission <- read_csv("data/sample_submission.csv")

all_df <- train_df %>% bind_rows(test_df) %>%
  mutate_if(is.character, as.factor) %>%
  mutate_if(is.factor, function(col) fct_lump(col, n = 4L, other_level = "other"))

train_df <- all_df %>% filter(set == "train") %>% select(-set)
test_df <- all_df %>% filter(set == "test") %>% select(-set)

