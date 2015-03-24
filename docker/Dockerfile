# Set the source image
FROM ipython/scipystack:master

# Set the maintainer of this image
MAINTAINER Tom Pollard <tom.pollard.11@ucl.ac.uk>

# Specify commands to run inside the image
RUN apt-get update
RUN apt-get install -y wget

# Create working directory and add to path
RUN mkdir /analysis
WORKDIR /analysis
ENV PATH /analysis:$PATH

# Get the code
ADD https://raw.githubusercontent.com/tompollard/dorian/master/README.md README.md
ADD https://raw.githubusercontent.com/tompollard/dorian/master/mapper.py mapper.py
ADD https://raw.githubusercontent.com/tompollard/dorian/master/reducer.py reducer.py
ADD https://raw.githubusercontent.com/tompollard/dorian/master/countwords countwords
ADD https://raw.githubusercontent.com/tompollard/dorian/master/docker/wordcount.ipynb wordcount.ipynb

# Permissions
RUN chmod 755 mapper.py reducer.py countwords

# Run notebook
RUN echo "ipython notebook --ip=0.0.0.0 --port=8888 --no-browser" > /usr/bin/notebook.sh; \
chmod 755 /usr/bin/notebook.sh
CMD /usr/bin/notebook.sh

# Open port to the outside world
EXPOSE 8888

# Instructions:
# boot2docker start # if OSX
# boot2docker ip # if OSX
# docker build -t tompollard/dorian:v1 .
# docker run -t --rm=true -p 8888:8888 -i tompollard/dorian:v1
# Notebook available at: {ip}:8888



