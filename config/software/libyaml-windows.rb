#
# Copyright 2014 Chef Software, Inc.
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

name "libyaml-windows"
default_version "0.1.6"

source url: "http://packages.openknapsack.org/libyaml/libyaml-0.1.6-x86-windows.tar.lzma",
       md5: "8bb5d8e43cf18ec48b4751bdd0111c84"

# ugh...See https://github.com/chef/omnibus-harmony/pull/10#issuecomment-161490982
relative_path 'bin'

build do
  env = with_standard_compiler_flags(with_embedded_path)

  copy "libyaml-0-2.dll", "#{install_dir}/embedded/bin/libyaml-0-2.dll"
end
