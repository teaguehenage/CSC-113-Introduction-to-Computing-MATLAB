% Name(s): Teague Henage
% Email(s): tghenage@ncsu.edu
% Date: 11/21/23
% Lab Section #208
% Project 3: Story Analyzer, Fall 2023
clc ;
clear ;
close('all')
%% Initializing Variables
%% Setup

% Print intro statment & Prompt and explain processes
fprintf(['----------------------------------\n' ...
    'Welcome to Children Story Analyzer\n' ...
    '----------------------------------\n' ...
    'Select a Game Mode:\n' ...
    '   [1] Create Visualization\n' ...
    '   [2] Create Story Report\n']);

% Prompt for Process
actionInput = input('Select Action: ');

% List GUI
% Peter Pan = 1, Peter Rabbit = 2, Snow Queen = 3, Three Bears = 4,
% Ugly Duckling = 5, Velveteen Rabbit = 6
book = listdlg('ListString',{'Peter Pan' 'Peter Rabbit'...
    'Snow Queen' 'Three Bears' 'Ugly Duckling' 'Velveteen Rabbit'});

%% Incorrect Input

if actionInput ~= 1 && actionInput ~= 2 %logic statement that acts if user input is not 1 or 2
    fprintf('Wrong input. Terminating Program\n') % Program termination statement
    return % Terminate program
end

%% Open & Convert Book

% switch case statment that opens the approptiate book and saves the name
switch book
    case 1 % Peter Pan
        fid = fopen("stories/peterPan.txt");
        storyTitle = 'Peter Pan';
    case 2 % Peter Rabbit
        fid = fopen("stories/peterRabbit.txt");
        storyTitle = 'Peter Rabbit';
    case 3 % Snow Queen
        fid = fopen("stories/snowQueen.txt");
        storyTitle = 'The Snow Queen';
    case 4 % Three Bears
        fid = fopen("stories/threeBears.txt");
        storyTitle = 'Three Bears';
    case 5 % Ugly Duckling
        fid = fopen("stories/uglyDuckling.txt");
        storyTitle = 'Ugly Duckling';
    case 6 % Velveteen Rabbit
        fid = fopen("stories/velveteenRabbit.txt");
        storyTitle = 'Velveteen Rabbit';
end

%textscan file & converts it into a single cell array
bookCell = textscan(fid,"%s","Delimiter"," "); bookCell = [bookCell{1}];

% Close File
fclose(fid);

% get number of words in bookCell
r = size(bookCell,1);
%%  Remove Stopwords
% open stopwords
fid = fopen("stopWords.txt");

% textscan file & converts it into a single cell array
stopWords = textscan(fid,'%s'); stopWords = [stopWords{1}];

% loop that checks if word is a stopword and remove it
for i = 1:r
    % cell array of logical values if not stopWord
    stopWordIndex(i) = ~isStopWord(stopWords,bookCell(i));
end

% remove stopwords from bookCell via logical indexing
bookCell = bookCell(stopWordIndex);

%% Clean Words

%loop that clears words with function cleanWord.m
r = size(bookCell,1); % initialize variable
for i = 1:r
    story{i} = (cleanWord(bookCell{i})); % cleans words
    storyIndex(i) = ~isempty(story{i}); % indexes empty arrays
end

% remove empty arrays
story = story(storyIndex);

%%  Unique Words & Top 10 Words

% use function getUniqueWords
uniqueWords = getUniqueWords(story);

% use function getTopTenWords
topTenWords = getTopTenWords(uniqueWords);

%% Create Visualization
if actionInput == 1
    % Word Cloud
    figure; % declare figure
    subplot(1,2,1); % set position of Word Cloud
    uniqueWordsTable = struct2table(uniqueWords); % convert structure to table
    wordcloud(uniqueWordsTable,"word","frequency",Title=storyTitle); % create Word Cloud

    % Bar Plot
    subplot(1,2,2); % set position of Bar Plot
    % convert structure fields into arrays
    words = {topTenWords.word};
    frequency = [topTenWords.frequency];
    bar(frequency,'FaceColor',[0.8500,0.3250,0.0980]); % Bar Plot
    % assign words to xticks and change their angle
    set(gca,'XTick',1:10,'xticklabel',words,'XTickLabelRotation',90);
    % label y axis and title
    ylabel('Word Frequencies'); title('Most Frequent Words');
end

%% Create Story Report
if actionInput == 2

    % find the number of unique words
    numUniqueWords = numel(uniqueWords);

    %use function to create a text file
    generateReport(storyTitle,numUniqueWords,topTenWords)

end
