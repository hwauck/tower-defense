# Changes you will want to make:
# 1)  Give a name the program you want to create PROGRAM = myprog.
# 2)  Specify all the .cc files after CXX_SRCS
# 3)  If you are using a library (such as math function routines)
#	adjust CXXLIBS (example: CXXLIBS = -lcc -lm)
# 4)  If you want to include any of the book's classes (e.g Time),
#       include the corresponding object file after CCC_OBJS
#       (in our example ccc_time.o).  Note that if you want to use
#       cwin, this list must include ccc_x11.o and ccc_shap.o
# 5)  Type the Unix command, "touch .depend.mk"
#     This will be a "hidden file".  To see it type "ls -a" in the shell.

################################################################
#            VARIABLES YOU'LL WANT TO CHANGE                   #
################################################################

PROGRAM = towerDefense

CXX_SRCS = tower.cc EnemyUnit.cc map.cc Square.cc towerDefense.cc path.cc player.cc type.cc \
	attributeBox.cc category.cc drawFunctions.cc systemUpdater.cc button.cc towerButton.cc constructionBox.cc \
	wave.cc drawConstants.cc gameMaps.cc

CXXLIBS = -lX11

CCC_OBJS = ccc_x11.o ccc_shap.o

################################################################
#          STUFF YOU PROBABLY WANT TO LEAVE ALONE              #
################################################################

CCC_FILESDIR = cccfiles

CCC_OBJS2 = $(CCC_OBJS:%=$(CCC_FILESDIR)/%)

CXXINCLUDEPATHS = -I$(CCC_FILESDIR)

CXX = g++
CC = $(CXX)
LDFLAGS = -g -pipe -L/usr/X11R6/lib $(CXX_LIBS)
CXXFLAGS = -g -pipe -Wall $(CXXINCLUDEPATHS)

OBJS = $(CXX_SRCS:.cc=.o)

DEMANGLER = c++filt

# The folllowing line is included for Eclipse, since it calls "build all" 
all : $(PROGRAM)

$(PROGRAM) : depend $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) $(CCC_OBJS2) $(CXXLIBS) -o $(PROGRAM) 2>&1 \
             | $(DEMANGLER)

clean:
	/bin/rm -f *.o $(PROGRAM) .nfs* *~ core \#*\#

depend:
	$(CXX) -MM $(CXX_SRCS) $(CXXINCLUDEPATHS) > .depend.mk

###
include .depend.mk