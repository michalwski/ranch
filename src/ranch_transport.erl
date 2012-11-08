%% Copyright (c) 2012, Loïc Hoguin <essen@ninenines.eu>
%%
%% Permission to use, copy, modify, and/or distribute this software for any
%% purpose with or without fee is hereby granted, provided that the above
%% copyright notice and this permission notice appear in all copies.
%%
%% THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
%% WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
%% MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
%% ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
%% WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
%% ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
%% OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

%% @private
-module(ranch_transport).

-export([behaviour_info/1]).

%-type socket() :: any().
%-type opts() :: any().

behaviour_info(callbacks) ->
[
%% Name of the transport.
{name, 0},
%-callback name() -> atom().

%% @todo -callback caps(secure | sendfile) -> boolean().

%% Atoms used to identify messages in {active, once | true} mode.
{messages,0},
% -callback messages() -> {OK::atom(), Closed::atom(), Error::atom()}.

%% Listen for connections on the given port number.
%%
%% Calling this function returns a listening socket that can then
%% be passed to accept/2 to accept connections.
%%
%% Available options may vary between transports.
%%
%% You can listen to a random port by setting the port option to 0.
%% It is then possible to retrieve this port number by calling
%% sockname/1 on the listening socket. If you are using Ranch's
%% listener API, then this port number can obtained through
%% ranch:get_port/1 instead.
{listen,1},
% -callback listen(opts()) -> {ok, socket()} | {error, atom()}.

%% Accept connections with the given listening socket.
{accept,2},
% -callback accept(socket(), timeout())
%	 -> {ok, socket()} | {error, closed | timeout | atom() | tuple()}.

%% Experimental. Open a connection to the given host and port number.
{connect,3},
% -callback connect(string(), inet:port_number(), opts())
% 	-> {ok, socket()} | {error, atom()}.

%% Receive data from a socket in passive mode.
{recv,3},
% -callback recv(socket(), non_neg_integer(), timeout())
% 	-> {ok, any()} | {error, closed | timeout | atom()}.

%% Send data on a socket.
{send,2},
% -callback send(socket(), iodata()) -> ok | {error, atom()}.

%% Set options on the given socket.
{setopts,2},
% -callback setopts(socket(), opts()) -> ok | {error, atom()}.

%% Give control of the socket to a new process.
%%
%% Must be called from the process currently controlling the socket,
%% otherwise an {error, not_owner} tuple will be returned.
{controlling_process,2},
% -callback controlling_process(socket(), pid())
% 	-> ok | {error, closed | not_owner | atom()}.

%% Return the remote address and port of the connection.
{peername,1},
% -callback peername(socket())
% 	-> {ok, {inet:ip_address(), inet:port_number()}} | {error, atom()}.

%% Return the local address and port of the connection.
{sockname,1},
% -callback sockname(socket())
% 	-> {ok, {inet:ip_address(), inet:port_number()}} | {error, atom()}.

%% Close the given socket.
{close,1}
% -callback close(socket()) -> ok.
].