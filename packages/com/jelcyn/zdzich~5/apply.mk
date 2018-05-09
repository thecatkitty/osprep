apply: \
	$(OUT)/zdzich5

$(OUT)/zdzich5: $(REPO)com/jelcyn/zdzich~5/ZDZICH5
	mkdir -p $@
	cp -r $</BIN $@/bin
	cp -r $</INC $@/inc

ifeq ($(strip $(documentation)),1)
	cp -r $</TEKSTY $@/docs
endif

ifeq ($(strip $(tutorial)),1)
	mkdir $@/tutorial
	cp *.htm $@/tutorial/
	cp *.gif $@/tutorial/
	cp *.jpg $@/tutorial/
endif

ifeq ($(strip $(samples)),1)
	cp -r $</PRZYKLAD $@/samples
	cp -r $</KURS/SAMPLE $@/samples/tutorial
endif

$(REPO)com/jelcyn/zdzich~5/ZDZICH5:
	$(HTTPDOWNLOAD) $@.ZIP http://www.jelcyn.com/dos/zdzich5.zip
	unzip -q $@.ZIP -d $(REPO)com/jelcyn/zdzich~5/
	rm $@.ZIP
