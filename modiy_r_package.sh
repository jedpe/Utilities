#!/bin/bash

# Modify and rebuild an R package
# Taken from: https://stackoverflow.com/questions/34800331/r-modify-and-rebuild-package
# Download the package source
wget https://cran.r-project.org/src/contrib/reticulate_1.28.tar.gz

# Extract its contents
tar xvzf reticulate_1.28.tar.gz
rm reticulate_1.28.tar.gz

# This is the part where any modifications should take place

# Rebuild with changes
R CMD build reticulate/

# Install the modified archive
sudo R CMD INSTALL reticulate_1.28.tar.gz
