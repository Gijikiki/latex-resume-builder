# NOTE:
#   'just build' and 'just run' to build/run locally

# Use Ubuntu-latest to mimic GitHub Actions
FROM ubuntu:latest

# Avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package list & install latex
# TODO:  Double check package dependencies, there may be some redundancies
RUN    apt-get update \
	&& apt-get -y --no-install-recommends \
		install \
			texlive-base \
			texlive-latex-base \
			texlive-latex-recommended \
			texlive-latex-extra \
			texlive-fonts-extra \
	&& apt-get clean 

# Everything is in data
WORKDIR /data

# These may exist from a previous run
RUN ["rm", "-f", "resume.aux", "resume.log", "resume.pdf"]

# TODO: Should be a script with error handling & cleanup
CMD ["pdflatex", "resume.tex"]
