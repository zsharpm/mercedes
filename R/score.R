
preds <- bind_cols(test_df %>% select(ID), tibble(y = predict(mdl1, newdata = test_df)))
preds <- bind_cols(test_df %>% select(ID), tibble(y = predict(mdl2, newdata = test_df)))
preds <- bind_cols(test_df %>% select(ID), tibble(y = predict(mdl3, newdata = test_df)))

write_csv(preds, "results/pred.csv")
