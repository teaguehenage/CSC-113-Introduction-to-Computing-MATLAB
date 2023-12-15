function newWord = cleanWord(word)
%"cleans' up a word for a wordcloud
% Input: word is a char array to be cleaned up
%        1)change to lower case
%        2)remove all characters that are not letters
% Return: newWord is the cleaned up word

% covert the word tolowercase
word = lower((word));

% convert char array word into double array in ASCII
wordASCII = double(word);

% vectorized logical indexing
wordIndex = (wordASCII >= 97 & wordASCII <= 122);

% index non letter numbers out of wordASCII
wordASCII = wordASCII(wordIndex);

% convert ASCIII array back into character array
newWord = char(wordASCII);

end