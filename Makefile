MSCORE?=mscore4

MSCZ=$(wildcard *.mscz)

PDF=$(MSCZ:.mscz=.pdf)

all: $(PDF)

$(PDF): %.pdf : %.mscz
	cp template.in $*.json
	sed -i -e "s/{FILE}/$*/g" "$*.json"
	$(MSCORE) -j "$*.json" && mkdir -p "out/$*" && mv "$*"*.pdf "out/$*/" || true

clean:
	rm -fr *.json out/
