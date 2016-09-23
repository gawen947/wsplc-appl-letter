SRC    = $(wildcard *.tex)
TARGET = wsplc

ifdef DISABLE_COMMENTS
	FLAGS += "\def\disableComments{}\input"
endif

$(TARGET).pdf: $(SRC)
	pdflatex $(FLAGS) $(TARGET)

release: $(SRC)
	pdflatex $(FLAGS) $(TARGET)
	bibtex   $(TARGET)
	pdflatex $(FLAGS) $(TARGET)
	pdflatex $(FLAGS) $(TARGET)

clean:
	rm -f $(TARGET).pdf $(TARGET).aux $(TARGET).log $(TARGET).blg $(TARGET).bbl
