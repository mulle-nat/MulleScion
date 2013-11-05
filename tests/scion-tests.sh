#!/bin/sh  

#  scion-tests.sh
#  MulleScionTemplates
#
#  Created by Nat! on 01.11.13.
#  Copyright (c) 2013 Mulle kybernetiK. All rights reserved.


if [ -x "../Build/Products/Debug/mulle-scion" ]
then
   MULLE_SCION=${1:-../Build/Products/Debug/mulle-scion}
else
   MULLE_SCION=${1:-mulle-scion}
fi
shift

DIR=${1:-`pwd`}
shift

HAVE_WARNED="no"
RUNS=0

search_plist()
{
   local plist
   local root

   dir=`dirname "$1"`
   plist=`basename "$1"`
   root="$2"

   while :
   do
      if [ -f "$dir"/"$plist" ]
      then
         echo "$dir/$plist"
         break
      fi

      if [ "$dir" = "$root" ]
      then
         break
      fi

      next=`dirname "$dir"`
      if [ "$next" = "$dir" ]
      then
         break
      fi
      dir="$next"
   done
}


canonical_dirname()
{
   local dir

   dir=`echo "$1" | sed '/\/$/s/^\(.*\)\/$/\1/'`
   echo "$dir/"
}


rel_dir()
{
   local root
   local dir
   local count

   root=`canonical_dirname $1`
   dir=`canonical_dirname $2`

   if [ "$dir" = "$root" ]
   then
      echo "."
      return 0
   fi

   count=`echo -n "$1" | wc -c | awk '{ print $1 }'`
   echo -n "$2" | awk "{ print substr( \$0, $count+1) }"
}


rel_pwd()
{
   rel_dir "$1" `pwd`
}


run()
{
   local template
   local plist
   local stdin
   local stdout
   local stderr
   local output
   local errput
   local random

   template="$1"
   plist="$2"
   stdin="$3"
   stdout="$4"
   stderr="$5"

   random=`mktemp -t "mulle-scion"`
   output="$random.stdout"
   errput="$random.stderr"
   pretty_template=`rel_pwd "$root"`/$template

   RUNS=`expr $RUNS + 1`
   cat "$stdin" | $MULLE_SCION "$template" "$plist" > "$output" 2> "$errput"
   if [ $? -ne 0 ]
   then
      if [ ! -f "$template".should-crash ]
      then
         echo "TEMPLATE CRASHED: \"$pretty_template\"" >& 2
         echo "DIAGNOSTICS:" >& 2
         cat  "$errput"
         exit 1
      fi
   else
      if [ -f "$template".should-crash ]
      then
         echo "TEMPLATE FAILED TO CRASH: \"$pretty_template\"" >& 2
         echo "DIAGNOSTICS:" >& 2
         cat  "$errput"
         exit 1
      fi
   fi

   if [ "$stdout" != "-" ]
   then
      result=`diff -q "$stdout" "$output"`
      if [ "$result" != "" ]
      then
         white=`diff -q -w "$stdout" "$output"`
         if [ "$white" != "" ]
         then
            echo "FAILED: \"$pretty_template\" produced unexpected output" >& 2
            echo "DIFF: ($stdout vs. $output)" >& 2
            diff -y "$stdout" "$output" >& 2
         else
            echo "FAILED: \"$pretty_template\" produced different whitespace output" >& 2
            echo "DIFF: ($stdout vs. $output)" >& 2
            od -a "$output" > "$output".actual.hex 
            od -a "$stdout" > "$output".expect.hex 
            diff -y "$output".expect.hex "$output".actual.hex >& 2
         fi

         echo "DIAGNOSTICS:" >& 2
         cat  "$errput"
         exit 2
      fi
   fi

   if [ "$stderr" != "-" ]
   then
      result=`diff "$stderr" "$errput"`
      if [ "$result" != "" ]
      then
         echo "WARNING: \"$pretty_template\" produced unexpected diagnostics ($errput)" >& 2
         echo "" >& 2
         diff "$stderr" "$errput" >& 2
         echo "DIAGNOSTICS:" >& 2
         cat  "$errput"
         exit 3
      fi
   fi
}


run_test()
{
   local stdin
   local stdout
   local stderr
   local template
   local plist
   local root

   template="$1.scion"
   plist="$1.plist"
   root="$2"

   if [ ! -f "$plist" ]
   then
      start=`pwd`/default.plist
      plist=`search_plist "$start" "$root"`
      if [ "$plist" = "" ]
      then
         plist="none"
         if [ "$HAVE_WARNED" != "yes" ]
         then
            echo "warning: no default.plist found" >&2
            HAVE_WARNED="yes"
         fi
      fi
   fi

   stdin="$1.stdin"
   if [ ! -f "$stdin" ]
   then
      stdin="provide/$1.stdin"
   fi
   if [ ! -f "$stdin" ]
   then
      stdin="default.stdin"
   fi
   if [ ! -f "$stdin" ]
   then
      stdin="/dev/null"
   fi

   stdout="$1.stdout"
   if [ ! -f "$stdout" ]
   then
      stdout="expect/$1.stdout"
   fi
   if [ ! -f "$stdout" ]
   then
      stdout="default.stdout"
   fi
   if [ ! -f "$stdout" ]
   then
      stdout="-"
   fi

   stderr="$1.stderr"
   if [ ! -f "$stderr" ]
   then
      stderr="expect/$1.stderr"
   fi
   if [ ! -f "$stderr" ]
   then
      stderr="default.stderr"
   fi
   if [ ! -f "$stderr" ]
   then
      stderr="-"
   fi

   run "$template" "$plist" "$stdin" "$stdout" "$stderr"
}



scan_directory()
{
   local i
   local filename
   local root
   local dir

   root="$1"

   for i in *
   do
      if [ -d "$i" ]
      then
         dir=`pwd`
         cd "$i" 
         scan_directory "$root" 
         cd "$dir"
      else
         filename=`basename "$i" .scion`
         if [ "$filename" != "$i" ]
         then
            run_test "$filename" "$root"
         fi
      fi
   done
}


test_binary()
{
   local random
   local output
   local errput

   random=`mktemp -t "mulle-scion"`
   output="$random.stdout"
   errput="$random.stderr"

   $MULLE_SCION > /dev/null 2>&1
   code=$? 

   if [ $code -eq 127 ]
   then
      echo "mulle-scion can not be found" >&2
      exit 1
   fi 

   if [ $code -ne 253 ]
   then
      echo "$MULLE_SCION is wrong executable" >&2
      exit 1
   fi 
}


absolute_path_if_relative()
{
   case "$1" in
      .*)  echo `pwd`/"$1" 
	   ;;
      *)   echo "$1"
	   ;;
   esac
}


MULLE_SCION=`absolute_path_if_relative "$MULLE_SCION"`

test_binary "$MULLE_SCION"
scan_directory "$DIR"

if [ "$RUNS" -ne 0 ]
then
   echo "All tests ($RUNS) passed successfully"
else
   echo "no tests found" >&2
   exit 1
fi
