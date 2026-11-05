add_executable(db2dump
  Main.cpp
)

target_link_libraries(db2dump
  PRIVATE
    trinity-core-interface
  PUBLIC
    extractor_common)

set_target_properties(db2dump
    PROPERTIES
      FOLDER
        "tools")
