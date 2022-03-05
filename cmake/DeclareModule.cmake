function(declare_module NAME)
    cmake_parse_arguments(
        PARSE_ARGV 0 "DM" "INTERNAL_INCLUDE" "KIND;TARGET_NAME;OUTPUT_NAME"
        "SOURCES;ABSOLUTE_SOURCES;DEPENDS;INCLUDES"
    )
    if(NOT DM_KIND)
        message(FATAL_ERROR "Missing module kind")
    endif()
    if(DM_KIND STREQUAL "library")
        set(DM_PUBLICITY PUBLIC)
    elseif(DM_KIND STREQUAL "executable")
        set(DM_PUBLICITY PRIVATE)
    elseif(DM_KIND STREQUAL "interface")
        set(DM_KIND "library")
        set(DM_INTERFACEKW INTERFACE)
        set(DM_PUBLICITY INTERFACE)
    else()
        message(FATAL_ERROR "Unknown module kind")
    endif()
    if(DM_TARGET_NAME)
        set(DM_TARGET_NAME ${DM_TARGET_NAME})
    else()
        set(DM_TARGET_NAME ${NAME})
    endif()
    list(TRANSFORM DM_SOURCES PREPEND "modules/${NAME}/source/")
    cmake_language(
        CALL "add_${DM_KIND}" ${DM_TARGET_NAME} ${DM_INTERFACEKW} ${DM_SOURCES}
        ${DM_ABSOLUTE_SOURCES}
    )
    target_link_libraries(${DM_TARGET_NAME} ${DM_PUBLICITY} ${DM_DEPENDS})
    target_compile_features(${DM_TARGET_NAME} ${DM_PUBLICITY} cxx_std_20)
    target_include_directories(
        ${DM_TARGET_NAME} ${DM_PUBLICITY} ${DM_INCLUDES}
        "modules/${NAME}/include"
    )
    if(DM_INTERNAL_INCLUDE)
        target_include_directories(
            ${DM_TARGET_NAME} PRIVATE "modules/${NAME}/internal_include"
        )
    endif()
    if(DM_OUTPUT_NAME)
        set_target_properties(
            ${DM_TARGET_NAME} PROPERTIES OUTPUT_NAME ${DM_OUTPUT_NAME}
        )
    endif()
endfunction()
