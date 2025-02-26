.PHONY: src

CC = xelatex
SRC_DIR = src
RESUME_DIR = src/resume
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

src: $(foreach x, resume, $x.pdf)

resume.pdf: $(SRC_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(SRC_DIR) $<

songbook.pdf: songbook.tex taylor-swift/love-story.tex taylor-swift/you-belong-with-me.tex
	$(CC) songbook.tex
	$(CC) songbook.tex

clean:
	rm -rf $(SRC_DIR)/*.pdf
	rm -f *.aux *.log *.out *.toc songbook.pdf
	rm -rf taylor-swift/*.aux
