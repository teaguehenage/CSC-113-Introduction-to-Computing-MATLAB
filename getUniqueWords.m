function [uniqueWords] = getUniqueWords(theWords)
%determines the unique words and their frequencies 
% Input:  theWords is a Cell Array of ALL the words (cleaned, stopwords removed)
%                  from a specific story
% Returns: uniqueWords is a Structure Array that has only the sorted alphabetically
%                  UNIQUE words with two fields: word & frequency
% NOTE: YOU DON'T HAVE TO MODIFY THIS FUNCTION, just use it!

%get the unique words
[onlyUnique,~,idx] = unique(theWords);
%count their frequencies
numOccurrences = histcounts(idx,numel(onlyUnique));

%create the structure array
numUniqueWords = length(onlyUnique);
[uniqueWords(1:numUniqueWords).word] = onlyUnique{:};
wordOccurrences = num2cell(numOccurrences);
[uniqueWords(1:numUniqueWords).frequency] = wordOccurrences{:};

%sort the words alphabetically
[~, indx] = sort({uniqueWords.word});
uniqueWords = uniqueWords(indx);

end

