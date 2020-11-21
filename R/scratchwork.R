library (tidyverse)


sw_coef <- readr::read_csv ("sw_coefficients.csv")
sw_pval <- readr::read_csv ("sw_pvalues.csv")



set.seed(150)
nrep = 6
b0 = 5
b1 = -2
sigma = 2


ngroup = 2
group = rep( c("group1", "group2"), each = nrep)
eps = rnorm(n = ngroup*nrep, mean = 0, sd = sigma)
response = b0 + b1*(group == "group2") + eps
sim_dat = data.frame(group, response)
sim_dat


lin_reg <- lm (data = sim_dat, formula = response ~ group)
sum_lin <- summary (lin_reg)

sum_lin$residuals

n = nrow (sim_dat)

dat_coef <- na.omit (sw_coef[,as.character(n)])
dat_coef$diff = 0

sim_dat <- sim_dat %>%
  add_column (fitted_vals = lin_reg$fitted.values) %>%
  mutate (lm_residuals = response - fitted_vals)

ordered_residuals = sim_dat %>%
  select (lm_residuals) %>%
  # mutate (index = row_number()) %>%
  arrange (lm_residuals)

for (i in 1:(n/2)) {
  dat_coef$diff[i] = ordered_residuals$lm_residuals[(n - i + 1)] - 
    ordered_residuals$lm_residuals[i]
  print (n - i + 1)
  print (i)
    
}

dat_coef$a_diff = dat_coef[,1] * dat_coef[,2]
  
b = sum (dat_coef[,3])

SS =  sum( (sim_dat[,4] - mean(unlist(sim_dat[,4] )) )^2 )

W = (b^2)/SS

p_02 <- unlist(sw_pval[n,2])
p_05 <- unlist (sw_pval[n,3])

p_val <- .05 - ((.03)*(p_05 - W)/(p_05 - p_02))
alpha = 0.05
reject_decision <- ifelse (p_val <= alpha, "yes", "no")
