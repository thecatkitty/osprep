include $(BASE_SETTINGS)


ifeq ($(strip $(font)),)	# Using default MS-DOS font (EGAx.CPI)

# EGA.CPI
ifeq ($(strip $(codepage)),437)	# United States
font = ega.cpi
else ifeq ($(strip $(codepage)),850)	# Western (Latin I)
font = ega.cpi
else ifeq ($(strip $(codepage)),852)	# Central European (Latin II)
font = ega.cpi
else ifeq ($(strip $(codepage)),860)	# Portuguese
font = ega.cpi
else ifeq ($(strip $(codepage)),863)	# Canadian French
font = ega.cpi
else ifeq ($(strip $(codepage)),865)	# Nordic
font = ega.cpi

# EGA2.CPI
else ifeq ($(strip $(codepage)),737)	# Greek II
font = ega2.cpi
else ifeq ($(strip $(codepage)),857)	# Turkish
font = ega2.cpi
else ifeq ($(strip $(codepage)),861)	# Icelandic
font = ega2.cpi
else ifeq ($(strip $(codepage)),869)	# Greek
font = ega2.cpi

# EGA3.CPI
else ifeq ($(strip $(codepage)),855)	# Cyrillic I
font = ega3.cpi
else ifeq ($(strip $(codepage)),855)	# Russian (Cyrillic II)
font = ega3.cpi

# INVALID CODEPAGE
else
$(error Codepage $(strip $(codepage)) is not defined in default MS-DOS Codepage Information)
endif	# EGA/EGA2/EGA3 selection by codepage

endif	# Using default MS-DOS font (EGAx.CPI)


apply: \
	$(REPO)com/microsoft/msdos~8.0/doswin81.vfd \
	$(OUT)/autoexec.bat \
	$(OUT)/config.sys

$(REPO)com/microsoft/msdos~8.0/doswin81.vfd:
	$(HTTPDOWNLOAD) $@.xz http://static.celones.pl/pkg/osprep/com.microsoft.msdos.base~8.0.vfd.xz
	unxz -f $@.xz

$(OUT)/autoexec.bat:
	echo "mode con codepage prepare=(($(strip $(codepage))) A:\$(font))\r" > $@
	echo "mode con codepage select=$(strip $(codepage))\r" >> $@

$(OUT)/config.sys:
	echo "DEVICE=A:\\display.sys con=($(strip $(display)),,1)\r" > $@


image:
	cp -f $(REPO)com/microsoft/msdos~8.0/doswin81.vfd $(IMAGE)
	sudo mkdir -p "$(MOUNT)"
	sudo mount -o loop "$(IMAGE)" "$(MOUNT)"
	sudo cp -rfv "$(OUT)/." "$(MOUNT)"
	sudo umount "$(MOUNT)"
