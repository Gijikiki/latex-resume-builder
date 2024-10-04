# Override on the command line with:
#	just --set data-dir "/full/path/to/data"
data-dir := "$(pwd)/data"

build:
	docker build -t resume-builder .

run: clean
	echo $(pwd)
	docker run --rm -v "{{ data-dir }}:/data" resume-builder 
	ls "{{ data-dir }}"

clean:
	rm -f "{{ data-dir }}/resume.aux" 
	rm -f "{{ data-dir }}/resume.log" 
	rm -f "{{ data-dir }}/resume.pdf"
