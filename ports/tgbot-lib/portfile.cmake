vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Z1mcot/tgbot-lib 
    REF v1.0.4
    SHA512 ae36219f7ebc4b0edc56575640109f48dc7b2c166c0e22c2b14c7bfe387b2fb1f18a78df6f60ae8965b3d290bb51f388e028924b0c0da3cd736f5209bc4f7db5 
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
