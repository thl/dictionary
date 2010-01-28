#!/bin/bash
 #	This script will search and replace all regular files for a string 
 #	supplied by the user and replace it with another string. 
 #	
 #	Written by Daniel McCarthy
 #	daniel.mccarthy@linuxphile.org
 #
 function usage {
   echo ""
   echo "Search/replace script"
   echo "    Written by Daniel McCarthy"
   echo "      daniel.mccarthy@linuxphile.org"
   echo "      http://linuxphile.org"
   echo ""
   echo "Not enough parameters provided."
   echo "Usage: ./$0 searchstring replacestring"
   echo "Remember to escape any special characters in the searchstring or the replacestring"
   echo ""
 }
 
 #check for required parameters
 if  [ ${#1} -gt 0  ]  &&  [ ${#2} -gt 0  ];
 then
 for f in `find .`;
 do
  if grep -q $1 $f;
  then
   cp $f $f.bak
   echo "The string $1 will be replaced with $2 in $f"
   sed s/$1/$2/g < $f.bak > $f
   rm $f.bak
  fi
 done
 
 else
 #print usage informamtion 
 usage
fi
