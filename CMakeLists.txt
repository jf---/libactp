cmake_minimum_required(VERSION 3.2)

set(CMAKE_CXX_FLAGS "-stdlib=libc++")

project(freesteel-python)


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
        src/bolts/Partition1.cpp
        src/bolts/Partition1.h
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
        src/cages/PathXboxed.cpp
        src/cages/pathxseries.h
        src/cages/S1stockcircle.cpp
        src/cages/S2weave.cpp
        src/cages/S2weave.h
        src/cages/SurfX.cpp
        src/cages/SurfX.h
        src/cages/SurfXboxed.cpp
        src/cages/SurfXboxed.h
        )
source_group("cages" FILES ${SOURCES_files_cages})

set(SOURCES_cages
        ${SOURCES_files_cages}
        )


set(SOURCES_files_pits
        src/pits/CircCrossingStructure.h
        src/pits/CoreRoughGeneration.cpp
        src/pits/CoreRoughGeneration.h
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

set(freesteel_src
        ${SOURCES_bolts}
        ${SOURCES_cages}
        ${SOURCES_pits}
        # GUI crap
        #${SOURCES_visuals}
        # more GUI crap
        #${SOURCES_xenon}
        ${SOURCES_files_}
        )

set(SOURCES_python
        PythonLib/PythonStuff.cpp
        )
#source_group("xenon" FILES ${SOURCES_files_xenon})


# Build libactp

#add_library(
#        freesteel
#        STATIC
#        SHARED
#        ${freesteel_src}
#)

#target_include_directories(freesteel PRIVATE
#        ${CMAKE_CURRENT_SOURCE_DIR}/src
#        )

# Build python wrapper



find_package(PythonLibs)
find_package(PythonInterp)


execute_process(COMMAND ${PYTHON_EXECUTABLE} -c "from __future__ import print_function; from distutils.sysconfig import get_python_lib; import os;print(get_python_lib())" OUTPUT_VARIABLE python_lib OUTPUT_STRIP_TRAILING_WHITESPACE )
set(ACTP_INSTALL_DIRECTORY ${python_lib} CACHE PATH "ACTP install directory" )
set(BUILD_DIR ${CMAKE_BINARY_DIR}/${LIBRARY_OUTPUT_PATH})

INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})

add_library(
    actp
    SHARED
    ${SOURCES_python}
    ${freesteel_src}
)

# libactp -> actp
set_target_properties(actp PROPERTIES PREFIX "")
# actp.dylib -> actp.so
set_target_properties(actp PROPERTIES SUFFIX ".so")

target_include_directories(actp PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        ${freesteel_src}
        )

target_link_libraries(actp ${PYTHON_LIBRARIES})

SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

install(FILES ${BUILD_DIR}/actp.so DESTINATION ${ACTP_INSTALL_DIRECTORY} )