"File: QA-EVI-FILTER-v1-FUNCTION.R
Revision History: 04-09-2014 v1.0
Author: Sami Rifai - srifai@gmail.com 
Description: Provides a wrapper to the mask_sds function in the LDOPE toolkit  
Specififally writtend to deal with the EVI sds of the MOD13Q1 product 

***************************************************
Relevant guidelines for the vegetation indices: 
2–5  VI usefulness	
0000	Highest quality
0001	Lower quality
0010	Decreasing quality
0100	Decreasing quality
1000	Decreasing quality
1001	Decreasing quality
1010	Decreasing quality
1100	Lowest quality
1101	Quality so low that it is not useful
1110	L1B data faulty
1111	Not useful for any other reason/not processed
***************************************************

" 

####################################################################################### 
"Unpack the QA layers " #non-working, using the top five VI classes
#######################################################################################
mod13q1_unpack <- function(mod_file, work_dir){
  fname=file('temp1.bat',open='wt') 
  write(paste("F:"),fname, append=T)
  write(paste("cd ", work_dir), fname, append=T) 
  write(paste0("unpack_sds_bits ", 
               "-of=",paste0(substr(mod_a2_file,1,24),"BRDF_Albedo_Ancillary.hdf "), 
               #"-fill=-28672 ", 
               "-meta ", 
               "-sds=BRDF_Albedo_Ancillary ",
               #"-on=1 ",
               #"-off=0 ", 
               paste0("-bit=0-3,04-07,08-14 ",
                      mod_a2_file)),fname, append=T) 
  close(fname) 
  shell("temp1.bat")  
  
  fname=file('temp2.bat',open='wt') 
  write(paste("F:"),fname, append=T)
  write(paste("cd ", work_dir), fname, append=T) 
  write(paste0("unpack_sds_bits ", 
               "-of=",paste0(substr(mod_a2_file,1,24),"BRDF_Albedo_Band_Quality.hdf "), 
               #"-fill=-28672 ", 
               #"-meta ", 
               "-sds=BRDF_Albedo_Band_Quality ",
               #"-on=1 ",
               #"-off=0 ", 
               paste0("-bit=0-3,4-7,8-11,12-15,16-19,20-23,24-27,31 ",
                      mod_a2_file)),fname, append=T) 
  close(fname) 
  shell("temp2.bat") 
}

####################################################################################### 
"Create Masks " 
#######################################################################################

####################################################################################### 
"Apply Masks" 
#######################################################################################

####################################################################################### 
"Delete the Masks " 
#######################################################################################