REGISTER '/home/acadgild/Project/Development/2/govt_80perc.jar';
DEFINE perc govt_udf.govt_80perc();
A = load '/user/govt_progress/xml_to_csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','NO_MULTILINE','UNIX');
B = FOREACH A GENERATE (chararray)$0 as state, (chararray)$1 as district, (int)$2 as Project_Objectives_IHHL_BPL, (int)$10 as Project_Performance_IHHL_BPL;  
C = FOREACH B GENERATE district, perc(Project_Objectives_IHHL_BPL, Project_Performance_IHHL_BPL) as percentage;
D = FILTER C BY percentage == 80.0;
STORE D INTO '/user/govt_progess/Soln2'; 

