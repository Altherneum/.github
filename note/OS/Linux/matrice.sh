#!/bin/bash
while true; 
       do printf "\e[32m%X\e[0m" $((RANDOM%2)); 
             for ((i=0; i<$((RANDOM%128)); i++)) 
                   do printf " "; 
                   done; 
       done; 