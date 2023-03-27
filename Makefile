ALL: rendered/resume.txt rendered/resume.md rendered/resume.html rendered/resume.pdf

rendered/resume.md: resume.yml markdown.hbs
	hb -i ./resume.yml -t ./markdown.hbs -o rendered/resume.md

rendered/resume.txt: resume.yml text.hbs
	hb -i ./resume.yml -t ./text.hbs -o rendered/resume.txt

rendered/resume.html: rendered/resume.md resume-css.html
	pandoc -s -f gfm -H./resume-css.html rendered/resume.md > rendered/resume.html

rendered/resume.pdf: rendered/resume.html
	touch rendered/resume.pdf