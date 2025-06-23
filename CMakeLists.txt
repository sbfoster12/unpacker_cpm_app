# Download CPM.cmake if not already present
cmake_minimum_required(VERSION 3.14)

# Create project
project(my_app)

# C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set OS architecture
set(CMAKE_OSX_ARCHITECTURES "arm64")

# Create installation directories
set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}")

# Set the path for where to look for the libraries of the installed target
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")

include(FetchContent)
FetchContent_Declare(
  CPM
  GIT_REPOSITORY https://github.com/cpm-cmake/CPM.cmake.git
  GIT_TAG v0.42.0
)
FetchContent_MakeAvailable(CPM)

# Add unpacker
CPMAddPackage(
  NAME unpacker
  GIT_REPOSITORY https://github.com/sbfoster12/unpacker.git
  GIT_TAG cpm
)

add_executable(my_app main.cpp)
target_link_libraries(my_app
    PRIVATE
        midas
        common_data_products
        nalu_data_products
        common_unpacking
        nalu_unpacking
)

# Install the executable
install(TARGETS my_app
        DESTINATION bin
)