ALL: rendered/dustin-barnes-resume.txt rendered/dustin-barnes-resume.md rendered/dustin-barnes-resume.html rendered/dustin-barnes-resume.pdf rendered/dustin-barnes-cover-letter.pdf

rendered/dustin-barnes-resume.md: resume.yml markdown.hbs
	hb -i ./resume.yml -t ./markdown.hbs -o rendered/dustin-barnes-resume.md

rendered/dustin-barnes-resume.txt: resume.yml text.hbs
	hb -i ./resume.yml -t ./text.hbs -o rendered/dustin-barnes-resume.txt

rendered/dustin-barnes-resume.html: rendered/dustin-barnes-resume.md resume-css.html
	pandoc -s -f gfm -H./resume-css.html rendered/dustin-barnes-resume.md > rendered/dustin-barnes-resume.html

rendered/dustin-barnes-resume.pdf: rendered/dustin-barnes-resume.html
	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --headless --run-all-compositor-stages-before-draw --print-to-pdf=rendered/dustin-barnes-resume.pdf --no-pdf-header-footer rendered/dustin-barnes-resume.html
	
rendered/dustin-barnes-cover-letter.pdf: cover-letter.md
	pandoc -s -f gfm --pdf-engine=xelatex -o rendered/dustin-barnes-cover-letter.pdf cover-letter.md