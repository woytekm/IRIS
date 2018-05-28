CC = gcc
MAKE = make
LIBS = -lpthread -lplclock -lrss-reader -lplayer -lkeyboard -lconfig -lWEH001602 -lsetup -lrss-tts -lsystem -lalarm -lwifi -lbcm2835  -lxml2 -lcurl -lbass -lbassflac -lbass_aac -lcrypt -lmicrohttpd
LIBSEARCH = -L ./clock -L ./display -L ./rss -L ./player -L ./keyboard -L ./config -L ./setup -L ./tts -L ./system -L ./alarm -L ./wifi
INCLUDES = -I wifi -I alarm -I config -I system -I player -I include -I clock -I display -I rss -I keyboard -I setup -I tts -I /usr/include/libxml2
MAIN_EXE = Iris
MAIN_EXE_STATIC = Iris-static
PLLIBS = libplclock.a libWEH001602.a librss-reader.a libplayer.a libkeyboard.a libconfig.a libsetup.a librss-tts.a libsystem.a libalarm.a libwifi.a
DIRS = clock display player config rss keyboard setup tts


all:	$(PLLIBS) $(MAIN_EXE)

all_static:	$(PLLIBS) $(MAIN_EXE_STATIC)

$(MAIN_EXE):
	$(CC) -c main.c $(INCLUDES)
	$(CC) -o $(MAIN_EXE) main.o $(LIBS) $(LIBSEARCH)

$(MAIN_EXE_STATIC):
	$(CC) -c main.c $(INCLUDES)
	$(CC) -static -o $(MAIN_EXE) main.o $(LIBS) $(LIBSEARCH)

libplclock.a:
	cd clock; $(MAKE)

libWEH001602.a:
	cd display; $(MAKE)

librss-reader.a:
	cd rss; $(MAKE)

libplayer.a:
	cd player; $(MAKE)

libkeyboard.a:
	cd keyboard; $(MAKE)

libconfig.a:
	cd config; $(MAKE)

libsetup.a:
	cd setup; $(MAKE)

librss-tts.a:
	cd tts; $(MAKE)

libsystem.a:
	cd system; $(MAKE)

libalarm.a:
	cd alarm; $(MAKE)

libwifi.a:
	cd wifi; $(MAKE)

install:
	mv $(MAIN_EXE) /usr/local/bin

clean:
	rm -f *.o *.a core $(MAIN_EXE)
	for d in $(DIRS); do (cd $$d; $(MAKE) clean ); done
