Select the n largest number using sas sql                                                           
                                                                                                    
  Two Solutions                                                                                     
      a. sql outobs                                                                                 
      b. sql monotonic (Joe)                                                                        
         https://stackoverflow.com/users/1623007/joe                                                
                                                                                                    
                                                                                                    
github                                                                                              
https://tinyurl.com/y3a54f3x                                                                        
https://github.com/rogerjdeangelis/utl-select-the-n-largest-number-using-sas-sql                    
                                                                                                    
Stackoverflow                                                                                       
https://tinyurl.com/y2mo7773                                                                        
https://stackoverflow.com/questions/64417829/how-to-get-the-n-th-largest-number-by-sas-sql          
                                                                                                    
                                                                                                    
/*                   _                                                                              
(_)_ __  _ __  _   _| |_                                                                            
| | `_ \| `_ \| | | | __|                                                                           
| | | | | |_) | |_| | |_                                                                            
|_|_| |_| .__/ \__,_|\__|                                                                           
        |_|                                                                                         
*/                                                                                                  
                                                                                                    
                                                                                                    
%let n=3;                                                                                           
                                                                                                    
data have;                                                                                          
input ID Amt;                                                                                       
cards4;                                                                                             
1  666                                                                                              
2  555                                                                                              
3  444                                                                                              
4  333                                                                                              
5  222                                                                                              
6  111                                                                                              
;;;;                                                                                                
run;                                                                                                
                                                                                                    
WORK.HAVE total obs=6                                                                               
                                                                                                    
 ID    AMT                                                                                          
                                                                                                    
  1    666                                                                                          
  2    555                                                                                          
  3    444                                                                                          
  4    333                                                                                          
  5    222                                                                                          
  6    111                                                                                          
                                                                                                    
/*           _               _                                                                      
  ___  _   _| |_ _ __  _   _| |_                                                                    
 / _ \| | | | __| `_ \| | | | __|                                                                   
| (_) | |_| | |_| |_) | |_| | |_                                                                    
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                   
                |_|                                                                                 
*/                                                                                                  
                                                                                                    
      ID       AMT                                                                                  
------------------                                                                                  
       3       444                                                                                  
                                                                                                    
/*         _       _   _                                                                            
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                            
/ __|/ _ \| | | | | __| |/ _ \| `_ \/ __|                                                           
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                           
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                           
                       _        _                                                                   
  __ _      ___  _   _| |_ ___ | |__  ___                                                           
 / _` |    / _ \| | | | __/ _ \| `_ \/ __|                                                          
| (_| |_  | (_) | |_| | || (_) | |_) \__ \                                                          
 \__,_(_)  \___/ \__,_|\__\___/|_.__/|___/                                                          
*/                                                                                                  
                                                                                                    
proc sql;                                                                                           
     reset outobs=3;                                                                                
     create                                                                                         
        table havThree as                                                                           
     select                                                                                         
        *                                                                                           
     from                                                                                           
        have                                                                                        
     order                                                                                          
        by amt descending;                                                                          
     select                                                                                         
        *                                                                                           
     from                                                                                           
        havThree                                                                                    
     having                                                                                         
       amt = min(amt)                                                                               
;quit;                                                                                              
                                                                                                    
/*                                    _              _                                              
| |__     _ __ ___   ___  _ __   ___ | |_ ___  _ __ (_) ___                                         
| `_ \   | `_ ` _ \ / _ \| `_ \ / _ \| __/ _ \| `_ \| |/ __|                                        
| |_) |  | | | | | | (_) | | | | (_) | || (_) | | | | | (__                                         
|_.__(_) |_| |_| |_|\___/|_| |_|\___/ \__\___/|_| |_|_|\___|                                        
                                                                                                    
*/                                                                                                  
                                                                                                    
proc sql;                                                                                           
  create view havOrd as                                                                             
    select id, amt                                                                                  
    from have                                                                                       
    order by amt desc                                                                               
  ;                                                                                                 
  select id, amt                                                                                    
    from havOrd                                                                                     
    where monotonic() =3                                                                            
  ;                                                                                                 
quit;                                                                                               
                                                                                                    
                                                                                                    
