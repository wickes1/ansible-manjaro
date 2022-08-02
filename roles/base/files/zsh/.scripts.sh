#!/bin/bash

function dg(){
  datamodel-codegen --input $1 --input-file-type $2 --output $3
}

# replace all occurance in current direcctory
function sdd(){
  sd $1 $2 $(fd --type file)
}
