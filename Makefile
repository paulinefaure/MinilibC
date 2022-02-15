##
## EPITECH PROJECT, 2021
## B-PSU-400-TLS-4-1-malloc-pauline.faure
## File description:
## Makefile
##

## --------- COLOR ------##

DEFAULT	=	"\033[00m"
GREEN	=	"\033[1;32m"
TEAL	=	"\033[1;36m"
YELLOW	=	"\033[1;7;25;33m"
MAGENTA	=	"\033[1;3;4;35m"
ERROR	=	"\033[5;7;1;31m"

ECHO	=	echo -e

## -------- COMPIL ----##

ASM	=	nasm

CC	=	ld

## ------- DIR --------##
SRCDIR	=	./src

## -------- SRC -------##

SRC	=	$(SRCDIR)/my_strlen.asm	\
		$(SRCDIR)/my_strcmp.asm	\
		$(SRCDIR)/my_strstr.asm	\
		$(SRCDIR)/my_strncmp.asm\
		$(SRCDIR)/my_memcpy.asm	\
		$(SRCDIR)/my_memset.asm	\
		$(SRCDIR)/my_strchr.asm

OBJ	=	$(SRC:.asm=.o)

## ------- FLAGS --------##

cflags.common	:=	-shared -fno-builtin
cflags.debug	:=
cflags.release	:=
cflags.tests	:=

ldflags.common	:=
ldflags.debug	:=
ldflags.release	:=
ldflags.tests	:=

CFLAGS	:=	${cflags.${BUILD}} ${cflags.common}
LDFLAGS	:=	${ldflags.${BUILD}} ${ldflags.common}
ASMFLAGS	=	-f elf64

## ------- BIN ----------##

BINAME	=	libasm.so

## ------- BUILD ----------##

BUILD   =   release

## --------- RULES --------##

all:
	@make -s $(BINAME) && \
	$(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
	$(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINAME) $(DEFAULT)

$(BINAME)	:	$(OBJ)
				@$(CC) $(CFLAGS) -o $(BINAME) $(OBJ)

%.o	:	%.asm
		@$(ASM) -o $@ $< $(ASMFLAGS) && \
		$(ECHO) $(GREEN) "[OK] " $(DEFAULT) $(TEAL) $<  $(DEFAULT)  " -----> " $(GREEN) $@ $(DEFAULT) || \
		$(ECHO) $(ERROR) " [ERROR] can't find " $(YELLOW) $^ $(DEFAULT)

clean:
	@$(foreach i, $(OBJ), $(shell rm -rf $(i)) echo -e $(MAGENTA) "\tRemoved:  $(i)" $(DEFAULT);)

fclean:	clean
	@rm -rf $(BINAME) && \
	$(ECHO) $(GREEN) "[OK]"$(TEAL)"  Done : " $@ $(DEFAULT)  || \
	$(ECHO) $(ERROR) "[ERROR]" $(YELLOW) $(BINAME) $(DEFAULT)

re:	fclean all
