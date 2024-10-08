# Latex Resume Builder

Takes a LaTeX file, and creates a PDF.

## Features
- Creates a build environment to process a LaTeX document, outputting a PDF
- Allows the resume and resulting PDF to be in a different directory
- Can use GitHub Actions to build the PDF automatically upon commit

## Introduction

This project is all about making it easier to manage and build a resume
from a LaTeX template. Since different jobs often need slightly different
resumes, I wanted a way to easily update and tweak things without starting from
scratch each time. By using Git, I can create separate branches for each
version of my resume—so, for example, I have one version tailored for DevOps
roles and another one for automation engineering positions. This setup lets me
keep everything organized, track changes, and make updates without worrying
about losing the original.  I can use Git labels to tag commits for the
job being applied for.

Another cool aspect of this project is using GitHub Actions to automate the
resume-building process.  Instead of manually compiling the LaTeX file every
time I make a change, I’ve set up a pipeline where GitHub does that for me
automatically. So whenever I push a new commit, it compiles my resume and
outputs a clean, polished PDF for me.  Since I've mostly used GitLab CI/CD in the
past, it’s been a great way to learn more about GitHub Actions, plus it saves me a
ton of time.

Overall, this project is both a practical way to manage my resume for different
job applications and a fun learning experience in using GitHub Actions.

## Installation

1. Clone the repository:

    ```bash
    git clone git@github.com:Gijikiki/latex-resume-builder.git
    ```

2. Navigate to the project directory:

    ```bash
    cd latex-resume-builder
    ```

3. Test functionality

    ```bash
    just build
    just run
    ```

    There should be a `resume.pdf` in the data directory

4. Cleanup

    ```bash
    just clean
    ```

    Removes build files and the resulting PDF

## Usage

### Locally (Option 1 - Resume is included in this repository)

This will require 'docker' and 'just' to be installed.

1.  Edit data/resume.tex, or substitute with your own resume in LaTeX format.

2.  `just build` to build the docker image.

3.  `just run` to have the docker image build the PDF.

4.  Your resume will be generated at data/resume.pdf

5.  `just clean` will remove the pdf as well as any other files created by building the PDF.


### Locally (Option 2 - Resume is separate from this repository)

This will require 'docker' and 'just' to be installed.

1.  Add a file named `justfile` to the directory your resume is in.  The contents should be as follows:

    ```
    data-dir := "$(pwd)/data"
    latex-resume-builder := "/PATH/TO/REPO/latex-resume-builder"

    build:
        cd "{{ latex-resume-builder }}" \
        && just build

    run:
        export DATA_DIR={{ data-dir }} \
        && cd "{{ latex-resume-builder }}" \
        && echo "The data directory is: {{ data-dir }}" \
        && just --set "data-dir" "$DATA_DIR" run

    clean:
        export DATA_DIR={{ data-dir }} \
        && cd "{{ latex-resume-builder }}" \
        && just --set "data-dir" "$DATA_DIR" clean
    ```

2.  From that directory, follow steps 2-5 from the "Locally (Option 1 - Resume
    is included in this repository)" instructions.

Note - it should be possible to set up the latex-resume-builder as a subrepo of the directory you are in.

### Through GitHub Actions

1.  Edit data/resume.tex.

2.  Commit and push to GitHub.

3.  The resume will be saved as an artifact of the GitHub Action.

## Contributing

Feel free to submit issues or pull requests. For major changes, please open an issue to discuss what you would like to change.

## Credits

A friend if mine has the project '[glort](https://github.com/rbuysse/glort/tree/main)', which was the inspiration for this
project.  That project builds a resume from a Markdown source, using Pandoc.  I studied that project to figure out
how GitHub actions worked.

## License

The sample resume in data/ is a sample resume template by Vel (vel@latextemplates.com), and is licensed under the CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/).

