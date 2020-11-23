

#' Perform Shapiro-Wilk Test
#'
#' @param x a vector of values
#'
#' @return value of W statistic
#' @export
#'
#' @examples
#' sw_test (rnorm (rnorm (100, 0, 1)))
sw_test <- function (x) {
 
  
  n = length (x)
  
  dat_coef <- na.omit (sw_coef[,as.character(n)])
  dat_coef$diff = 0
  
  
  ordered_vals = sort (x)
  
  for (i in 1:(n/2)) {
    dat_coef$diff[i] = ordered_vals[(n - i + 1)] - 
      ordered_vals[i]
    
  }
  
  
  
  dat_coef$a_diff = dat_coef[,1] * dat_coef[,2]
  
  b = sum (dat_coef[,3])
  
  SS =  sum( (ordered_vals - mean(ordered_vals) )^2 )
  
  W = (b^2)/SS
  
  p_02 <- unlist(sw_pval[n,2])
  p_05 <- unlist (sw_pval[n,3])
  
  p_val <- .05 - ((.03)*(p_05 - W)/(p_05 - p_02))
  alpha = 0.05
  reject_decision <- ifelse (p_val <= alpha, "yes", "no")
  
  # print ("Shapiro-Wilk Test of Normality")
  # print (paste0("W = ", W, ", p = ", p_val))
  # print (paste0 ("Reject? ", reject_decision))
  return (W)
  
}
