vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Z1mcot/tgbot-lib 
    REF v1.0.4
    SHA512 2be8c3f365d1e35400f044aaa5aef79ee9e190e68f800187dafec2174e1458e4686094ba55e9a5ed44cffc03936991daf06e97dbbe3b97ae7f21d400c29707e2
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME tgbot-lib CONFIG_PATH lib/cmake/tgbot-lib)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
