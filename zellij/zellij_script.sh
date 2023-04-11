#!/bin/bash


function zo(){
  workdir=${1:-.}
  project_name=$(basename $(realpath $1))
  zellij attach --create  $project_name
}