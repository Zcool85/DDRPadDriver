# Copyright © 2022 Zéro Cool

#===============================================================================
#=========================== Configuration générale ============================
#===============================================================================

#-------------------------------------------------------------------------------
# Outils
#-------------------------------------------------------------------------------

# Définition des commandes et outils de compilation
SHELL                   := sh
CC                      := avr-gcc
OBJCOPY                 := avr-objcopy
OBJDUMP                 := avr-objdump
SIZE                    := avr-size
NM                      := avr-nm
AVRDUDE                 := avrdude
REMOVE                  := rm -f
REMOVEDIR               := rmdir
COPY                    := cp
WINSHELL                := cmd      # TODO : A remplacer par la version *nux


#-------------------------------------------------------------------------------
# Configuration du microcontrolleur
#-------------------------------------------------------------------------------

# MCU
#     Cf. http://www.nongnu.org/avr-libc/user-manual/using_tools.html
MCU                     := atmega164p

# Fréquence du microcontrolleur
#     Cette variable est utilisée pour définir le symbol F_CPU dans tous les
#     fichiers sources. Il est inutile de suffixer la valeur par 'UL' car
#     cela est fait automatiquement par ce fichier Makefile
F_CPU                   := 12000000



#-------------------------------------------------------------------------------
# Configuration avrdude
#-------------------------------------------------------------------------------

# Définit le type de microcontrolleur à programmer pour avrdude
#    Cf. avrdude -c?
AVRDUDE_PROGRAMMER      := avrispmkII
#AVRDUDE_PROGRAMMER      := stk600pp

# Port de connexion avrdude à utiliser pour programmer le microcontrolleur
#     com1 -> Port série
#     lpt1 -> Port parallèle
#     usb  -> Port usb
AVRDUDE_PORT            := usb

# Définit le type de microcontrolleur à programmer pour avrdude
#    NOTE : Liste des microcontrolleurs programmable via avrdude : avrdude -p?
AVRDUDE_MCU             := m164p

#-------------------------------------------------------------------------------
# Configuration de la compilation
#-------------------------------------------------------------------------------

# Format du fichier HEX
#     srec, ihex ou binary
FORMAT                  := ihex

# Fichier cible (sans extension)
TARGET                  := main

# Liste des répertoires complémentaires pour la recherche des fichiers d'entête
#     Chaque répertoire doit être séparé par un espace. Pour les répertoires
#     contenant des espaces, entourer le chemin par des doubles quotes.
EXTRAINCDIRS            := include usbdrv

# Liste des fichiers assembleurs à ajouter au projet
#     Tous ces fichiers doivent être suffixés par un .S majucule !
#     Les fichiers se terminant pas un .s minuscule ne seront pas utilisés
#     pour la compilation et seront supprimés si 'make clean' est utilisé.
ASRC                    := usbdrvasm.S

# Niveau d'optimisation
#     0 -> Pas d'optimisation
#     1 .. 3 -> Niveau faible .. Niveau haut (NOTE : 3 n'est pas toujours le meilleur niveau d'optimisation. Cf. avr-libc FAQ.)
#     s -> Optimiser la taille
OPT                     := s

# Fromat des symbols de débogage
#     Les formats par défaut d'avr-gcc sont dwarf-2 (par défaut) ou stabs
#     AVR Studio 4.10 nécessite dwarf-2.
#     AVR COFF ou COFF étendu nécessitent le format stabs, et une exécution d'avr-objcopy
DEBUG                   := stabs

# Répertoire de compilation
#     Tous les fichiers binaires seront dans ce répertoires
OBJDIR                  := bin


#-------------------------------------------------------------------------------
# Configuration des outils de déboggage
#-------------------------------------------------------------------------------

# Configuration pour simulavr : Fréquence du microcontrolleur
DEBUG_MFREQ             := $(F_CPU)

# Choix du debug_ui
#     gdb
#     insight
#     avr-gdb
DEBUG_UI                := avr-gdb

# Choix de l'outil de simulation
#     simulavr
#     avarice
DEBUG_BACKEND           := avarice

# Fichier d'initialisation de GDB
GDBINIT_FILE            := __avr_gdbinit

# Configuration avarice : Périphérique JTAG
JTAG_DEV                := /dev/com1

# Port de débogage pour la communication entre GDB / avarice / simulavr
DEBUG_PORT              := 4242

# Hôte de déboggage pour la communication entre GDB / avarice / simulavr
#    Normalement la valeur est toujours localhost à moins d'utliser un autre
#    ordinateur pour effectuer un déboggage
DEBUG_HOST              := localhost



#===============================================================================
#============================= Configuration avancée ===========================
#===============================================================================


#-------------------------------------------------------------------------------
# Configuration avr-gcc
#-------------------------------------------------------------------------------

# Liste des fichiers source à compiler (les dépendances sont générées automatiquement)
SRC                     := $(wildcard *.c) oddebug.c usbdrv.c

# Conformité au standard C
#     c89   = "ANSI" C
#     gnu89 = c89 plus GCC extensions
#     c99   = ISO C99 standard
#     gnu99 = c99 plus GCC extensions
CSTANDARD               := c99

# Options de compilation
#     -g*        -> Informations de déboggage
#     -DF_CPU    -> Définition du symbol F_CPU
#     -O*        -> Niveau d'optimisation
#     -f...      -> Tuning (Cf. GCC manual and avr-libc documentation)
#     -Wall...   -> Niveau d'alerte
#     -Wa,...    -> Commande envoyé à l'assembleur
#     -adhlns... -> Création d'un listing assembleur
#     -I...      -> Répertoire de recherche des fichiers d'entête
CFLAGS                   = -g$(DEBUG)
CFLAGS                  += -DF_CPU=$(F_CPU)UL
#CFLAGS                  += -DUSART_BAUD=$(USART_BAUD)
#CFLAGS                  += -DSCL_CLOCK=$(SCL_CLOCK)UL
CFLAGS                  += -O$(OPT)
CFLAGS                  += -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums
CFLAGS                  += -Wall -Wstrict-prototypes
CFLAGS                  += -Wa,-adhlns=$(addprefix $(OBJDIR)/,$(notdir $(<:.c=.lst)))
CFLAGS                  += $(patsubst %,-I%,$(EXTRAINCDIRS))
CFLAGS                  += -std=$(CSTANDARD)

# Ajout du vendor/PID USB (licence commeciale)
# Si fichier inexistant, on pend une valeur par défaut des VID/PID à
# usage gratuit sur V-USB
CFG_VENDOR_FILE := ./cfg_vendor.usb
CFG_DEVICE_FILE := ./cfg_device.usb

CFG_VENDOR_ID   := $(shell cat $(CFG_VENDOR_FILE) 2>/dev/null)
CFG_DEVICE_ID   := $(shell cat $(CFG_DEVICE_FILE) 2>/dev/null)

ifeq ($(CFG_VENDOR_ID),)
CFG_VENDOR_ID   := 0xc0, 0x16
endif
ifeq ($(CFG_DEVICE_ID),)
CFG_DEVICE_ID   := 0xdc, 0x27
endif

CFLAGS                  += -DUSB_CFG_VENDOR_ID="$(CFG_VENDOR_ID)"
CFLAGS                  += -DUSB_CFG_DEVICE_ID="$(CFG_DEVICE_ID)"


#-------------------------------------------------------------------------------
# Configuration assembleur
#-------------------------------------------------------------------------------

# Options assembleur
#  -Wa,...             -> Indique à avr-gcc de passer le reste de la ligne de
#                         commande à l'assmebleur
#  -ahlms              -> Création d'un listing
#  -gstabs             -> Insertion des informations numéro de ligne et nom
#                         de fichier dans les fichiers assembleurs
#                         (Obligatoire pour les fichiers COFF Cf. avr-libc docs)
#  -listing-cont-lines -> Définit le nombre de ligne continue maximum de
#                         dump hexadécimal à afficher pour une seule ligne
#                         de cide source
ASFLAGS                  = -Wa,-adhlns=$(addprefix $(OBJDIR)/,$(notdir $(<:.S=.lst))),-gstabs,--listing-cont-lines=100
ASFLAGS                 += -DF_CPU=$(F_CPU)UL
ASFLAGS                 += $(patsubst %,-I%,$(EXTRAINCDIRS))


#-------------------------------------------------------------------------------
# Configuration des librairies
#-------------------------------------------------------------------------------

# Version printf minimaliste
PRINTF_LIB_MIN          := -Wl,-u,vfprintf -lprintf_min

# Version de printf avec gestion des float (nécessite MATH_LIB = -lm)
PRINTF_LIB_FLOAT        := -Wl,-u,vfprintf -lprintf_flt

# Choix de la vesrion du printf à utiliser (Blanc pour la version standard)
PRINTF_LIB              :=
#PRINTF_LIB              := $(PRINTF_LIB_MIN)
#PRINTF_LIB              := $(PRINTF_LIB_FLOAT)


# Version minimaliste de scanf
SCANF_LIB_MIN           := -Wl,-u,vfscanf -lscanf_min

# Version de scanf avec gestion des float (nécessite MATH_LIB = -lm)
SCANF_LIB_FLOAT         := -Wl,-u,vfscanf -lscanf_flt

# Choix de la vesrion de scanf à utiliser (Blanc pour la version standard)
SCANF_LIB               :=
#SCANF_LIB               := $(SCANF_LIB_MIN)
#SCANF_LIB               := $(SCANF_LIB_FLOAT)

# librairie mathématique
#MATH_LIB                := -lm


#-------------------------------------------------------------------------------
# Configuration de la mémoire externe
#-------------------------------------------------------------------------------

# 64 KB of external RAM, starting after internal RAM (ATmega128!),
# used for variables (.data/.bss) and heap (malloc()).
#EXTMEMOPTS             := -Wl,--section-start,.data=0x801100,--defsym=__heap_end=0x80ffff

# 64 KB of external RAM, starting after internal RAM (ATmega128!),
# only used for heap (malloc()).
#EXTMEMOPTS             := -Wl,--defsym=__heap_start=0x801100,--defsym=__heap_end=0x80ffff

# Valeur par défaut
EXTMEMOPTS              :=


#-------------------------------------------------------------------------------
# Configuration du linker
#-------------------------------------------------------------------------------

# Options du linker
#    -Wl,...   -> Indique à avr-gcc de passer le reste de la ligne de
#                 commande au linker
#    -Map      -> Création du fichier .map
#    --cref    -> Ajout des références croisées au fichier .map
LDFLAGS                  = -Wl,-Map=$(@:.elf=.map),--cref
LDFLAGS                 += $(EXTMEMOPTS)
LDFLAGS                 += $(PRINTF_LIB) $(SCANF_LIB) $(MATH_LIB)


#-------------------------------------------------------------------------------
# Configuration avrdude
#-------------------------------------------------------------------------------

# Commande d'écriture du fichier HEX
AVRDUDE_WRITE_FLASH     := -U flash:w:$(OBJDIR)/$(TARGET).hex

# Commande d'écriture de l'eeprom
AVRDUDE_WRITE_EEPROM    := -U eeprom:w:$(OBJDIR)/$(TARGET).eep

# Décommenter cette ligne pour que avrdude effectue un comptage de cycle
# d'effacement
#     Cf. manuel avrdude
#AVRDUDE_ERASE_COUNTER  := -y

# Décommenter cette ligne pour qu'il n'y ai pas de vérification après
# programmation du périphérique
#AVRDUDE_NO_VERIFY      := -V

# Niveau de verbosité (pour les rapport de bug Cf. http://savannah.nongnu.org/projects/avrdude)
#AVRDUDE_VERBOSE        := -v -v

# Création des flags avrdude
AVRDUDE_FLAGS           := -C avrdude.conf
AVRDUDE_FLAGS           += -p $(AVRDUDE_MCU) -P $(AVRDUDE_PORT) -c $(AVRDUDE_PROGRAMMER)
AVRDUDE_FLAGS           += $(AVRDUDE_NO_VERIFY)
AVRDUDE_FLAGS           += $(AVRDUDE_VERBOSE)
AVRDUDE_FLAGS           += $(AVRDUDE_ERASE_COUNTER)


#-------------------------------------------------------------------------------
# Configuration informations de déboggage
#-------------------------------------------------------------------------------

# Convertion ELF vers COFF pour usage en déboggage / simulation dans AVR Studio ou VMLAB
COFFCONVERT             := --debugging \
                           --change-section-address   .data-0x800000 \
                           --change-section-address    .bss-0x800000 \
                           --change-section-address .noinit-0x800000 \
                           --change-section-address .eeprom-0x810000


#-------------------------------------------------------------------------------
# Affichage de la taille des binaires
#-------------------------------------------------------------------------------

# Pour les fichiers HEX
HEXSIZE                 := --target=$(FORMAT)


#===============================================================================
#================= Le reste du script n'est pas à modifier =====================
#===============================================================================

#-------------------------------------------------------------------------------
# Messages
#-------------------------------------------------------------------------------

MSG_DEPENDANCE          := "  --> Dépendance :"
MSG_SIZE_AFTER          := "  --> Taille :"
MSG_COFF                := "  --> Convertion AVR COFF :"
MSG_EXTENDED_COFF       := "  --> Convertion AVR COFF étendu :"
MSG_FLASH               := "  --> Mémoire flash :"
MSG_EEPROM              := "  --> EEPROM :"
MSG_EXTENDED_LISTING    := "  --> Listing étendu :"
MSG_SYMBOL_TABLE        := "  --> Symboles :"
MSG_LINKING             := "  --> Liaison :"
MSG_COMPILING           := "  --> Compilation :"
MSG_ASSEMBLING          := "  --> Assemblage :"
MSG_CLEANING            := "  --> Nétoyage du projet"


#-------------------------------------------------------------------------------
# Fichiers résultats
#-------------------------------------------------------------------------------

# Définition des fichiers .o
OBJ                     := $(addprefix $(OBJDIR)/,$(SRC:.c=.o)) $(addprefix $(OBJDIR)/,$(ASRC:.S=.o))


#-------------------------------------------------------------------------------
# fichiers de dépendances
#-------------------------------------------------------------------------------

# Emplacement des fichiers de dépendances
DEPSDIR                 := $(OBJDIR)/.dep

# Liste des fichiers de dépendances à construire
DEPS                    := $(SRC:%.c=$(DEPSDIR)/%.d)

vpath %.c . usbdrv
vpath %.S . usbdrv

# Inclusion des fichiers de dépendances (ce qui provoque également leur création)
# lors de la première passe du GNU make
# Inutile si la cible est clean ou help
ifneq ($(MAKECMDGOALS),clean)
ifneq ($(MAKECMDGOALS),help)
	-include $(DEPS)
endif
endif


#-------------------------------------------------------------------------------
# Cibles de génération
#-------------------------------------------------------------------------------

# Cibles PHONY
.PHONY : all build program debug coff extcoff clean help \
         displaysize gdb-config

# Suffixes de fichiers
.SUFFIXES: .elf .hex .eep .lss .sym .c .o .S .s .i .lst .map

# Cible par défaut
.DEFAULT_GOAL           := all

# Cible par défaut
all: build \
     program

# Cible de construction des fichiers binaires
build: $(OBJDIR)/$(TARGET).hex $(OBJDIR)/$(TARGET).eep displaysize

# Cible de programmation du microcontrolleur
program: build
ifeq (,$(wildcard $(OBJDIR)/$(TARGET).eep))
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH)
else
	@if [ $$($(SIZE) -d --totals $(OBJDIR)/$(TARGET).eep | tail -1 | cut -f4) -eq 0 ]; \
     then \
         $(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH); \
     else \
         $(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH) $(AVRDUDE_WRITE_EEPROM); \
     fi
endif

# TODO : Ne plus utiliser Windows
debug: $(OBJDIR)/$(TARGET).elf gdb-config
ifeq ($(DEBUG_BACKEND), avarice)
	@echo Starting AVaRICE - Press enter when "waiting to connect" message displays.
	@$(WINSHELL) /c start avarice --jtag $(JTAG_DEV) --erase --program --file \
	                      $< $(DEBUG_HOST):$(DEBUG_PORT)
	@$(WINSHELL) /c pause
else
	@$(WINSHELL) /c start simulavr --gdbserver --device $(MCU) --clock-freq \
	                      $(DEBUG_MFREQ) --port $(DEBUG_PORT)
endif
    @$(WINSHELL) /c start avr-$(DEBUG_UI) --command=$(GDBINIT_FILE)

# Cible de convertion d'un ELF en COFF
coff: $(OBJDIR)/$(TARGET).coff

# Cible de convertion d'un ELF en COFF étendu
extcoff: $(OBJDIR)/$(TARGET).ecoff

# Compilation des fichiers en assembleur depuis les sources C
.DELETE_ON_ERROR:
$(OBJDIR)/%.s : %.c
	$(CC) -S -mmcu=$(MCU) -I. $(CFLAGS) $< -o $@

# Compilation d'un fichier de rapport de compilation (pour les rapports de bug)
.DELETE_ON_ERROR:
$(OBJDIR)/%.i : %.c
	$(CC) -E -mmcu=$(MCU) -I. $(CFLAGS) $< -o $@

# Cible pour netoyer tous les fichiers produits
clean:
	@echo
	@echo $(MSG_CLEANING)
	if test -d "$(OBJDIR)/.dep"; then $(REMOVE) "$(OBJDIR)/.dep"/*; fi
	if test -d "$(OBJDIR)/.dep"; then $(REMOVEDIR) "$(OBJDIR)/.dep"; fi
	if test -d "$(OBJDIR)"; then $(REMOVE) "$(OBJDIR)"/*; fi
	if test -d "$(OBJDIR)"; then $(REMOVEDIR) "$(OBJDIR)"; fi


#-------------------------------------------------------------------------------
# Règles de génération des sous-cibles
#-------------------------------------------------------------------------------

# Règle de génération des fichiers COFF
.DELETE_ON_ERROR:
$(OBJDIR)/$(TARGET).coff: $(OBJDIR)/$(TARGET).elf
	@echo
	@echo $(MSG_COFF) $@
	$(OBJCOPY) -O coff-avr $(COFFCONVERT) $< $@

# Règle de génération des fichiers COFF étendus
.DELETE_ON_ERROR:
$(OBJDIR)/$(TARGET).ecoff: $(OBJDIR)/$(TARGET).elf
	@echo
	@echo $(MSG_EXTENDED_COFF) $@
	$(OBJCOPY) -O coff-ext-avr $(COFFCONVERT) $< $@

# Création du fichhier ELF à partir des fichiers objets (liaison des fichiers .o)
.DELETE_ON_ERROR:
$(OBJDIR)/%.elf $(OBJDIR)/%.lss $(OBJDIR)/%.sym $(OBJDIR)/%.map: $(OBJ) | $(OBJDIR)
	@echo
	@echo $(MSG_LINKING) $@
	$(CC) -mmcu=$(MCU) -I. $(CFLAGS) $^ --output $@ $(LDFLAGS)
	@echo
	@echo $(MSG_EXTENDED_LISTING) $(@:.elf=.lss)
	$(OBJDUMP) -h -S -z $@ > $(@:.elf=.lss)
	@echo
	@echo $(MSG_SYMBOL_TABLE) $(@:.elf=.sym)
	$(NM) -n $@ > $(@:.elf=.sym)

# Création du fichier HEX à partir de l'ELF
.DELETE_ON_ERROR:
$(OBJDIR)/%.hex: $(OBJDIR)/%.elf | $(OBJDIR)
	@echo
	@echo $(MSG_FLASH) $@
	$(OBJCOPY) -O $(FORMAT) -R .eeprom -R .fuse -R .lock -R .signature $< $@

# Création du fichier EEP à partir de l'ELF
.DELETE_ON_ERROR:
$(OBJDIR)/%.eep: $(OBJDIR)/%.elf | $(OBJDIR)
	@echo
	@echo $(MSG_EEPROM) $@
	-$(OBJCOPY) -j .eeprom --set-section-flags .eeprom="alloc,load" \
                           --change-section-lma .eeprom=0 --no-change-warnings -O $(FORMAT) $< $@

# Compilation des fichiers sources C
.DELETE_ON_ERROR:
$(OBJDIR)/%.o : %.c | $(OBJDIR)
	@echo
	@echo $(MSG_COMPILING) $<
	$(CC) -c -mmcu=$(MCU) -I. $(CFLAGS) $< -o $@

# Création des fichiers .o à partir des fichiers assembleur
.DELETE_ON_ERROR:
$(OBJDIR)/%.o : %.S | $(OBJDIR)
	@echo
	@echo $(MSG_ASSEMBLING) $<
	$(CC) -c -mmcu=$(MCU) -I. -x assembler-with-cpp $(ASFLAGS) $< -o $@

# Affichage de la taille des binaires après nouvelle compilation
displaysize:
	@if test -f $(OBJDIR)/$(TARGET).hex; then echo; echo $(MSG_SIZE_AFTER); $(SIZE) $(HEXSIZE) $(OBJDIR)/$(TARGET).hex; \
         2>/dev/null; echo; fi

# Génération du fichier avr-gdb d'initialisation définissant :
#     L'envoi d'un signal de reset
#     Le chargement du fichier cible
#     La connexion à la cible
#     Et positionnement d'un point d'arrêt sur la fonction main()
gdb-config:
	@$(REMOVE) $(GDBINIT_FILE)
	@echo define reset >> $(GDBINIT_FILE)
	@echo SIGNAL SIGHUP >> $(GDBINIT_FILE)
	@echo end >> $(GDBINIT_FILE)
	@echo file $(OBJDIR)/$(TARGET).elf >> $(GDBINIT_FILE)
	@echo target remote $(DEBUG_HOST):$(DEBUG_PORT)  >> $(GDBINIT_FILE)
ifeq ($(DEBUG_BACKEND),simulavr)
    @echo load  >> $(GDBINIT_FILE)
endif
	@echo break main >> $(GDBINIT_FILE)


#-------------------------------------------------------------------------------
# Règles des sous-répertoires
#-------------------------------------------------------------------------------

# Règle de construction du répertoire des binaires
$(OBJDIR):
	@mkdir -p $(OBJDIR)

# Règle de création du répertoires des dépendances
$(DEPSDIR):
	@mkdir -p $(DEPSDIR)


#-------------------------------------------------------------------------------
# Génération des fichiers de dépendances
#-------------------------------------------------------------------------------

# Règle de création d'un fichier de dépendance
.DELETE_ON_ERROR:
$(DEPSDIR)/%.d: %.c | $(DEPSDIR)
	@echo
	@echo $(MSG_DEPENDANCE) $@
	$(CC) -mmcu=$(MCU) -I. $(CFLAGS) -M -MT $(patsubst %.c,$(OBJDIR)/%.o,$(notdir $<)) -MF $@ $<


#-------------------------------------------------------------------------------
# Aide
#-------------------------------------------------------------------------------

help:
	@echo
	@echo "Usage :"
	@echo "   make [all]"
	@echo "        => Compile le projet et programme le microcontrolleur"
	@echo
	@echo "   make build"
	@echo "        => Compile le projet"
	@echo
	@echo "   make program"
	@echo "        => Télécharge le fichier HEX dans le microcontrolleur en utilisant avrdude."
	@echo "           (Merci de mettre à jour la configuration avrdude de ce fichier Makefile !)"
	@echo
	@echo "   make debug"
	@echo "        => Démarre soit simulavr ou avarice comme spécifié pour le débuggage"
	@echo "           (Avec avr-gdb ou avr-insight comme déboggeur)"
	@echo
	@echo "   make coff"
	@echo "        => Converti le fichier ELF en fichier COFF pour AVR"
	@echo
	@echo "   make extcoff"
	@echo "        => Converti le fichier ELF en fichier COFF étendu pour AVR"
	@echo
	@echo "   make $(OBJDIR)/<filename>.s"
	@echo "        => Compile fichier '<filename>.c' en code assembleur uniquement"
	@echo
	@echo "   make $(OBJDIR)/<filename>.i"
	@echo "        => Créé le fichier précompilé à partir du fichier '<filename.c>'"
	@echo "           (fichier utilisable pour les rapports de bug du porjet GCC)"
	@echo
	@echo "   make clean"
	@echo "        => Supprime tous les fichiers et répertoires de compilation"
	@echo
	@echo "Pour recompiler tout le projet, utiliser 'make clean' puis 'make [all]'"
	@echo

# EOF
