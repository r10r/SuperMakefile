# cache evaluation of path
L := $(LOCAL_DIR)

PROGRAMS += $(L)/hello_world
#TESTS += $(L)/

# overwrite CFLAGS per object
#$(L)/.o : CFLAGS += ...

# -- programs --
#$(L)/hello_world_FLAGS := $(L)/
$(L)/hello_world_OBJS := $(L)/hello_world.o \
	$(L)/hello.o

# -- tests -- 

#$(L)/_FLAGS := $(TEST_FLAGS)
#$(L)/_OBJS := $(TEST_OBJS) \
