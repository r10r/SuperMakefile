PROJECT_DIR := $(LOCAL_DIR)
MODULES := hello_world

CC := clang

ifeq ($(OS),Darwin)
# only when clang is installed through homebrew
LDFLAGS += -L/usr/local/lib/llvm-3.4/usr/lib
endif

CFLAGS += -Weverything -Werror -Wall -pedantic \
	-I$(PROJECT_DIR)/src \
	-I$(LIBCX_DIR)

ifeq ($(ENV),release)
CFLAGS += -Os -DNDEBUG -DNTRACE
else
CFLAGS += -gdwarf-2 -g -O0 -fno-inline --coverage
endif

# to explicitly ignore unused parameters use a macro
# #define UNUSED(x) (void)(x)
CFLAGS += -Wno-error=unused-parameter \
	-Wno-error=unused-function \
	-Wno-error=unused-variable \
	-Wno-error=unused-value \
	-Wno-error=padded \
	-Wno-error=cast-align \
	-Wno-error=incompatible-pointer-types-discards-qualifiers
	
# curl uses recursive macro expansion magic to match parameters
# linux declares stdout/stdin/stderr recursive
CFLAGS += -Wno-error=disabled-macro-expansion  
