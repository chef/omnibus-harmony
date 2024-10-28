pkg_name=hello-omnibus-harmony
pkg_origin=chefops
pkg_maintainer="The Chef Best team, training"
pkg_license=('Apache-2.0')
pkg_build_deps=(core/go22)
pkg_deps=()
pkg_bin_dirs=(bin)

pkg_version() {
  echo "--- pgk_version function"
  echo "${SRC_PATH}"
  ls -lah "${SRC_PATH}"
  cat "${SRC_PATH}/VERSION"
  VERSION=$(${SRC_PATH}/VERSION)
}

do_before() {
  echo "--- do_before function"
  update_pkg_version
  rm -rf "$REPO_PATH"
}


do_download() {
  echo "--- do_download function"
  return 0
}

do_setup_environment() {
  echo "--- do_setup_environment function"
  REPO_PATH="$HAB_CACHE_SRC_PATH/$pkg_dirname"
  set_runtime_env APP_VERSION "$pkg_version"
  set_runtime_env APP_RELEASE "$pkg_release"
}

do_build() {
  echo --- "do_build function"
  # By default, we're in the directory in which the Studio was entered
  # (in this case, presumably the project root), so we can run commands
  # as though we were in that same directory. By the time we reach this
  # callback, `npm` will have been installed for us.

  pwd
  ls -lah
  cp -R src $REPO_PATH
  cd $REPO_PATH
  cd src
  go build -o "${pkg_name}" 
  mv  "${pkg_name}" "../${pkg_name}" 
  return 0
}

do_install() {
  echo "--- do_install function"
  # The `pkg_prefix` variable contains the fully-qualified Studio-relative path to
  # a specific build run (e.g., /hab/pkgs/<YOUR_ORIGIN>/sample-node-app/1.1.0/20180620174915).
  # In this callback, we copy the files that our application requires at runtime
  # into that directory, and once this step completes, Habitat will take
  # over to produce the finished package as a .hart file.

  mkdir -p "${pkg_prefix}/bin"
  mv "${REPO_PATH}/${pkg_name}" "${pkg_prefix}/bin"
  return 0
}