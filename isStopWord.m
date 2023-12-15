function stopWord = isStopWord(stopWords,word)
% changes a word to lowercase and then determines if a word is a stopword
% INPUTS:
%  stopWords - is a Cell Array that contains all the words from
%             the file stopWords.txt
%  word - is a Character Array
% RETURNS:
%  stopWord - is logical(1)/TRUE if word IS a stopword otherwise it is
%             logical(0)/FALSE if it is NOT a stopword

% convert word to lowercase
word = lower(word);

% logical value to check  if word is a stop word
stopWord = any(ismember(word,stopWords));

end