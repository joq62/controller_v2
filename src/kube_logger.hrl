%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%% 
%%% Created : 10 dec 2012 
%%% -------------------------------------------------------------------
-define(Logger(Info),[{date,date()},{time,time()},
		      {module,?MODULE},
		      {function_name,?FUNCTION_NAME},
		      {line,?LINE},
		      {node,node()},
		      {info,Info}]).

-define(KubeLog(Severity,Info),
	{Severity,
	 date(),
	 time(),
	 ?MODULE,
	 ?FUNCTION_NAME,
	 ?LINE,
	 node(),
	 Info}).
