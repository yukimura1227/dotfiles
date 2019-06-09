#!/bin/sh

# NOTE: you can export extensions below
# code --list-extensions > my_vscode_package.txt

BASE_DIR=`dirname "${0}"`

package_File_path="${BASE_DIR}/my_vscode_extensions.txt"

for package_name in `cat ${package_File_path}`
do
  echo "code --install-extension ${package_name}"
  code --install-extension ${package_name}
done
