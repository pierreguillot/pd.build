
# The path to this file.
set(PD_CMAKE_PATH ${CMAKE_CURRENT_LIST_DIR})
# The path to Pure Data sources.
set(PD_SOURCES_PATH)
# The output path for the externals.
set(PD_OUPUT_PATH)

# The function adds an external to the project.
# PROJECT_NAME is the name of your project (for example: freeverb_project)
# EXTERNAL_NAME is the name of your external (for example: freeverb~)
# EXTERNAL_SOURCES are the source files (for example: freeverb~.c)
# The function should be call:
# add_external(freeverb_project freeverb~ "userpath/freeverb~.c userpath/otherfile.c")
# later see how to manage relative and absolute path
function(add_pd_external PROJECT_NAME EXTERNAL_NAME EXTERNAL_SOURCES)
	source_group(src FILES ${EXTERNAL_SOURCES})
	add_library(${PROJECT_NAME} SHARED ${EXTERNAL_SOURCES})

	# Includes the path to Pure Data sources.
	target_include_directories(${PROJECT_NAME} PRIVATE ${PD_SOURCES_PATH})

	# Defines plateform specifix suffix and the linking necessities.
	set_target_properties(${PROJECT_NAME} PROPERTIES PREFIX "")
	if(${APPLE})
		set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-undefined dynamic_lookup")
		set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".pd_darwin")
	elseif(${UNIX})
		set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".pd_linux")
	elseif(${WIN32})
		set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".dll")
		find_library(PD_LIBRARY NAMES pd HINTS ${PD_CMAKE_PATH})
		target_link_libraries(${PROJECT_NAME} ${PD_LIBRARY})
	endif()

	# Removes some warning for Microsoft Visual C.
	if(${MSVC})
		set_property(TARGET ${PROJECT_NAME} APPEND_STRING PROPERTY COMPILE_FLAGS "/D_CRT_SECURE_NO_WARNINGS /wd4091 /wd4996")
	endif()

	# Defines the name of the external.
	# On XCode an external named name~ have to be named 'name~'.
	string(FIND ${EXTERNAL_NAME} "." NAME_HAS_DOT)
	string(FIND ${EXTERNAL_NAME} "~" NAME_HAS_TILDE)
	if((CMAKE_GENERATOR STREQUAL Xcode) AND (NAME_HAS_DOT EQUAL -1) AND (NAME_HAS_TILDE GREATER -1))
		set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME '${EXTERNAL_NAME}')
	else()
		set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${EXTERNAL_NAME})
	endif()

	# Defines the output path of the external.
  set_target_properties(${PROJECT_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY ${PD_OUPUT_PATH})
	set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${PD_OUPUT_PATH})
	set_target_properties(${PROJECT_NAME} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${PD_OUPUT_PATH})
	foreach(OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES})
		    string(TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG)
			  set_target_properties(${PROJECT_NAME} PROPERTIES LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${PD_OUPUT_PATH})
				set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${PD_OUPUT_PATH})
				set_target_properties(${PROJECT_NAME} PROPERTIES ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} ${PD_OUPUT_PATH})
	endforeach(OUTPUTCONFIG CMAKE_CONFIGURATION_TYPES)

endfunction(add_pd_external)

# The macro defines the output path of the externals.
macro(set_pd_external_path EXTERNAL_PATH)
	set(PD_OUPUT_PATH ${EXTERNAL_PATH})
endmacro(set_pd_external_path)

# The macro sets the location of Pure Data sources.
macro(set_pd_sources PD_SOURCES)
	set(PD_SOURCES_PATH ${PD_SOURCES})
endmacro(set_pd_sources)
