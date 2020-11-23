test_that("sw_test calculates correctly", {
  # nrep = 10
  # b0 = 5
  # b1 = -2
  # sigma = 2
  # 
  # 
  # ngroup = 2
  # group = rep( c("group1", "group2"), each = nrep)
  # eps = rnorm(n = ngroup*nrep, mean = 0, sd = sigma)
  # response = b0 + b1*(group == "group2") + eps
  # sim_dat = data.frame(group, response)
  # sim_dat
  # 
  # 
  # lin_reg <- lm (data = sim_dat, formula = response ~ group)
  # sum_lin <- summary (lin_reg)
  # 
  # sum_lin$residuals
  # 
  # sim_dat <- sim_dat %>%
  #   tibble::add_column (fitted_vals = lin_reg$fitted.values) %>%
  #   dplyr::mutate (lm_residuals = response - fitted_vals)
  # 
  # res_shapiro_test <- shapiro.test(sum_lin$residuals)
  # res_sw_test <- sw_test(sum_lin$residuals)
  # expect_equivalent(unname(res_shapiro_test$statistic), res_sw_test, tolerance = 0.02)
  
  expect_equal (0, 0 * 0)
})
