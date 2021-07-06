%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description :  
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(mylog_test).   
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include("src/kube_logger.hrl").
%-include_lib("eunit/include/eunit.hrl").
%% --------------------------------------------------------------------

%% External exports
-export([start/0]). 


%% ====================================================================
%% External functions
%% ====================================================================


%% --------------------------------------------------------------------
%% Function:tes cases
%% Description: List of test cases 
%% Returns: non
%% --------------------------------------------------------------------
start()->
    io:format("~p~n",[{"Start setup",?MODULE,?FUNCTION_NAME,?LINE}]),
    ok=setup(),
    io:format("~p~n",[{"Stop setup",?MODULE,?FUNCTION_NAME,?LINE}]),

%    io:format("~p~n",[{"Start pass_0()",?MODULE,?FUNCTION_NAME,?LINE}]),
%    ok=pass_0(),
 %   io:format("~p~n",[{"Stop pass_0()",?MODULE,?FUNCTION_NAME,?LINE}]),

    io:format("~p~n",[{"Start pass_1()",?MODULE,?FUNCTION_NAME,?LINE}]),
    ok=pass_1(),
    io:format("~p~n",[{"Stop pass_1()",?MODULE,?FUNCTION_NAME,?LINE}]),

    io:format("~p~n",[{"Start pass_2()",?MODULE,?FUNCTION_NAME,?LINE}]),
    ok=pass_2(),
    io:format("~p~n",[{"Stop pass_2()",?MODULE,?FUNCTION_NAME,?LINE}]),

    io:format("~p~n",[{"Start pass_3()",?MODULE,?FUNCTION_NAME,?LINE}]),
    ok=pass_3(),
    io:format("~p~n",[{"Stop pass_3()",?MODULE,?FUNCTION_NAME,?LINE}]),

  %  io:format("~p~n",[{"Start pass_4()",?MODULE,?FUNCTION_NAME,?LINE}]),
  %  ok=pass_4(),
  %  io:format("~p~n",[{"Stop pass_4()",?MODULE,?FUNCTION_NAME,?LINE}]),

  %  io:format("~p~n",[{"Start pass_5()",?MODULE,?FUNCTION_NAME,?LINE}]),
  %  ok=pass_5(),
  %  io:format("~p~n",[{"Stop pass_5()",?MODULE,?FUNCTION_NAME,?LINE}]),
 
    
   
      %% End application tests
    io:format("~p~n",[{"Start cleanup",?MODULE,?FUNCTION_NAME,?LINE}]),
    ok=cleanup(),
    io:format("~p~n",[{"Stop cleaup",?MODULE,?FUNCTION_NAME,?LINE}]),
   
    io:format("------>"++atom_to_list(?MODULE)++" ENDED SUCCESSFUL ---------"),
    ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
pass_0()->
    mylog:log(loginfo),
    mylog:alarm(alarminfo),
    mylog:ticket(ticketinfo),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------


pass_1()->
    {ok,_}=kube_logger:start(),
    ok=kube_logger:log(?Logger("System restarted")),
    ok=kube_logger:ticket(?Logger("check cluster status")),
    ok=kube_logger:alarm(?Logger("lost host c1")),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
pass_2()->
    ok=kube_logger:file_log(?Logger("System restarted")),
    ok=kube_logger:file_ticket(?Logger("check cluster status")),
    ok=kube_logger:file_alarm(?Logger("lost host c1")),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 ,mylog_test,start,
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
pass_3()->
    db_logger:install([node()]),
    application:start(mnesia),
    timer:sleep(100),
    {atomic,ok}=db_logger:create(?KubeLog(log,"log1")),
    {atomic,ok}=db_logger:create(?KubeLog(log,"log1")),

    glurk=db_logger:severity(log),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
pass_4()->
  
    ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
pass_5()->
  
    
    ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
-define(APP,kubelet). 
setup()->
   
    ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------    

cleanup()->
  
    application:stop(controller),
    ok.
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------