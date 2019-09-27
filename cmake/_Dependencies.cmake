#
# cmake/_Dependencies.cmake is generated by `mulle-sde`. Edits will be lost.
# Disable generation of this file with:
#   mulle-sde environment  --global set MULLE_SOURCETREE_TO_CMAKE_DEPENDENCIES_FILE DISABLE
if( MULLE_TRACE_INCLUDE)
   message( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

#
# Generated from sourcetree: zlib;no-all-load,no-import,no-inplace,no-os-darwin,no-public,no-rootheader;z
# Disable with: `mulle-sourcetree mark zlib no-link`
#
if( NOT ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
   if( NOT Z_LIBRARY)
      find_library( Z_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}z${CMAKE_STATIC_LIBRARY_SUFFIX} z NO_CMAKE_SYSTEM_PATH)
      message( STATUS "Z_LIBRARY is ${Z_LIBRARY}")
      #
      # The order looks ascending, but due to the way this file is read
      # it ends up being descending, which is what we need.
      #
      if( Z_LIBRARY)
         #
         # Add to Z_LIBRARY list.
         # Disable with: `mulle-sourcetree mark zlib no-cmakeadd`
         #
         set( DEPENDENCY_LIBRARIES
            ${DEPENDENCY_LIBRARIES}
            ${Z_LIBRARY}
            CACHE INTERNAL "need to cache this"
         )
         #
         # Inherit ObjC loader and link dependency info.
         # Disable with: `mulle-sourcetree mark zlib no-cmakeinherit`
         #
         # // temporarily expand CMAKE_MODULE_PATH
         get_filename_component( _TMP_Z_ROOT "${Z_LIBRARY}" DIRECTORY)
         get_filename_component( _TMP_Z_ROOT "${_TMP_Z_ROOT}" DIRECTORY)
         #
         #
         # Search for "DependenciesAndLibraries.cmake" to include.
         # Disable with: `mulle-sourcetree mark zlib no-cmakedependency`
         #
         foreach( _TMP_Z_NAME "z")
            set( _TMP_Z_DIR "${_TMP_Z_ROOT}/include/${_TMP_Z_NAME}/cmake")
            # use explicit path to avoid "surprises"
            if( EXISTS "${_TMP_Z_DIR}/DependenciesAndLibraries.cmake")
               unset( Z_DEFINITIONS)
               list( INSERT CMAKE_MODULE_PATH 0 "${_TMP_Z_DIR}")
               # we only want top level INHERIT_OBJC_LOADERS, so disable them
               if( NOT NO_INHERIT_OBJC_LOADERS)
                  set( NO_INHERIT_OBJC_LOADERS OFF)
               endif()
               list( APPEND _TMP_INHERIT_OBJC_LOADERS ${NO_INHERIT_OBJC_LOADERS})
               set( NO_INHERIT_OBJC_LOADERS ON)
               #
               include( "${_TMP_Z_DIR}/DependenciesAndLibraries.cmake")
               #
               list( GET _TMP_INHERIT_OBJC_LOADERS -1 NO_INHERIT_OBJC_LOADERS)
               list( REMOVE_AT _TMP_INHERIT_OBJC_LOADERS -1)
               #
               list( REMOVE_ITEM CMAKE_MODULE_PATH "${_TMP_Z_DIR}")
               set( INHERITED_DEFINITIONS
                  ${INHERITED_DEFINITIONS}
                  ${Z_DEFINITIONS}
                  CACHE INTERNAL "need to cache this"
               )
               break()
            else()
               message( STATUS "${_TMP_Z_DIR}/DependenciesAndLibraries.cmake not found")
            endif()
         endforeach()
      else()
         message( FATAL_ERROR "Z_LIBRARY was not found")
      endif()
   endif()
endif()


#
# Generated from sourcetree: Foundation;no-fetch-darwin,no-os-darwin;
# Disable with: `mulle-sourcetree mark Foundation no-link`
#
if( NOT ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
   if( NOT FOUNDATION_LIBRARY)
      find_library( FOUNDATION_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}Foundation${CMAKE_STATIC_LIBRARY_SUFFIX} Foundation NO_CMAKE_SYSTEM_PATH)
      message( STATUS "FOUNDATION_LIBRARY is ${FOUNDATION_LIBRARY}")
      #
      # The order looks ascending, but due to the way this file is read
      # it ends up being descending, which is what we need.
      #
      if( FOUNDATION_LIBRARY)
         #
         # Add to FOUNDATION_LIBRARY list.
         # Disable with: `mulle-sourcetree mark Foundation no-cmakeadd`
         #
         set( ALL_LOAD_DEPENDENCY_LIBRARIES
            ${ALL_LOAD_DEPENDENCY_LIBRARIES}
            ${FOUNDATION_LIBRARY}
            CACHE INTERNAL "need to cache this"
         )
         #
         # Inherit ObjC loader and link dependency info.
         # Disable with: `mulle-sourcetree mark Foundation no-cmakeinherit`
         #
         # // temporarily expand CMAKE_MODULE_PATH
         get_filename_component( _TMP_FOUNDATION_ROOT "${FOUNDATION_LIBRARY}" DIRECTORY)
         get_filename_component( _TMP_FOUNDATION_ROOT "${_TMP_FOUNDATION_ROOT}" DIRECTORY)
         #
         #
         # Search for "DependenciesAndLibraries.cmake" to include.
         # Disable with: `mulle-sourcetree mark Foundation no-cmakedependency`
         #
         foreach( _TMP_FOUNDATION_NAME "Foundation")
            set( _TMP_FOUNDATION_DIR "${_TMP_FOUNDATION_ROOT}/include/${_TMP_FOUNDATION_NAME}/cmake")
            # use explicit path to avoid "surprises"
            if( EXISTS "${_TMP_FOUNDATION_DIR}/DependenciesAndLibraries.cmake")
               unset( FOUNDATION_DEFINITIONS)
               list( INSERT CMAKE_MODULE_PATH 0 "${_TMP_FOUNDATION_DIR}")
               # we only want top level INHERIT_OBJC_LOADERS, so disable them
               if( NOT NO_INHERIT_OBJC_LOADERS)
                  set( NO_INHERIT_OBJC_LOADERS OFF)
               endif()
               list( APPEND _TMP_INHERIT_OBJC_LOADERS ${NO_INHERIT_OBJC_LOADERS})
               set( NO_INHERIT_OBJC_LOADERS ON)
               #
               include( "${_TMP_FOUNDATION_DIR}/DependenciesAndLibraries.cmake")
               #
               list( GET _TMP_INHERIT_OBJC_LOADERS -1 NO_INHERIT_OBJC_LOADERS)
               list( REMOVE_AT _TMP_INHERIT_OBJC_LOADERS -1)
               #
               list( REMOVE_ITEM CMAKE_MODULE_PATH "${_TMP_FOUNDATION_DIR}")
               set( INHERITED_DEFINITIONS
                  ${INHERITED_DEFINITIONS}
                  ${FOUNDATION_DEFINITIONS}
                  CACHE INTERNAL "need to cache this"
               )
               break()
            else()
               message( STATUS "${_TMP_FOUNDATION_DIR}/DependenciesAndLibraries.cmake not found")
            endif()
         endforeach()
         #
         # Search for "objc-loader.inc" in include directory.
         # Disable with: `mulle-sourcetree mark Foundation no-cmakeloader`
         #
         if( NOT NO_INHERIT_OBJC_LOADERS)
            foreach( _TMP_FOUNDATION_NAME "Foundation")
               set( _TMP_FOUNDATION_FILE "${_TMP_FOUNDATION_ROOT}/include/${_TMP_FOUNDATION_NAME}/MulleObjCLoader+${_TMP_FOUNDATION_NAME}.h")
               if( EXISTS "${_TMP_FOUNDATION_FILE}")
                  set( INHERITED_OBJC_LOADERS
                     ${INHERITED_OBJC_LOADERS}
                     ${_TMP_FOUNDATION_FILE}
                     CACHE INTERNAL "need to cache this"
                  )
                  break()
               endif()
            endforeach()
         endif()
      else()
         message( FATAL_ERROR "FOUNDATION_LIBRARY was not found")
      endif()
   endif()
endif()


#
# Generated from sourcetree: Foundation-startup;no-dynamic-link,no-header,no-intermediate-link,no-os-darwin,no-singlephase;
# Disable with: `mulle-sourcetree mark Foundation-startup no-link`
#
if( NOT ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
   if( NOT FOUNDATION_STARTUP_LIBRARY)
      find_library( FOUNDATION_STARTUP_LIBRARY NAMES ${CMAKE_STATIC_LIBRARY_PREFIX}Foundation-startup${CMAKE_STATIC_LIBRARY_SUFFIX} Foundation-startup NO_CMAKE_SYSTEM_PATH)
      message( STATUS "FOUNDATION_STARTUP_LIBRARY is ${FOUNDATION_STARTUP_LIBRARY}")
      #
      # The order looks ascending, but due to the way this file is read
      # it ends up being descending, which is what we need.
      #
      if( FOUNDATION_STARTUP_LIBRARY)
         #
         # Add to FOUNDATION_STARTUP_LIBRARY list.
         # Disable with: `mulle-sourcetree mark Foundation-startup no-cmakeadd`
         #
         set( STARTUP_ALL_LOAD_DEPENDENCY_LIBRARIES
            ${STARTUP_ALL_LOAD_DEPENDENCY_LIBRARIES}
            ${FOUNDATION_STARTUP_LIBRARY}
            CACHE INTERNAL "need to cache this"
         )
         #
         # Inherit ObjC loader and link dependency info.
         # Disable with: `mulle-sourcetree mark Foundation-startup no-cmakeinherit`
         #
         # // temporarily expand CMAKE_MODULE_PATH
         get_filename_component( _TMP_FOUNDATION_STARTUP_ROOT "${FOUNDATION_STARTUP_LIBRARY}" DIRECTORY)
         get_filename_component( _TMP_FOUNDATION_STARTUP_ROOT "${_TMP_FOUNDATION_STARTUP_ROOT}" DIRECTORY)
         #
         #
         # Search for "DependenciesAndLibraries.cmake" to include.
         # Disable with: `mulle-sourcetree mark Foundation-startup no-cmakedependency`
         #
         foreach( _TMP_FOUNDATION_STARTUP_NAME "Foundation-startup")
            set( _TMP_FOUNDATION_STARTUP_DIR "${_TMP_FOUNDATION_STARTUP_ROOT}/include/${_TMP_FOUNDATION_STARTUP_NAME}/cmake")
            # use explicit path to avoid "surprises"
            if( EXISTS "${_TMP_FOUNDATION_STARTUP_DIR}/DependenciesAndLibraries.cmake")
               unset( FOUNDATION_STARTUP_DEFINITIONS)
               list( INSERT CMAKE_MODULE_PATH 0 "${_TMP_FOUNDATION_STARTUP_DIR}")
               # we only want top level INHERIT_OBJC_LOADERS, so disable them
               if( NOT NO_INHERIT_OBJC_LOADERS)
                  set( NO_INHERIT_OBJC_LOADERS OFF)
               endif()
               list( APPEND _TMP_INHERIT_OBJC_LOADERS ${NO_INHERIT_OBJC_LOADERS})
               set( NO_INHERIT_OBJC_LOADERS ON)
               #
               include( "${_TMP_FOUNDATION_STARTUP_DIR}/DependenciesAndLibraries.cmake")
               #
               list( GET _TMP_INHERIT_OBJC_LOADERS -1 NO_INHERIT_OBJC_LOADERS)
               list( REMOVE_AT _TMP_INHERIT_OBJC_LOADERS -1)
               #
               list( REMOVE_ITEM CMAKE_MODULE_PATH "${_TMP_FOUNDATION_STARTUP_DIR}")
               set( INHERITED_DEFINITIONS
                  ${INHERITED_DEFINITIONS}
                  ${FOUNDATION_STARTUP_DEFINITIONS}
                  CACHE INTERNAL "need to cache this"
               )
               break()
            else()
               message( STATUS "${_TMP_FOUNDATION_STARTUP_DIR}/DependenciesAndLibraries.cmake not found")
            endif()
         endforeach()
         #
         # Search for "objc-loader.inc" in include directory.
         # Disable with: `mulle-sourcetree mark Foundation-startup no-cmakeloader`
         #
         if( NOT NO_INHERIT_OBJC_LOADERS)
            foreach( _TMP_FOUNDATION_STARTUP_NAME "Foundation-startup")
               set( _TMP_FOUNDATION_STARTUP_FILE "${_TMP_FOUNDATION_STARTUP_ROOT}/include/${_TMP_FOUNDATION_STARTUP_NAME}/MulleObjCLoader+${_TMP_FOUNDATION_STARTUP_NAME}.h")
               if( EXISTS "${_TMP_FOUNDATION_STARTUP_FILE}")
                  set( INHERITED_OBJC_LOADERS
                     ${INHERITED_OBJC_LOADERS}
                     ${_TMP_FOUNDATION_STARTUP_FILE}
                     CACHE INTERNAL "need to cache this"
                  )
                  break()
               endif()
            endforeach()
         endif()
      else()
         message( FATAL_ERROR "FOUNDATION_STARTUP_LIBRARY was not found")
      endif()
   endif()
endif()