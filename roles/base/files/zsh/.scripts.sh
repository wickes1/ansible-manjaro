#!/bin/bash

function dg() {
	datamodel-codegen --input "$1" --input-file-type "$2" --output "$3"
}

# replace all occurance in current direcctory
function sdd() {
	sd "$1" "$2" "$(fd --type file)"
}

function gqlgeninit() {
	#!/bin/bash
	# file: gqlgen-gen.sh
	# usage: chmod+x gqlgen-gen.sh && ./gqlgen-gen.sh

	# variable
  echo -n "Enter go module name: "
  read MODULE
	# read -k "Enter go module name: " MODULE

	# module init
  echo "$MODULE"
	mkdir "$MODULE"
	cd "$MODULE" || exit
	go mod init "$MODULE"
	go get -u github.com/99designs/gqlgen
	go run github.com/99designs/gqlgen init

	# create tool dependencices
	echo "Creating tool dependencies"
	mkdir tools
	cat <<EOF >>tools/tools.go
//go:build tools
// +build tools

package tools

import (
_ "github.com/99designs/gqlgen"
)
EOF

	# go generate ./...
	echo "Seding go generate"
	sed -i '/type Resolver struct{}/i \
//go:generate go run github.com/99designs/gqlgen generate' graph/resolver.go
	go mod tidy
	go generate ./...

	# tips
	echo "Run 'go generate ./...' to generate new model"
	echo "Run 'PORT=4000 go run ./server.go' to specify port run"
}

function background(){
  (nohup "$@" > /dev/null) & disown
  # PID=$!
  # echo $PID
}
