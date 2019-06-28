function line = evoCreateLine(varargin)
% Create a Line with the symbol repeatedly printed.
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
line = repmat(symbol, 1, lenLine);
end
