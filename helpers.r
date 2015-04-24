# helper.r

# ... seems that I need to use vectorization to do this 
# you can see the commented code which did not work because the comparison
# statement can only take care of length-1 value and therefore only the firest
# comparison value will be return
# master's degree or higher
# num of master

prob_m = function(m_num, t_num, cap, m_cap){
  prob = numeric(length(m_num))
  idx_t = which(m_num<=m_cap)
  idx_f = which(m_num>m_cap)
  prob[idx_t] = 1
  prob[idx_f] = 1-(1-m_cap/m_num[idx_f])*(1-cap/(t_num-m_cap))
  return(prob)
}


