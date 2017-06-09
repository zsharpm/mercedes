

library(caret)

ctrl <- trainControl(
  method = "cv",
  number = 5,
  allowParallel = TRUE
)

mdl1 <- train(
  y ~ .,
  data = train_df %>% select(-ID) %>% select_if(function(col) !is.character(col)),
  method = "rpart",
  trControl = ctrl,
  tuneLength = 5L
)

mdl1

rf_grid <- data.frame(mtry = c(5, 10, 15, 20, 25))

mdl2 <- train(
  y ~ .,
  data = train_df %>% select(-ID) %>% select_if(function(col) !is.character(col)),
  method = "rf",
  trControl = ctrl,
  tuneGrid = rf_grid,
  ntree = 100L,
  importance = TRUE
)

mdl2

ggplot(varImp(mdl2))

mdl3 <- train(
  y ~ .,
  data = train_df %>% select(-ID) %>% select_if(function(col) !is.character(col)),
  method = "glmnet",
  trControl = ctrl,
  tuneLength = 5L
)

mdl3
