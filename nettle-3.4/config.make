# Makefile settings shared between Makefiles.

CC = gcc
CXX = g++
CFLAGS = -g -O2 -ggdb3 -Wall -W   -Wmissing-prototypes -Wmissing-declarations -Wstrict-prototypes   -Wpointer-arith -Wbad-function-cast -Wnested-externs
CXXFLAGS = -g -O2
CCPIC = 
CPPFLAGS = 
DEFS = -DHAVE_CONFIG_H
LDFLAGS = 
LIBS = -lgmp 
LIBOBJS = 
EMULATOR = 
NM = nm

OBJEXT = o
EXEEXT = 

CC_FOR_BUILD = gcc -O -g
EXEEXT_FOR_BUILD = 

DEP_FLAGS = -MT $@ -MD -MP -MF $@.d
DEP_PROCESS = true

PACKAGE_BUGREPORT = nettle-bugs@lists.lysator.liu.se
PACKAGE_NAME = nettle
PACKAGE_STRING = nettle 3.4
PACKAGE_TARNAME = nettle
PACKAGE_VERSION = 3.4

LIBNETTLE_MAJOR = 6
LIBNETTLE_MINOR = 4
LIBNETTLE_SONAME = libnettle.$(LIBNETTLE_MAJOR).dylib
LIBNETTLE_FILE = libnettle.$(LIBNETTLE_MAJOR).$(LIBNETTLE_MINOR).dylib
LIBNETTLE_FILE_SRC = $(LIBNETTLE_FORLINK)
LIBNETTLE_FORLINK = libnettle.dylib
LIBNETTLE_LIBS = 
LIBNETTLE_LINK = $(CC) $(CFLAGS) -dynamiclib $(LDFLAGS) -install_name ${libdir}/$(LIBNETTLE_SONAME) -compatibility_version $(LIBNETTLE_MAJOR) -current_version $(LIBNETTLE_MAJOR).$(LIBNETTLE_MINOR)

LIBHOGWEED_MAJOR = 4
LIBHOGWEED_MINOR = 4
LIBHOGWEED_SONAME = libhogweed.$(LIBHOGWEED_MAJOR).dylib
LIBHOGWEED_FILE = libhogweed.$(LIBHOGWEED_MAJOR).$(LIBHOGWEED_MINOR).dylib
LIBHOGWEED_FILE_SRC = $(LIBHOGWEED_FORLINK)
LIBHOGWEED_FORLINK = libhogweed.dylib
LIBHOGWEED_LIBS = -lnettle $(LIBS)
LIBHOGWEED_LINK = $(CC) $(CFLAGS) -dynamiclib -L. $(LDFLAGS) -install_name ${libdir}/$(LIBHOGWEED_SONAME) -compatibility_version $(LIBHOGWEED_MAJOR) -current_version $(LIBHOGWEED_MAJOR).$(LIBHOGWEED_MINOR)

NUMB_BITS = 64

AR = ar
ARFLAGS = cru
AUTOCONF = autoconf
AUTOHEADER = autoheader
M4 = /usr/bin/m4
MAKEINFO = makeinfo
RANLIB = ranlib
LN_S = ln -s

prefix	=	/usr/local
exec_prefix =	${prefix}
datarootdir =	${prefix}/share
bindir =	${exec_prefix}/bin
libdir =	${exec_prefix}/lib
includedir =	${prefix}/include
infodir =	${datarootdir}/info

# PRE_CPPFLAGS and PRE_LDFLAGS lets each Makefile.in prepend its own
# flags before CPPFLAGS and LDFLAGS. While EXTRA_CFLAGS are added at the end.

COMPILE = $(CC) $(PRE_CPPFLAGS) $(CPPFLAGS) $(DEFS) $(CFLAGS) $(EXTRA_CFLAGS) $(DEP_FLAGS)
COMPILE_CXX = $(CXX) $(PRE_CPPFLAGS) $(CPPFLAGS) $(DEFS) $(CXXFLAGS) $(DEP_FLAGS)
LINK = $(CC) $(CFLAGS) $(PRE_LDFLAGS) $(LDFLAGS)
LINK_CXX = $(CXX) $(CXXFLAGS) $(PRE_LDFLAGS) $(LDFLAGS)

# Default rule. Must be here, since config.make is included before the
# usual targets.
default: all

# For some reason the suffixes list must be set before the rules.
# Otherwise BSD make won't build binaries e.g. aesdata. On the other
# hand, AIX make has the opposite idiosyncrasies to BSD, and the AIX
# compile was broken when .SUFFIXES was moved here from Makefile.in.

.SUFFIXES:
.SUFFIXES: .asm .c .$(OBJEXT) .html .dvi .info .exe .pdf .ps .texinfo

# Disable builtin rule
%$(EXEEXT) : %.c
.c:

# Keep object files
.PRECIOUS: %.o

.PHONY: all check install uninstall clean distclean mostlyclean maintainer-clean distdir \
	all-here check-here install-here clean-here distclean-here mostlyclean-here \
	maintainer-clean-here distdir-here \
	install-shared install-info install-headers \
	uninstall-shared uninstall-info uninstall-headers \
	dist distcleancheck
