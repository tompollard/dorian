# Set the source image
FROM python:2.7.9

# Set the maintainer of this image
MAINTAINER Tom Pollard <tom.pollard.11@ucl.ac.uk>

# Specify commands to run inside the image
RUN apt-get update
RUN apt-get install -y python-matplotlib

# Create directory for container
RUN mkdir /analysis

# Get the code
ADD https://raw.githubusercontent.com/tompollard/dorian/master/README.md /analysis/README.md
ADD https://raw.githubusercontent.com/tompollard/dorian/master/mapper.py /analysis/mapper.py
ADD https://raw.githubusercontent.com/tompollard/dorian/master/reducer.py /analysis/reducer.py
ADD https://raw.githubusercontent.com/tompollard/dorian/master/countwords /analysis/countwords

# Get the book
ADD http://www.gutenberg.org/cache/epub/174/pg174.txt /analysis/dorian.txt

# Change to the home directory
WORKDIR /analysis

# Permissions
RUN chmod 755 mapper.py reducer.py countwords

# Add countwords to environment
ENV PATH /analysis:$PATH