function generateReport(storyTitle,numUniqueWords,topTenWords)
%uses the word data to create a report for specific story
% Input: numUniqueWords - integer for the number of unique words
%                         in the story being analyzed
%        topTenWords - a 1x10 Structure Array of the most frequent words
% Output: a report stored in a .txt file called storyReport.txt

% convert structure fields into arrays
words = {topTenWords.word};
frequency = [topTenWords.frequency];

% creates an output text file
storyReport = fopen("storyReport.txt","w");

% print title statment
fprintf(storyReport,"Story Analyzed: %s\n",storyTitle);

% print unique words
fprintf(storyReport,"Total Unique Words: %d\n",numUniqueWords);

% print list and loop
fprintf(storyReport,"Frequency, Word\n");
for i = 1:10
    fprintf(storyReport,"%d, %s\n", frequency(1,i), words{1,i});
end

%close file
fclose(storyReport);
end