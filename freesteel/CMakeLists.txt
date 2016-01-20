cmake_minimum_required(VERSION 3.2)

set(CMAKE_CXX_FLAGS "-stdlib=libc++")

project( freesteel-python )


include_directories(${PYTHON_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

#include(${V2C_HOOK_PROJECT} OPTIONAL)

    set(SOURCES_files_bolts
      src/bolts/bolts.h
      src/bolts/debugfuncs.h
      src/bolts/I1.h
      src/bolts/P2.h
      src/bolts/P3.h
      src/bolts/S1.cpp
      src/bolts/S1.h
      src/bolts/smallfuncs.h
      src/bolts/vo.h
    )
    source_group("bolts" FILES ${SOURCES_files_bolts})

    set(SOURCES_bolts
      ${SOURCES_files_bolts}
    )

    set(SOURCES_files_cages
      src/cages/Area2_gen.h
      src/cages/cages.h
      src/cages/PathX.cpp
      src/cages/PathX.h
      src/cages/S1stockcircle.cpp
      src/cages/S2weave.cpp
      src/cages/S2weave.h
      src/cages/SurfX.cpp
      src/cages/SurfX.h
    )
    source_group("cages" FILES ${SOURCES_files_cages})

    set(SOURCES_cages
      ${SOURCES_files_cages}
    )



    set(SOURCES_files_pits
      src/pits/CircCrossingStructure.h
      src/pits/NormRay_gen.cpp
      src/pits/pits.h
      src/pits/S2weaveCell.cpp
      src/pits/S2weaveCell.h
      src/pits/S2weaveCellLinearCut.cpp
      src/pits/S2weaveCellLinearCut.h
      src/pits/S2weaveCellLinearCutTraverse.cpp
      src/pits/S2weaveCircle.cpp
      src/pits/SLi_gen.cpp
      src/pits/SLi_gen.h
      src/pits/SurfXbuildcomponents.cpp
      src/pits/SurfXSliceRay.cpp
      # requires VTK
      #src/pits/toolshape.cpp
      #src/pits/toolshape.h
    )
    source_group("pits" FILES ${SOURCES_files_pits})

    set(SOURCES_pits
      ${SOURCES_files_pits}
    )

    set(SOURCES_files_visuals
      src/visuals/fsvtkToolpathMapper.cpp
      src/visuals/fsvtkToolpathMapper.h
      src/visuals/GeometryStuffTogether.cpp
      src/visuals/gst.h
      src/visuals/gstsurface.cpp
      src/visuals/gstsurface.h
      src/visuals/MakeToolpath.cpp
      src/visuals/MakeToolpath.h
    )
    source_group("visuals" FILES ${SOURCES_files_visuals})

    set(SOURCES_visuals
      ${SOURCES_files_visuals}
    )

    set(SOURCES_files_xenon
      src/xenon/AnimationFrame.cpp
      src/xenon/AnimationFrame.h
      src/xenon/BoundingBoxDlg.cpp
      src/xenon/BoundingBoxDlg.h
      src/xenon/coreroughdlg.cpp
      src/xenon/coreroughdlg.h
      src/xenon/wxhelpers.cpp
      src/xenon/wxhelpers.h
      src/xenon/wxVTKRenderWindowInteractor.cxx
      src/xenon/wxVTKRenderWindowInteractor.h
    )
    source_group("xenon" FILES ${SOURCES_files_xenon})

    set(SOURCES_xenon
      ${SOURCES_files_xenon}
    )



  set(pyfreesteel
    freesteel-python.cpp
    freesteel-python.h
    freesteel-python_wrap.cxx
  )

 set(freesteel
    ${SOURCES_bolts}
    ${SOURCES_cages}
    ${SOURCES_pits}
    # GUI crap
    #${SOURCES_visuals}
    # more GUI crap
    #${SOURCES_xenon}
    ${SOURCES_files_}
  )

    add_library(
      freesteel
      #MODULE
      STATIC
      ${freesteel}
    )

    target_include_directories(freesteel PRIVATE
      ${CMAKE_CURRENT_SOURCE_DIR}/src
    )


#include_directories(BEFORE ${PROJECT_SOURCE_DIR})
#
##include(${V2C_HOOK_POST_SOURCES} OPTIONAL)
#
##if(TARGET freesteel-python)
##
##  set_property(TARGET freesteel-python APPEND PROPERTY COMPILE_DEFINITIONS_DEBUG
##    FREESTEELPYTHON_EXPORTS
##    MDEBUG
##    WIN32
##    WINVER=0x400
##    WXDEBUG=1
##    WXUSINGDLL=1
##    _DEBUG
##    _MT
##    _USRDLL
##    _WINDOWS
##    __WXDEBUG__
##    wxUSE_GUI=1
##  )
##endif(TARGET freesteel-python)
#
#if(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE STREQUAL "Release")
#
#  include_directories(
#    #$(VTK)
#    #$(VTK)/Common
#    #$(VTK)/Filtering
#    #$(VTK)/Graphics
#    #$(VTK)/Hybrid
#    #$(VTK)/IO
#    #$(VTK)/Imaging
#    #$(VTK)/Patented
#    #$(VTK)/Rendering
#    #$(WXWINDOWS)/include
#    #$(WXWINDOWS)/lib/mswdll
#    src
#  )
#
#  # hook include after all definitions have been made
#  # (but _before_ target is created using the source list!)
#  include(${V2C_HOOK_POST_DEFINITIONS} OPTIONAL)
#
#  set(SOURCES
#    ${SOURCES_}
#    #${V2C_SOURCES}
#  )
#
##  link_directories(
##    #$(VTK)/bin/Release
##    #$(WXWINDOWS)/lib
##    ${V2C_LIB_DIRS}
##  )
#
#  add_library( freesteel-python SHARED ${SOURCES} )
#
#  target_link_libraries(freesteel-python
#    #wxmsw24
#    #vtkCommon
#    #vtkRendering
#    #vtkGraphics
#    #vtkFiltering
#    #vtkIO
#    #vtkImaging
#    #odbc32
#    #odbccp32
#    #comctl32
#    #rpcrt4
#    #wsock32
#    #opengl32
#    ${V2C_LIBS}
#  )
#
#  # e.g. to be used for tweaking target properties etc.
#  include(${V2C_HOOK_POST_TARGET} OPTIONAL)
#endif(CMAKE_CONFIGURATION_TYPES OR CMAKE_BUILD_TYPE STREQUAL "Release")
#if(TARGET freesteel-python)
#
#  set_property(TARGET freesteel-python APPEND PROPERTY COMPILE_DEFINITIONS_RELEASE
#    FREESTEELPYTHON_EXPORTS
#    #NDEBUG
#    #WIN32
#    #_USRDLL
#    #_WINDOWS
#  )
#endif(TARGET freesteel-python)
#
##set_property(TARGET freesteel-python PROPERTY PROJECT_LABEL "freesteel-python")
##set_property(TARGET freesteel-python PROPERTY VS_KEYWORD "Win32Proj")
#
##v2c_rebuild_on_update(freesteel-python "${CMAKE_CURRENT_SOURCE_DIR}/freesteel-python.vcproj" ${CMAKE_CURRENT_LIST_FILE} "/Users/jelleferinga/GIT/vcproj2cmake-code/scripts/vcproj2cmake.rb" ".")
#
##include(${V2C_HOOK_POST} OPTIONAL)
