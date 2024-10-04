build:
	docker build -t resume-builder .

run: clean
	echo $(pwd)
	docker run --rm -v "$(pwd)/data:/data" resume-builder 

clean:
	rm -f "data/resume.aux" "data/resume.log" "data/resume.pdf"
