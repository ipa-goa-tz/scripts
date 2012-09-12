function octave_settings(mode)
% --Function File: octave_settings(mode)
%
%   Function is used to call standard commands
%   usually when starting a script.
%
%   Supports modes:
%   	- DEFAULT
%   	- 
%
%   octave_settings()
%   When called without argument, mode is set to
%   DEFAULT 
%
%–––––––– goa-tz - 2012/06/15––––––––––––––––––––––

if(nargin == 1)
	if(isempty(mode)==1)
	mode="DEFAULT";
	end
    if(strcmp(mode,"SHORT")==1)
        mode="SHORT"
    end
end

if(nargin==0)
	mode="DEFAULT";
end


switch mode

case "DEFAULT"
	

	clc;
	close all;
    clear all;
	format long g;


case "SHORT"
    clc;
    close all;
    clear all;
    format short;
otherwise
	fprintf("ERROR - supported modes: DEFAULT,SHORT\n")
endswitch
	
	





