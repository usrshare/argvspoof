cmake_minimum_required(VERSION 2.8)
project(argvspoof)

set (CMAKE_C_FLAGS "-std=c99 -D_XOPEN_SOURCE=500 -Wall -Wextra -Wno-override-init ${CMAKE_C_FLAGS}")

set_source_files_properties(tags PROPERTIES GENERATED true)

add_custom_target(tags
        COMMAND ctags -R .
	        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

include_directories (${CMAKE_SOURCE_DIR}/inc)

add_executable (argvspoof
		src/main.c
	       )

target_link_libraries(argvspoof)

install(TARGETS argvspoof
	RUNTIME DESTINATION bin
	)
