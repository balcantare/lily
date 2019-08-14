
sheets = tradition \
         act1Opening \
         matchMaker \
         richMan \
         endOfScene2 \
         sabbathPrayer \
         changeOfScene \
         toLife \
         streetScene \
         perchikAndHodleDance \
         miracle \
         dream \
         crossoverAct1 \
         weddingIntroduction \
         sunriseSunset \
         weddingDanceOne \
         weddingSceneNo1 \
         weddingDanceTwo \
         weddingSceneNo2 \
         finaleAct1 \
         doYouLoveMe \
         sogMirDuShejnMejdele \
         farFromTheHomeILove \
         incidental \
         chavale \
         anatevka \
         finalSceneUnderscoring \
         curtainAct2 \
         exit

lilypond := ~/prog/apps/bin/lilypond

%.pdf: %.ly
	@echo "$*.ly -> $*.pdf"
	$(lilypond) --include=../include $*.ly

anatevka-book.pdf: $(addsuffix .pdf,$(sheets))
	@echo "$^"
	pdfjam --outfile $@ $^

websync = rsync -v $(foreach b,$(1),\
           $(INSTALL_DIR)/$(b)-book-$($(b).revision).pdf) \
                  strato:intern/$(2)

export:
	$(call websync,$(anatevka freylaxBf freylaxEf,freylax)
	$(call websync,ziganimo,ziganimo)
	$(call websync,klezmart,klezmart)
	$(call websync,krambambuli,krambambuli)
	$(call websync,fanfareC fanfareBf fanfareEf,fanfare)
	$(call websync,omniC play,omni)	
