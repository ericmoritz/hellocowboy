%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(hello_world_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", toppage_handler, []}
		]}
	]),
        ListenPort = list_to_integer(os:getenv("PORT")),

        error_logger:info_msg("Listening on port ~p~n", [ListenPort]),

	{ok, _} = cowboy:start_http(http, 100, [{port, ListenPort}], [
		{env, [{dispatch, Dispatch}]}
	]),
	hello_world_sup:start_link().

stop(_State) ->
	ok.
