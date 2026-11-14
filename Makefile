MSCORE?=mscore

MSCZ=$(wildcard *.mscz)

PDF=$(MSCZ:.mscz=.pdf)

all: $(PDF)

$(PDF): %.pdf : %.mscz
	cp template.in $*.json
	sed -i -e "s/{FILE}/$*/g" "$*.json"
	$(MSCORE) -j "$*.json" 2>&1
	mkdir -p "out/$*"
	mv "$*"*.pdf "out/$*/"

clean:
	rm -fr *.json out/
