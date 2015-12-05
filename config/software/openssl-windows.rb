#
# Copyright 2015 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "openssl-windows"
default_version "1.0.1q"

source url: "https://github.com/jaym/windows-openssl-build/releases/download/openssl-1.0.1q/openssl-1.0.1q-x86-windows.tar.lzma",
       md5: "3970fb1323b89c068525d60211670528"

relative_path 'bin'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  copy "openssl.exe", "#{install_dir}/embedded/bin/openssl.exe"
end
