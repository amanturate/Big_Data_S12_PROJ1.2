A = load '/user/govt_progress/xml_to_csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',','NO_MULTILINE','UNIX');

B = FOREACH A GENERATE (chararray)$0 as state, (chararray)$1 as district, (int)$2 as Project_Objectives_IHHL_BPL, (int)$10 as Project_Performance_IHHL_BPL;

C = FILTER B BY (Project_Performance_IHHL_BPL == Project_Objectives_IHHL_BPL);

D = FOREACH C GENERATE district;

STORE D INTO '/user/govt_progess/Soln1'; 

