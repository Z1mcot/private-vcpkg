vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Z1mcot/tgbot-lib
    REF v1.0.5
    SHA512 d1d4f937f313438898bd56eaac288f84530ce72d122717bea5444123e50b60e0f2aec0febf5c5814c17ff1df0d7569499f0cc449bbdb4ee7ed84bf43b1e4f614
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
