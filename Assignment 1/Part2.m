clear; clc;

% Column 1	patients' ages 
% Column 2	self-reported number of drinks per week
% Column 3	clinical status:  1 = cancer, 0 = no cancer

% Load the .mat file
loadedData = load('sampledata2.mat');

% Inspect the fields in the loaded structure
fieldNames = fieldnames(loadedData);
disp('Fields in the loaded .mat file:');
disp(fieldNames);

% Extract the matrix from the first field
data = loadedData.(fieldNames{1}); % Dynamically access the first field

secondColumn = data(:, 2);
more6 = 0;
less5 = 0;

for i = 1:length(secondColumn)
    if (secondColumn(i) > 6)
        more6 = more6 + 1;
    elseif (secondColumn(i) < 5)
        less5 = less5 + 1;
    end
end

fprintf('More than 6 = %d \n', more6);
fprintf('Less than 5 = %d \n', less5);

more50 = 0;
less20 = 0;

firstColumn = data(:, 1);
for i = 1:length(firstColumn)
    if (firstColumn(i) > 50)
        more50 = more50 + 1;
    elseif (firstColumn(i) < 20)
        less20 = less20 + 1;
    end
end

fprintf('Older than 50 = %d \n', more50);
fprintf('Younger than 20 = %d \n', less20);

thirdColumn = data(:, 3);
withCancer = [];
noCancer = [];

for i = 1:length(secondColumn)
    if (thirdColumn(i) == 1)
        withCancer(end + 1) = firstColumn(i);
    elseif (thirdColumn(i) == 0)
        noCancer(end + 1) = firstColumn(i);
    end
end
disp(max(withCancer));
disp(max(noCancer));

edges1 = [15 25 35 45 55 65]; 
edges2 = [15 25 35 45 55 65 75];
edges3 = [10 30 50 70];
edges4 = [17.5 22.5 27.5 32.5 37.5 42.5 47.5 52.5 57.5 62.5 67.5];

% figure;
% h = histogram(noCancer, edges1);
% figure;
% h = histogram(noCancer, edges2);
% figure;
% h = histogram(noCancer, edges3);
% figure;
% h = histogram(noCancer, edges4);

edges1 = [0 30 60 67];
% h = histogram(withCancer, edges1);

bin = [0 35 67];
hist = histogram(withCancer, bin);
events = hist.Values;
disp (events(2) ./ (sum((events))));

less25 = 0;
for i = 1:length(firstColumn)
    if (firstColumn(i) < 25)
        less25 = less25 + 1;
    end
end

fprintf('Less than 25 yrs old = %d \n', less25);
disp (less25 ./ length(firstColumn));

arr = [];
for i = 1:300
    if (secondColumn(i) > 3)
        arr(end + 1) = thirdColumn(i);
    end
end

sum = 0;
for j = 1:length(arr)
    if (arr(j) == 1)
        sum = sum + 1;
    end
end
s
disp(sum/length(arr));