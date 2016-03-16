set(Boost_USE_STATIC_LIBS OFF)
set(Boost_USE_MULTITHREADED ON) 

find_package(Boost COMPONENTS system program_options log REQUIRED)
if(Boost_FOUND)
  message("Boost: VERSION=${Boost_VERSION} LIBVERSION=${Boost_LIB_VERSION} MAJOR=${Boost_MAJOR_VERSION} MINOR=${Boost_MINOR_VERSION}")
endif()

set(BOOST_SOURCE "${CMAKE_SOURCE_DIR}/../boost_1_60_0")

if(EXISTS "${BOOST_SOURCE}/boost")
	message("Found boost source dir in: ${BOOST_SOURCE}")
  include_directories("${CMAKE_SOURCE_DIR}/../boost_1_60_0")

  set(BOOST_system_SOURCES ${BOOST_SOURCE}/libs/system/src/error_code.cpp )
	add_library(boost_system STATIC ${BOOST_system_SOURCES})

#  set(BOOST_program_options_SOURCES ${BOOST_SOURCE}/libs/program_options/src/cmdline.cpp ${BOOST_SOURCE}/libs/program_options/src/config_file.cpp ${BOOST_SOURCE}/libs/program_options/src/convert.cpp ${BOOST_SOURCE}/libs/program_options/src/options_description.cpp ${BOOST_SOURCE}/libs/program_options/src/parsers.cpp ${BOOST_SOURCE}/libs/program_options/src/positional_options.cpp ${BOOST_SOURCE}/libs/program_options/src/split.cpp ${BOOST_SOURCE}/libs/program_options/src/utf8_codecvt_facet.cpp ${BOOST_SOURCE}/libs/program_options/src/value_semantic.cpp ${BOOST_SOURCE}/libs/program_options/src/variables_map.cpp ${BOOST_SOURCE}/libs/program_options/src/winmain.cpp )
#	add_library(boost_program_options ${BOOST_program_options_SOURCES})
#	
  set(BOOST_log_SOURCES ${BOOST_SOURCE}/libs/log/config/visibility/visibility.cpp ${BOOST_SOURCE}/libs/log/src/format_parser.cpp ${BOOST_SOURCE}/libs/log/src/thread_id.cpp ${BOOST_SOURCE}/libs/log/src/attribute_name.cpp ${BOOST_SOURCE}/libs/log/src/attribute_set.cpp ${BOOST_SOURCE}/libs/log/src/attribute_value_set.cpp ${BOOST_SOURCE}/libs/log/src/code_conversion.cpp ${BOOST_SOURCE}/libs/log/src/core.cpp ${BOOST_SOURCE}/libs/log/src/date_time_format_parser.cpp ${BOOST_SOURCE}/libs/log/src/default_attribute_names.cpp ${BOOST_SOURCE}/libs/log/src/default_filter_factory.cpp ${BOOST_SOURCE}/libs/log/src/default_formatter_factory.cpp ${BOOST_SOURCE}/libs/log/src/default_sink.cpp ${BOOST_SOURCE}/libs/log/src/dump.cpp ${BOOST_SOURCE}/libs/log/src/event.cpp ${BOOST_SOURCE}/libs/log/src/exceptions.cpp ${BOOST_SOURCE}/libs/log/src/filter_parser.cpp ${BOOST_SOURCE}/libs/log/src/formatter_parser.cpp ${BOOST_SOURCE}/libs/log/src/global_logger_storage.cpp ${BOOST_SOURCE}/libs/log/src/init_from_settings.cpp ${BOOST_SOURCE}/libs/log/src/init_from_stream.cpp ${BOOST_SOURCE}/libs/log/src/light_rw_mutex.cpp ${BOOST_SOURCE}/libs/log/src/matches_relation_factory.cpp ${BOOST_SOURCE}/libs/log/src/named_scope.cpp ${BOOST_SOURCE}/libs/log/src/named_scope_format_parser.cpp ${BOOST_SOURCE}/libs/log/src/once_block.cpp ${BOOST_SOURCE}/libs/log/src/parser_utils.cpp ${BOOST_SOURCE}/libs/log/src/process_id.cpp ${BOOST_SOURCE}/libs/log/src/process_name.cpp ${BOOST_SOURCE}/libs/log/src/record_ostream.cpp ${BOOST_SOURCE}/libs/log/src/settings_parser.cpp ${BOOST_SOURCE}/libs/log/src/severity_level.cpp ${BOOST_SOURCE}/libs/log/src/spirit_encoding.cpp ${BOOST_SOURCE}/libs/log/src/syslog_backend.cpp ${BOOST_SOURCE}/libs/log/src/text_file_backend.cpp ${BOOST_SOURCE}/libs/log/src/text_multifile_backend.cpp ${BOOST_SOURCE}/libs/log/src/text_ostream_backend.cpp ${BOOST_SOURCE}/libs/log/src/threadsafe_queue.cpp ${BOOST_SOURCE}/libs/log/src/thread_specific.cpp ${BOOST_SOURCE}/libs/log/src/timer.cpp ${BOOST_SOURCE}/libs/log/src/timestamp.cpp ${BOOST_SOURCE}/libs/log/src/trivial.cpp ${BOOST_SOURCE}/libs/log/src/unhandled_exception_count.cpp 
#	${BOOST_SOURCE}/libs/log/src/event_log_backend.cpp
	)
	set(BOOST_log_SOURCES ${BOOST_log_SOURCES}
	#	${BOOST_SOURCE}/libs/log/config/x86-ext/avx2.cpp ${BOOST_SOURCE}/libs/log/config/x86-ext/ssse3.cpp 
#		${BOOST_SOURCE}/libs/log/src/dump_avx2.cpp ${BOOST_SOURCE}/libs/log/src/dump_ssse3.cpp 
	#${BOOST_SOURCE}/libs/log/src/debug_output_backend.cpp
	)
add_library(boost_log STATIC ${BOOST_log_SOURCES})

	set(EXTRA_LIBRARIES boost_system boost_program_options boost_log)
#set(EXTRA_SOURCES ${BOOST_system_SOURCES} ${BOOST_program_options_SOURCES} ${BOOST_log_SOURCES})
  link_directories("${CMAKE_BINARY_DIR}")
	#set(CMAKE_EXE_LINKER_FLAGS "-Wl,--whole-archive")
	#set(CMAKE_EXE_LINKER_FLAGS "-Wl,--whole-archive")
else()
	if(EXISTS "${Boost_INCLUDE_DIR}")
    include_directories(${Boost_INCLUDE_DIR})
	endif()
	set(EXTRA_LIBRARIES ${Boost_LIBRARIES})
endif()
