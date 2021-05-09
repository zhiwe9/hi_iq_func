# Makefile for HI-IQ System. 
# Copyright 1995, 1996 Utah Office of Health Data Analysis.

# CFLAGS, compile flags.
# CFLAGS= -g
CFLAGS=

# Place here any flags you may need upon linking, such as a flag to
# prevent dynamic linking (if desired)
#LFLAGS= -lm 
#LFLAGS=  -lcrypt

CC=gcc

# You shouldn't have to edit anything else.

OBJS=hi_iq.o hi_iq_util.o hi_iq_sas.o hi_iq_table.o hi_iq_gif.o \
	hi_iq_mail.o hi_iq_comma.o hi_iq_excel.o hi_iq_drill.o hi_iq_func.o \
	hi_iq_file.o hi_iq_user.o hi_iq_virtual.o hi_iq_xml.o hi_iq_survey.o\
	gd.o gdfontmb.o gdfonts.o

.c.o:
	$(CC) -c $(CFLAGS) $<

all: hi_iq_func2

hi_iq_func2: $(OBJS)
	$(CC) $(LFLAGS) -o hi_iq_func $(OBJS)
	chmod 755 hi_iq_func
	cp hi_iq_func /srv/www/cgi-bin/hi_iq_func2.1
#	mv hi_iq_func /srv/www/sascgi/hi_iq_func2
	chmod 755 /srv/www/cgi-bin/hi_iq_func2

$(OBJS): Makefile hi_iq.h hi_iq_var.h

clean:
	rm -f hi_iq_func $(OBJS) 
