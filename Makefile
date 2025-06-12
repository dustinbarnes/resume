ALL: rendercv_output/Dustin_Barnes_CV.pdf rendercv_output/Dustin-Barnes-Cover-Letter.pdf

rendercv_output/Dustin_Barnes_CV.pdf: Dustin_Barnes_CV.yaml
	rendercv render "Dustin_Barnes_CV.yaml"

rendercv_output/Dustin-Barnes-Cover-Letter.pdf: cover-letter.md rendercv_output/Dustin_Barnes_CV.pdf
	pandoc -s -f gfm --pdf-engine=xelatex -o rendercv_output/Dustin-Barnes-Cover-Letter.pdf cover-letter.md

clean:
	rm -rf rendercv_output/
