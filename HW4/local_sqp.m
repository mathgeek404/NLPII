function [] =  local_sqp(f,c,x,lam, initial_x, initial_lam)
	A = jacobian(c,x)
	H = hessian(f,[x,lam])
end
