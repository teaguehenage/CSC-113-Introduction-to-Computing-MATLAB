function topTenWords = getTopTenWords(uniqueWords)
%determines the top ten most frequent words
% Input: uniqueWords is a Structure Array that has sorted alphabetically
%             UNIQUE words with two fields: word & frequency
% Return: a 1x10 Structure Array of the most frequent words
% NOTE: YOU DON'T HAVE TO MODIFY THIS FUNCTION, just use it!

topNum = 10;

if length(uniqueWords) > topNum
    %get the counts
    theCounts = [uniqueWords.frequency];
    
    %sort the counts
    [~, indx] = sort(theCounts, 'descend');
    
    %now sort the structure array
    uniqueWords = uniqueWords(indx);
    
    %get top ten most frequent words
    topTenWords = uniqueWords(1:topNum);
else
    fprintf('Error: there are less than 10 unique words.\n');
end

end

