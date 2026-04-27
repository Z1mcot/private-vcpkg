vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Z1mcot/tgbot-lib
    REF v1.1.1
    SHA512 dbe02c012539bf70b200d1a36ebaacb33a9c4486e6c8e1e4b30c8642aa712879d2f2e85f13e2d0a5b5589bb6f1924454d9548ed0779e9583e01da23409a378a0
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
