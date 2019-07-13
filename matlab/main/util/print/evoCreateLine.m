function line = evoCreateLine(varargin)
% Create a Line with the symbol repeatedly printed.
%
% Input ->
%   symbol  : symbol needed to repeatedly print (char scalar)
%             optional, default: '#'
%   lenLine : times of repeating the symbol (integer scalar)
%             optional, default: 77
% Output <-
%   line    : a set of the same symbol (row char vector)
if nargin == 0
    lenLine = 77; % just a number preferred by the designer of this library
    symbol = '#'; % just a symbol preferred by the designer of this library
elseif nargin == 1
    lenLine = varargin{1};
    symbol = '#';
elseif nargin == 2
    lenLine = varargin{1};
    symbol = varargin{2};
else
    error('accept at most two inputs.');
end

if ~isscalar(symbol) || ~ischar(symbol)
    error('`symbol` should be a char scalar.');
end
if ~evoCheckIsPosInt(lenLine)
    error('`lenLine` should be a positive integer.');
end

line = repmat(symbol, 1, lenLine);
end
