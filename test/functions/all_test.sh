#!/usr/bin/env bash

testLoadsWithoutError ()
{
 local script_path=$(path "functions/all.sh")
 source ${script_path}
 assertEquals 0 $?
}

