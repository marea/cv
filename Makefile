all: html pdf

html:
	pandoc -f markdown+fenced_divs+bracketed_spans -t html cv.md -o index.html -H assets/style.html --template assets/template.html

pdf: html
	chromium --headless index.html --run-all-compositor-stages-before-draw --print-to-pdf=cv.pdf --virtual-time-budget=10000

clean:
	rm index.html cv.pdf
