function [] =  local_sqp(f,c,x,lam, initial_x, initial_lam)
	
	grad_f = gradient(f)
	A = jacobian(c,x)

	F = [gradient(f,x)-A'*lam; c];
	Fj = jacobian(F,[x;lam])
	
	xk = initial_x;
	lk = [0;0;0]
	
	while 1==1
		Fk = subs(Fj,[xk;lk])
		grad_fk = subs(grad_f,xk)
		ck = subs(c,xk)
		sol = inv(Fk)*-[Fk, ck]
		xk = xk + sol(1:5,1)
		lk = lk + sol(6:8,1)
	end
	
end
